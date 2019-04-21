'use strict';

require('console-stamp')(console, 'yyyy/mm/dd HH:MM:ss');
const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const api = require('./msaapi').api;
const msaapi = require('./msaapi');



request(msaapi.getRequestOptions(api.search.top, {}))
  .pipe(zlib.createGunzip())
  .pipe(bl(function (err, data) {
    console.log(err, data)
    data = JSON.parse(data.toString());
    console.log('--------------START------------------');
    if (data.response.error_code != 0) {
      console.log(`ERROR when ${api.search.top}`);
      return;
    }


    let {search: {searching}} = data;
    let unCollectedIds = searching.map(s => s.point_id);
    unCollectedIds = [1, 2, 3, 4, 5, 6].filter(s => !~unCollectedIds.indexOf(s));

    // Restarting treasures.
    unCollectedIds.map(id => {
      console.log(`restarting.... ${id}`);
      request(msaapi.getRequestOptions(api.search.start, { 'search_point': id }))
        .pipe(zlib.createGunzip())
        .pipe(bl(function (err, data) {
          data = JSON.parse(data.toString());
          if (data.response.error_code != 0) {
            console.log(`ERROR when restarting ${id}`);
          } else {
            console.log(`restarting.... ${id} done.`);
          }
        }));
    });



    // Collecting treasures.
    searching.map(s => {
      if (new Date(s.event) > Date.now() + 3600 * 1000) return;

      console.log(`collecting.... ${s.point_id}`);
      request(msaapi.getRequestOptions(api.search.get, { 'search_point': s.point_id }))
        .pipe(zlib.createGunzip())
        .pipe(bl(function (err, data) {
          data = JSON.parse(data.toString());
          if (data.response.error_code != 0) {
            console.log(`ERROR when collecting ${s.point_id}`);
          } else {
            console.log(`collecting.... ${s.point_id} done.`);
          }
        }));
    });
  }));
