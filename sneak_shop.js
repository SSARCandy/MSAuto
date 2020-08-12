'use strict';

require('console-stamp')(console, 'yyyy/mm/dd HH:MM:ss');
const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const api = require('./msaapi').api;
const msaapi = require('./msaapi');

const want2buy = [
  //30,31,32,33,39,50,55,65,79, 83,
  //59,80,71,64,
  //54,22,63,78,38,70,84, 

  //2460,// 雷歐娜 ver. hero
  //2126,// 特務飛澳
  //2309,// 特務胖馬可
  //2397,// 長夏莉塔
  //2591,// 萬聖節尼基特
  30,39,72, 

];

const parts = {};
//function fetch_unit_part_map(user) {
  //for (let u of user.units.unit) {
    //if (~want2buy.indexOf(u.param.unit_id)) {
      //parts[unit_id] = 
    //}
  
  //}
//}

request(msaapi.getRequestOptions(api.sneak.shop.update, {}))
  .pipe(zlib.createGunzip())
  .pipe(bl(function (err, data) {
    data = JSON.parse(data.toString());
    console.log('--------------START------------------');
    if (data.response.error_code != 0) {
      console.log(`ERROR when ${api.sneak.shop.update}`);
      console.log(data) 
      return;
    }

    let {info: {contents}, user} = data;
    
    for (let i=0; i<contents.length; i++) {
      if (~want2buy.indexOf(contents[i].item_id)) {
        console.log(`[BUY] item_id ${contents[i].item_id}, coin=${user.sneak_coin}`);
        request(msaapi.getRequestOptions(`${api.sneak.shop.buy}?kpi1=${contents[i].item_id}&kpi2=5`, { 'content_idx': i }))
      }
    }
  }));
