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
            done: function(e, data) {
                clearInterval(progressInterval);

                Util.setMessage('<span class="glyphicon glyphicon-ok-circle"></span> Data uploaded from "' +
                        data.originalFiles[0].name + '"');

                window.location = window.location;
            },
            fail: function(e, data) {
                console.log(e);
                console.log(data.response());

                clearInterval(progressInterval);

                Util.setMessage('<span class="glyphicon glyphicon-ban-circle"></span> Failed to upload "' +
                        data.originalFiles[0].name + '": ' + data.response().jqXHR.responseJSON['__all__'][0]
                );
            }
        };

        $('#fileupload').fileupload(uploadOptions)
                .prop('disabled', !$.support.fileInput)
                .parent()
                .addClass($.support.fileInput ? undefined : 'disabled');

        $('#refupload').fileupload({
            url: Util.urls.uploadRef,
            crossDomain: false,
            beforeSend: Util.addToken,
            done: function() { window.location.href = window.location.href; }
        })
    },

    updateProgress: function(progress) {
        console.log(progress);
    }
};

$(Upload.init);
