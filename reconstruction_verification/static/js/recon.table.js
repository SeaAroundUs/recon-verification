'use strict';

var Table = {
    autosave: null,
    autosaveNotification: null,
    dataTable: null,
    $table: null,

    events: {
        search: function() {
            Table.dataTable.search.query(this.value);
            Table.dataTable.render();
        },

        save: function() {
            var params = { data: Table.dataTable.getData() };
            Util.$post(Util.urls.uploadedDataJSON, params, function(res) {
                var message = res.result === 'ok'
                        ? 'Data saved'
                        : 'Save error';
                Table.setMessage(message);
            });
        },

        autosave: function() {
            var message = Table.autosave.checked
                    ? 'Changes will be autosaved'
                    : 'Changes will not be autosaved';
            Table.setMessage(message);
        },

        normalize: function() {
            Util.$post(Util.urls.normalizeData, {}, function(res) {
                Table.dataTable.loadData(res.data);
                Table.updateErrorCount();
            });
        }
    },

    init: function() {
        Table.autosave = $('#autosave')[0];
        Table.$table = $('#reconDataTableElement');
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

        Table.dataTable = new Handsontable(Table.$table[0], Table.getTableOptions());

        Handsontable.Dom.addEvent($('#search_field')[0], 'keyup', Table.events.search);
        Handsontable.Dom.addEvent($('#save')[0], 'click', Table.events.save);
        Handsontable.Dom.addEvent(Table.autosave, 'click', Table.events.autosave);
        Handsontable.Dom.addEvent($('#normalize')[0], 'click', Table.events.normalize);
    },

    initUpload: function() {
        var uploadOptions = {
            url: Util.urls.reconFileUpload,
            crossDomain: false,
            beforeSend: function(xhr) {
                Table.setMessage('Uploading file...');
                Util.addToken(xhr);
            },
            dataType: 'json',
            done: function (e, data) {
                var filename = data.originalFiles[0].name;
                Table.loadTableData();
                Table.setMessage('Data uploaded from ' + filename);
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

        if (Table.autosave.checked) {
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
        var headers = Table.getTableHeaders();

        return {
            colHeaders: headers,
            columnSorting: true,
            startRows: 1,
            startCols: headers.length,
            minSpareRows: 0,
            contextMenu: true,
            search: true,
            afterChange: Table.afterChange,
            cells: function () {
                return { renderer: 'zeroValueRenderer' };
            }
        };
    },

    isEmpty: function() {
        return Table.dataTable.isEmptyRow(0);
    },

    loadTableData: function() {
        Table.setMessage('Loading data...');

        $.get(Util.urls.uploadedDataJSON, function(res) {
            Table.dataTable.loadData(res.data);

            if (Table.isEmpty()) {
                $('.table-controls input, .table-controls button').attr('disabled', 'disabled');
                Table.$table.addClass('disabled');
                Table.setMessage('Error loading data');
            } else {
                $('.table-controls input, .table-controls button').removeAttr('disabled');
                Table.$table.removeClass('disabled');
                Table.setMessage('Data loaded');
            }

            Table.updateErrorCount();
        });
    },

    setMessage: function(text) {
        $('#messageConsole').text(text);
    },

    updateErrorCount: function() {
        var data = Table.dataTable.getData();
        var errorCount = 0;
        data.forEach(function(row) {
            row.forEach(function(cell) {
                errorCount += cell === 0 ? 1 : 0;
            });
        });
        $('#error-count').text(errorCount);
    }
};

$(Table.init);
