'use strict';

require('console-stamp')(console, 'yyyy/mm/dd HH:MM:ss');
const cp = require('child_process');
const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const api = require('./msaapi').api;
const getRequestOptions = require('./msaapi').getRequestOptions;

function win1on1() {
  request(getRequestOptions(api.one_on_one.get_enemy, {}))
    .pipe(zlib.createGunzip())
    .pipe(bl(function(err, data) {
      data = JSON.parse(data.toString());
      if (data.response.error_code != 0) {
        console.log(`ERROR when ${api.one_on_one.get_enemy}`);
        return;
      }

      const { opponent } = data;
      const user_id = opponent[0].person.user;
      console.log(user_id);

      // XDDD
      //console.log(`Start, Win and Collecting items for stage: ${sneak_stage_id}`);
      job(`/bin/bash utils/1_on_1_start.sh ${user_id}`);
      //console.log(`Mission Complete stage: ${sneak_stage_id}`);
      
      //winOneSneak();
    }));
}

win1on1();

const job = (str, option) => {
  return cp.execSync(str, { cwd: __dirname }).toString();
};
