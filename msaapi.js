'use strict';

const myHeader = require('./header.json');
const BASE_URL = 'https://msaapi.snkplaymore.info/';
exports.api = {
    search: {
        top: 'search/top/',
        get: 'search/get/',
        start: 'search/start/'
    }
}

exports.getRequestOptions = (url, data) => {
    return {
        method: 'POST',
        url: `${BASE_URL}${url}`,
        headers: myHeader,
        form: data
    };
}