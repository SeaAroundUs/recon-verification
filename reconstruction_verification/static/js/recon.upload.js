'use strict';

var Upload = {
    init: function() {
        if ($('#browse-upload').length) {
            Upload.initUpload();
        }
    },

    initUpload: function() {
        var uploadOptions = {
            url: Util.urls.uploadJSON,
            crossDomain: false,
            beforeSend: function(xhr) {
                Util.setMessage('<span class="glyphicon glyphicon-refresh spin"></span> Uploading file...');
                Util.addToken(xhr);
            },
            dataType: 'json',
            done: function (e, data) {
                var filename = data.originalFiles[0].name;
                Util.setMessage('<span class="glyphicon glyphicon-ok-circle"></span> Data uploaded from ' + filename);
            }
        };

        $("#fileupload").fileupload(uploadOptions)
                .prop('disabled', !$.support.fileInput)
                .parent()
                .addClass($.support.fileInput ? undefined : 'disabled');
    }
};

$(Upload.init);