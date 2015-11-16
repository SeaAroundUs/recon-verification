'use strict';

var Health = {
    init: function() {
        if ($('#health').length) {
            Health.initViewLimits();
        }
    },

    initViewLimits: function() {
        $('a.view-link').click(function(e) {
            var count = $(this).data('count');
            if (count > 100) {
                e.preventDefault();
                alert('The query returned greater than 100 rows (' + count +' rows returned); please add ' +
                    'additional query terms to refine your result further or query the database directly');
            }
        });
    }
};

$(Health.init);
