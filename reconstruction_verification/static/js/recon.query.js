'use strict';

var Query = {
    $workingQueryList: null,
    $viewDataButton: null,
    $clearQueryButton: null,
    $removeSelectedButton: null,

    init: function() {
        if ($('.working-set').length) {
            Query.$workingQueryList = $('#working-query');
            Query.$viewDataButton = $('#view-data');
            Query.$clearQueryButton = $('#clear-query');
            Query.$removeSelectedButton = $('#remove-selected');

            Query.initAddButtons();
            Query.initAddRangeButtons();
            Query.initClearQueryButton();
            Query.initViewDataButton();
            Query.initRemoveSelectedButton();
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

    initAddRangeButtons: function() {
        $('button.add-range-button').click(function() {
            var newOption;
            var $parent = $(this).parent();
            var $label = $parent.find('label').first();
            var field = $label.attr('for');
            var min = $parent.find('.rangeMin').val();
            var max = $parent.find('.rangeMax').val();

            // handle NaN
            min = isNaN(min) ? null : min;
            max = isNaN(max) ? null : max;

            if (min === null && max === null) {
                return false;
            }

            newOption = '<option value="' + field + '=' + min + '-' +  max +'">' +
                $label.text() + ': ' + min + ' - ' + max + '</option>';

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
            var url = '/data_ingest/edit-normalize/?' + Query.getParams().join('&');
            $.get(url + '&get_count=true', function(res) {
                if (res.count > 10000) {
                    alert('The query returned greater than 10000 rows (' + res.count +' rows returned); please add ' +
                      'additional query terms to refine your result further or query the database directly');
                } else {
                    window.location.href = url;
                }
            });
        });
    },

    initRemoveSelectedButton: function() {
        Query.$removeSelectedButton.click(function() {
            var options = Query.$workingQueryList[0].options;
            for (var i = 0; i < options.length; i++) {
                if (options[i].selected) {
                    Query.$workingQueryList[0].remove(i);
                }
            }
        });
    },

    getParams: function() {
        return $.map(Query.$workingQueryList.find('option'), function(o) { return $(o).val() });
    }
};

$(Query.init);
