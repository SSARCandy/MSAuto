'use strict';

require('console-stamp')(console, 'yyyy/mm/dd HH:MM:ss');
const cp = require('child_process');
const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const api = require('./msaapi').api;
const getRequestOptions = require('./msaapi').getRequestOptions;

const affiliation = parseInt(process.argv[2], 10);
console.log(affiliation);

function start_pow() {
  request(getRequestOptions(api.pow.start, {
      affiliation: affiliation,
    }))
    .pipe(zlib.createGunzip())
    .pipe(bl(function(err, data) {
      data = JSON.parse(data.toString());
      if (data.response.error_code != 0) {
        console.log(`ERROR`);
        return;
      }

      const { pow: { stage_type }, user: { stamina } } = data;
      console.log(`stage_types=${stage_type}`);
      for (let type of stage_type) {
        console.log(`next stage type=${type}`);
        winOnePow(type);
      }
    }));
}

function resume_pow() {
  request(getRequestOptions(api.pow.top, {}))
    .pipe(zlib.createGunzip())
    .pipe(bl(function(err, data) {
      data = JSON.parse(data.toString());
      if (data.response.error_code != 0) {
        console.log(`ERROR`);
        return;
      }

      const { pow: { stage_type, stage_no }, user: { stamina } } = data;
      console.log(`stage_types=${stage_type}, current_stage=${stage_no}`);

      for (let i=parseInt(stage_no); i<=10; ++i) {
        console.log(`next stage type=${stage_type[i-1]}`);
        winOnePow(stage_type[i-1]);
      }
    }));
}

function winOnePow(type) {
  job(`/bin/bash utils/pow_start.sh ${type}`);
  job(`/bin/bash utils/pow_rescue.sh`);
}

if (affiliation === -1) {
  resume_pow();
} else {
  start_pow();
}

const job = (str, option) => {
  return cp.execSync(str, { cwd: __dirname }).toString();
};
