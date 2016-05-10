'use strict';

var Normalize = {
    $normalizeSourceButton: null,
    $loading_page: null,

    init: function() {
        if ($('.normalize-source-file').length) {
            Normalize.$normalizeSourceButton = $('#normalize-source');
            Normalize.$loading_page = window.location;
            Normalize.initNormalizeSourceButton();
        }
    },

    initNormalizeSourceButton: function() {
        Normalize.$normalizeSourceButton.click(function() {
            Util.$post(
                Util.urls.normalizeSource,
                {"source-file-id": $('#source-file').val()},
                function(res) {window.location.href = Normalize.$loading_page.pathname;}
            );
        });
    },
};

$(Normalize.init);
