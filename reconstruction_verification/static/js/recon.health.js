'use strict';

var Health = {
    init: function () {
        if ($('#health').length) {
            //$('#error-modal div.modal-body').on('hidden.modal', function(event) {
                //$(this).removeData('modal-body').children().remove()
            //    $(this).empty()
            //});
            //$('#error-modal').on('hidden', function() { $(this).removeData(); });
            //$('#error-modal').on('hidden.bs.modal', function (e) {
                //$(e.target).removeData('bs.modal');
            //    $(e.target).find('.modal-body').empty();
            //});

            Health.initViewLimits();
            Health.initErrorModal();
            Health.initWarningModal();
        }
    },

    initViewLimits: function () {
        $('a.view-link').click(function (e) {
            //var count = $(this).data('count');
            // if (count > 100) {
            //     e.preventDefault();
            //     alert('The query returned greater than 100 rows (' + count +' rows returned); please add ' +
            //         'additional query terms to refine your result further or query the database directly');
            // }
        });
    },

    initErrorModal: function () {
        $('#error-modal').on("hide.bs.modal", function (e) {
            $('#error-modal div.modal-body').html("");
            $('#error-modal div.modal-footer').html("");
        });

        function fetch_error_ids(anchor) {
            var $url = anchor.attr("fetch-url")

            $.get($url).done(function(res) {
                var ids = res.ids.toString()
                if (res.description.startsWith("Distribution.taxon_habitat")) {
                    var anchors = ""
                    ids = ids.split(",")
                    for (var len=ids.length, i=0; i < len; i++) {
                        anchors = anchors + '<a target="_blank" href="/admin/catch/habitatindex/' + ids[i] + '">' + ids[i] + ",</a>";
                    }
                    $('#error-modal div.modal-body').html("<p>" + anchors + "</p>");
                }
                else {
                    $('#error-modal div.modal-body').html("<p>" + ids + "</p>");
                }
                $('#error-modal div.modal-footer').html(
                    '<div class="desc"><b>' + res.description +
                    '</b></div><div class="clipboard"><button type="button" class="copy">Copy ids to clipboard</button></div>'
                );
                $('#error-modal div.modal-footer button.copy').on('click', function(){
                    clipboard.copy(ids);
                });
            }).fail(function() {
                $('#error-modal div.modal-footer').html("<b>Attempt to fetch error ids failed.</b>");
            });
        }

        $('a[id^=error-count]').on('click', function(e) {fetch_error_ids($(this));});
    },
    
    initWarningModal: function () {
        $('#warning-modal').on("hide.bs.modal", function (e) {
            $('#warning-modal div.modal-body').html("");
            $('#warning-modal div.modal-footer').html("");
        });

        function fetch_warning_ids(anchor) {
            var $url = anchor.attr("fetch-url-w")

            $.get($url).done(function(res) {
                var ids = res.ids.toString()
                if (res.description.startsWith("Distribution.taxon_habitat")) {
                    var anchors = ""
                    ids = ids.split(",")
                    for (var len=ids.length, i=0; i < len; i++) {
                        anchors = anchors + '<a target="_blank" href="/admin/catch/habitatindex/' + ids[i] + '">' + ids[i] + ",</a>";
                    }
                    $('#warning-modal div.modal-body').html("<p>" + anchors + "</p>");
                }
                else {
                    $('#warning-modal div.modal-body').html("<p>" + ids + "</p>");
                }
                $('#warning-modal div.modal-footer').html(
                    '<div class="desc"><b>' + res.description +
                    '</b></div><div class="clipboard"><button type="button" class="copy">Copy ids to clipboard</button></div>'
                );
                $('#warning-modal div.modal-footer button.copy').on('click', function(){
                    clipboard.copy(ids);
                });
            }).fail(function() {
                $('#warning-modal div.modal-footer').html("<b>Attempt to fetch warning ids failed.</b>");
            });
        }

        $('a[id^=warning-count]').on('click', function(e) {fetch_warning_ids($(this));});
    }
};

$(Health.init);
