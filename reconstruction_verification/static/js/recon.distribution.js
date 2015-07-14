'use strict';

/* global $ */
/* global console */

var Distribution = {
    init: function() {
        if ($('#distribution').length) {
            Distribution.initDistribution();
        }
    },

    initDistribution: function() {
        var el = $('#distribution .run');
        el.click(function() {
            var data = $(this).data();
            if (data.taxon_key) {
                $.post('', data)
                    .done(function(data) {
                      console.log('response: ', data);
                    });
                $(this).addClass('spin');
                // only allow this to be clicked once
                $(this).data('taxon_key', '');
            }
        });
    }

};

$(Distribution.init);
