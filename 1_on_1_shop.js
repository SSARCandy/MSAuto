'use strict';

require('console-stamp')(console, 'yyyy/mm/dd HH:MM:ss');
const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const api = require('./msaapi').api;
const msaapi = require('./msaapi');

const want2buy = [
  //1629,
  //1665,
//  1497
  55,83
];

request(msaapi.getRequestOptions(api.one_on_one.shop.update, {}))
  .pipe(zlib.createGunzip())
  .pipe(bl(function (err, data) {
    data = JSON.parse(data.toString());
    console.log('--------------START------------------');
    if (data.response.error_code != 0) {
      console.log(`ERROR when ${api.one_on_one.shop.update}`);
      return;
    }
    //console.log(data)

    let {info: {contents}} = data;
    //console.log(contents)
    
    for (let i=0; i<contents.length; i++) {
      if (~want2buy.indexOf(contents[i].item_id)) {
        console.log(`[BUY] item_id ${contents[i].item_id}`);
        request(msaapi.getRequestOptions(`${api.one_on_one.shop.buy}?kpi1=${contents[i].item_id}&kpi2=5`, { 'content_idx': i }))
          //.pipe(zlib.createGunzip())
          //.pipe(bl(function (err, data) { }));

      }
    }
  }));
