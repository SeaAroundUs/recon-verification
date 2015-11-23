'use strict';

var Util = {
    urls: {},

    init: function() {
        $('.djangoURL').each(function() {
            var $el = $(this);
            Util.urls[$el.attr('id')] = $el.val();
        });
    },

    addToken: function(xhr) {
        xhr.setRequestHeader('X-CSRFToken', Util.getToken());
    },

    escapeHTML: function(string) { //TODO is it used?
        return $('<div/>').text(string).html();
    },

    getToken: function() {
        var pairs = document.cookie.split(';');
        var i, keyVal;

        for (i = 0; i < pairs.length; i++) {
            keyVal = pairs[i].split('=');
            if (keyVal[0].trim() === 'csrftoken') {
                return keyVal[1];
            }
        }

        return null;
    },

    prettyList: function(list) {
        return list
            .sort(function(a, b) { return a - b; })
            .reduce(function(pl, item) {
            var lastNum, lastSymbol;
            if (pl === '') {
                pl = '' + item;
            } else {
                lastNum = parseInt(pl.match(/(\d+)$/)[1]);
                lastSymbol = pl.match(/(^|-|,)\d+$/)[1];
                if (parseInt(item) === lastNum + 1) {
                    if (lastSymbol === '-') {
                        pl = pl.replace(/\d+$/, item);
                    } else {
                        pl += '-' + item;
                    }
                } else {
                    pl += ',' + item;
                }
            }
            return pl;
        }, '');
    },

    setMessage: function(text) {
        $('#messageConsole').html(text);
    },

    $post: function(url, params, callback) {
        $.ajax({
            beforeSend: Util.addToken,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(params),
            dataType: 'json',
            method: 'POST',
            url: url,
            success: callback
        });
    }
};

$(Util.init);
