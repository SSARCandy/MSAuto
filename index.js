'use strict';

const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const api = require('./msaapi').api;
const msaapi = require('./msaapi');



request(msaapi.getRequestOptions(api.search.top, {}))
  .pipe(zlib.createGunzip())
  .pipe(bl(function (err, data) {
    data = data.toString();
    let {search: {searching}} = JSON.parse(data);
    console.log(searching);
    let unCollectedIds = searching.map(s => s.point_id);
    unCollectedIds = [1, 2, 3, 4, 5, 6].filter(s => !~unCollectedIds.indexOf(s));

    unCollectedIds.map(id => {
      request(msaapi.getRequestOptions(api.search.start, { 'search_point': id }))
        .pipe(zlib.createGunzip())
        .pipe(process.stdout);
    });

    searching.map(s => {
      if (new Date(s.event) > Date.now() + 3600 * 1000) return;
      console.log('collecting.... restarting...');
      getTreasure(s.id);
    });
  }));


function getTreasure(point_id) {
  return request(msaapi.getRequestOptions(api.search.get, { 'search_point': point_id }))
    .then(request(msaapi.getRequestOptions(api.search.start, { 'search_point': s.point_id })));
}

// ['1', '2', '3', '4', '5', '6'].map(pt => {
//   request(msaapi.getRequestOptions(api.search.get, { 'search_point': pt }))
//     .pipe(zlib.createGunzip())
//     .pipe(bl(function (err, data) {
//       data = data.toString();
//       data = JSON.parse(data);
//       if (data.response.error_code === 0) {
//         request(msaapi.getRequestOptions(api.search.start, { 'search_point': pt })) 
//       }
//     }));
// })