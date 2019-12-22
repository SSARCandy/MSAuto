'use strict';

require('console-stamp')(console, 'yyyy/mm/dd HH:MM:ss');
const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const api = require('./msaapi').api;
const msaapi = require('./msaapi');

const want2buy = [
  //33,39,55, 83,
  //59,80,71,64,
  //54,22,63,78,38,70,84,
//2401,// 敲敲出行阿斯旺
//2278,// 阿魯希諾
//2338,// 特務白蘿莉
//2069,// 粉小熊
//2693,// 聖誕節佩爾西
//2095,// 特務奧德特
//2393,// 特務埃琳娜
//2037,// 特務艾琳
//2623,// 敲敲出行阿嘉莉雅
//2070,// 紅小熊
//2068,
//2282,
  
];

request(msaapi.getRequestOptions(api.guild.shop.update, {}))
  .pipe(zlib.createGunzip())
  .pipe(bl(function (err, data) {
    data = JSON.parse(data.toString());
    console.log('--------------START------------------');
    if (data.response.error_code != 0) {
      console.log(`ERROR when ${api.guild.shop.update}`);
      console.log(data);
      return;
    }
    //console.log(data)

    let {info: {contents}} = data;
    //console.log(contents)
    
    for (let i=0; i<contents.length; i++) {
      if (~want2buy.indexOf(contents[i].item_id)) {
        console.log(`[BUY] item_id ${contents[i].item_id}`);
        request(msaapi.getRequestOptions(`${api.guild.shop.buy}?kpi1=${contents[i].item_id}&kpi2=5`, { 'content_idx': i }))
          //.pipe(zlib.createGunzip())
          //.pipe(bl(function (err, data) { }));
      }
    }
  }));
