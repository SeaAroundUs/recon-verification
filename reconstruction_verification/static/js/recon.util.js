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
            if (keyVal[0] === 'csrftoken') {
                return keyVal[1];
            }
        }

        return null;
    },

    $post: function(url, params, callback) {
        $.ajax({
            beforeSend: Util.addToken,
            data: JSON.stringify(params),
            dataType: 'json',
            method: 'POST',
            url: url,
            success: callback
        });
    }
};

$(Util.init);
