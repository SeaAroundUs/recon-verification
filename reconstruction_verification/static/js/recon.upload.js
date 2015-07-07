'use strict';

var Upload = {
    init: function() {
        if ($('#browse-upload').length) {
            Upload.initUpload();
        }
    },

    initUpload: function() {
        var progressInterval;
        var uploadOptions = {
            url: Util.urls.uploadJSON,
            crossDomain: false,
            beforeSend: function(xhr) {
                progressInterval = setInterval(function() {
                    Upload.updateProgress($('#fileupload').fileupload('progress'));
                }, 5000);

                Util.setMessage('<span class="glyphicon glyphicon-refresh spin"></span> Uploading file...');
                Util.addToken(xhr);
            },
            dataType: 'json',
            done: function (e, data) {
                clearInterval(progressInterval);

                Util.setMessage('<span class="glyphicon glyphicon-ok-circle"></span> Data uploaded from ' +
                        data.originalFiles[0].name);

                window.location = window.location;
            }
        };

        $('#fileupload').fileupload(uploadOptions)
                .prop('disabled', !$.support.fileInput)
                .parent()
                .addClass($.support.fileInput ? undefined : 'disabled');
    },

    updateProgress: function(progress) {
        console.log(progress);
    }
};

$(Upload.init);
