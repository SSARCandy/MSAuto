'use strict';

require('console-stamp')(console, 'yyyy/mm/dd HH:MM:ss');
const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const api = require('./msaapi').api;
const msaapi = require('./msaapi');

const want2buy = [
  30, //Two Machine Guns
  ////31, //斬鐵刀
  ////32, //Thunder Shot
  //33, //機槍
  39, //電池
  //50, //黃金蝙蝠
  55, //聖水
  ////65, //阿拉伯眼淚
  72, //徽章 （白金）
  ////79, //內褲
  83, //蘋果桶

  59, // 鳥巢
  80, // 豬
  71, // 金徽章
  64, // 赤寶石

  54, // 藥
  //22, // D
  63, // 黃寶石
  78, // 植木
  //38, // 機雷
  70, // 瘦身藥
  //84, // 魚
];

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
    //console.log(JSON.stringify(data));
    
    for (let i=0; i<contents.length; i++) {
      if (~want2buy.indexOf(contents[i].item_id)) {
        console.log(`[BUY] item_id ${contents[i].item_id}, coin=${user.sneak_coin}`);
        request(msaapi.getRequestOptions(`${api.sneak.shop.buy}?kpi1=${contents[i].item_id}&kpi2=5`, { 'content_idx': i }))
      }
    }
  }));
