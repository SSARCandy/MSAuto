'use strict';

require('console-stamp')(console, 'yyyy/mm/dd HH:MM:ss');
const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const api = require('./msaapi').api;
const msaapi = require('./msaapi');

const want2buy = [
  33,39,55, 83,
  59,80,71,64,
  54,22,63,78,38,70,84,

];

request(msaapi.getRequestOptions(api.team_battle.shop.update, {}))
  .pipe(zlib.createGunzip())
  .pipe(bl(function (err, data) {
    data = JSON.parse(data.toString());
    console.log('--------------START------------------');
    if (data.response.error_code != 0) {
      console.log(`ERROR when ${api.team_battle.shop.update}`);
      return;
    }
    //console.log(data)

    let {info: {contents}} = data;
    //console.log(contents)
    
    for (let i=0; i<contents.length; i++) {
      if (~want2buy.indexOf(contents[i].item_id)) {
        console.log(`[BUY] item_id ${contents[i].item_id}`);
        request(msaapi.getRequestOptions(`${api.team_battle.shop.buy}?kpi1=${contents[i].item_id}&kpi2=5`, { 'content_idx': i }))
          //.pipe(zlib.createGunzip())
          //.pipe(bl(function (err, data) { }));

      }
    }
  }));
