'use strict';

var Table = {
    autosaveNotification: null,
    dataTable: null,

    $autosave: null,
    $container: null,
    $normalize: null,
    $save: null,

    init: function() {
        Table.$autosave = $('#autosave');
        Table.$container = $('#reconDataTableElement');
        Table.$normalize = $('#normalize');
        Table.$save = $('#save');

        Table.initTable();
        Table.initUpload();
    },

    initTable: function() {
        Handsontable.renderers.registerRenderer('zeroValueRenderer',
                function(instance, td, row, col, prop, value, cellProperties) {
                    Handsontable.renderers.TextRenderer.apply(this, arguments);
                    if (value === 0) {
                        td.style.background = '#FF0000';
                    }
                }
        );

        Table.dataTable = new Handsontable(Table.$container[0], Table.getTableOptions());

        Handsontable.Dom.addEvent($('#search_field')[0], 'keyup', function() {
            var queryResult = Table.dataTable.search.query(this.value); //TODO implement?
            Table.dataTable.render();
        });

        Handsontable.Dom.addEvent(Table.$save[0], 'click', function() {
            var params = { data: Table.dataTable.getData() };
            Util.$post(Util.urls.uploadedDataJSON, params, function(res) {
                var message = res.result === 'ok'
                        ? 'Data saved'
                        : 'Save error';
                Table.setMessage(message);
            });
        });

        Handsontable.Dom.addEvent(Table.$autosave[0], 'click', function() {
            var message = Table.$autosave[0].checked
                    ? 'Changes will be autosaved'
                    : 'Changes will not be autosaved';
            Table.setMessage(message);
        });

        Handsontable.Dom.addEvent(Table.$normalize[0], 'click', function() {
            Util.$post(Util.urls.normalizeData, {}, function (res) { //TODO implement?
                Table.dataTable.loadData(res.data);
            });
        });
    },

    initUpload: function() {
        var uploadOptions = {
            url: Util.urls.reconFileUpload,
            crossDomain: false,
            beforeSend: Util.addToken,
            dataType: 'json',
            done: function (e, data) {
                Table.loadTableData();
                Table.setMessage('Data loaded from file [name of uploaded file]'); //TODO implement
            }
        };

        $("#fileupload").fileupload(uploadOptions)
                .prop('disabled', !$.support.fileInput)
                .parent()
                    .addClass($.support.fileInput ? undefined : 'disabled');
    },

    afterChange: function (changes, source) {
        if (source === 'loadData') {
            return; // don't save this change
        }

        // add primary key to changes objects
        changes = changes.map(function(change) {
            return {
                id: Table.dataTable.getDataAtCell(change[0], 0),
                column: change[1],
                old_value: change[2],
                new_value: change[3]
            };
        });

        if (Table.$autosave[0].checked) {
            clearTimeout(Table.autosaveNotification);

            Util.$post(Util.urls.uploadedDataJSON, { data: changes }, function() {
                Table.setMessage('Autosaved (' + changes.length + ' cell'
                    + (changes.length > 1 ? 's)' : ')'));

                Table.autosaveNotification = setTimeout(function() {
                    Table.setMessage('Changes will be autosaved');
                }, 1000);
            });
        }
    },

    getTableHeaders: function() {
        var tableHeaders = [];

        $.ajax({
            url: Util.urls.catchFieldsJSON,
            type: 'GET',
            async: false, //TODO don't use synch
            success: function(data) {
                tableHeaders = data;
            }
        });

        return tableHeaders;
    },

    getTableOptions: function() {
        return {
            colHeaders: Table.getTableHeaders(),
            columnSorting: true,
            startRows: 1,
            startCols: 32,
            minSpareRows: 0,
            contextMenu: true,
            search: true,
            afterChange: Table.afterChange,
            cells: function () {
                return { renderer: 'zeroValueRenderer' };
            }
        };
    },

    loadTableData: function() {
        $.get(Util.urls.uploadedDataJSON, function(res) {
            Table.dataTable.loadData(res.data);
        });
    },

    setMessage: function(text) {
        $('#messageConsole').text(text);
    }
};

$(Table.init);
