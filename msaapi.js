'use strict';

const myHeader = require('./fixtures/header.json');
const BASE_URL = 'https://msaapi.snkplaymore.info/';
exports.api = {
    search: {
        top: 'search/top/',
        get: 'search/get/',
        start: 'search/start/'
    },
    training: {
        top: 'training/top/',
        start: 'training/battle_start/',
        win: 'training/battle_win/'
    },
    sneak: {
        reset: 'sneak/reset/',
        top: 'sneak/top/',
        start: 'sneak/battle_start/',
        win: 'sneak/battle_win/',
        decide: 'sneak/battle_decide/',
        shop: {
            update: 'sneak_shop/update/',
            buy: 'sneak_shop/buy'
        }
    },
    one_on_one: {
        shop: {
            update: 'off_1on1_btl_shop/update',
            buy: 'off_1on1_btl_shop/buy'
        }
    },
    team_battle: {
        shop: {
            update: 'off_team_btl_shop/update',
            buy: 'off_team_btl_shop/buy'
        }
    },
    guild: {
        shop: {
            update: 'guild_shop/update',
            buy: 'guild_shop/buy'
        }
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
