'use strict';

require('console-stamp')(console, 'yyyy/mm/dd HH:MM:ss');
const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const api = require('./msaapi').api;
const getRequestOptions = require('./msaapi').getRequestOptions;

request(getRequestOptions(api.sneak.top, {}))
  .pipe(zlib.createGunzip())
  .pipe(bl(function (err, data) {
    data = JSON.parse(data.toString());
    console.log('--------------START------------------');
    console.log(data);
    if (data.response.error_code != 0) {
      console.log(`ERROR when ${api.search.top}`);
      return;
    }
  }));