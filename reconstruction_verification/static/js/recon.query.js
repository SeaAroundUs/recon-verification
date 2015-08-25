'use strict';

var Query = {
    $workingQueryList: null,
    $viewDataButton: null,
    $clearQueryButton: null,

    init: function() {
        if ($('.working-set').length) {
            Query.$workingQueryList = $('#working-query');
            Query.$viewDataButton = $('#view-data');
            Query.$clearQueryButton = $('#clear-query');

            Query.initAddButtons();
            Query.initClearQueryButton();
            Query.initViewDataButton();
        }
    },

    initAddButtons: function() {
        $('button.add-button').click(function() {
            var newOption;
            var $parent = $(this).parent();
            var $label = $parent.find('label');
            var $selected = $parent.find('option:selected');
            var selVal = $selected.val();

            if (selVal === '-- SELECT --' || Query.getParams().indexOf(selVal) !== -1) {
                return false;
            }

            newOption = '<option value="' + $selected.val() + '">' +
                    $label.text() + ': ' + $selected.text() + '</option>';

            Query.$workingQueryList.append(newOption);
            Query.$viewDataButton.prop('disabled', false);
        });
    },

    initClearQueryButton: function() {
        Query.$clearQueryButton.click(function() {
            Query.$workingQueryList.empty();
            Query.$viewDataButton.prop('disabled', true);
        });
    },

    initViewDataButton: function() {
        Query.$viewDataButton.click(function() {
            window.location.href = '/data_ingest/edit-normalize/?' + Query.getParams().join('&');
        });
    },

    getParams: function() {
        return $.map(Query.$workingQueryList.find('option'), function(o) { return $(o).val() });
    }
};

$(Query.init);
