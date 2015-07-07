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
                        ? '<span class="glyphicon glyphicon-floppy-saved"></span> Data saved'
                        : '<span class="glyphicon glyphicon-floppy-remove"></span> Save error';
                Util.setMessage(message);
            });
        },

        autosave: function() {
            var message = Table.autosave.checked
                    ? '<span class="glyphicon glyphicon-floppy-disk"></span> Changes will be autosaved'
                    : '<span class="glyphicon glyphicon-floppy-remove"></span> Changes will not be autosaved';
            Util.setMessage(message);
        },

        normalize: function() {
            Util.$post(Util.urls.normalizeData, {}, function(res) {
                Table.dataTable.loadData(res.data);
                Util.setMessage('<span class="glyphicon glyphicon-link"></span> Data normalized');
                Table.updateErrorCount();
            });
        },

        commit: function() {
            Util.$post(Util.urls.commitData, {}, function(res) {
                var message = res.result === 'ok'
                        ? '<span class="glyphicon glyphicon-floppy-saved"></span> Data commited'
                        : '<span class="glyphicon glyphicon-floppy-remove"></span> Commit error';
                Util.setMessage(message);
            });
        }
    },

    init: function() {
        if ($('#edit-normalize').length) {
            Table.autosave = $('#autosave')[0];
            Table.$table = $('#reconDataTableElement');
            Table.initTable();
            Table.loadTableData();
        }
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
        Handsontable.Dom.addEvent($('#commit')[0], 'click', Table.events.commit);
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
                Util.setMessage('<span class="glyphicon glyphicon glyphicon-floppy-saved"></span> Autosaved (' +
                    changes.length + ' cell' +
                    (changes.length > 1 ? 's)' : ')')
                );

                Table.autosaveNotification = setTimeout(function() {
                    Util.setMessage('<span class="glyphicon glyphicon-floppy-disk"></span> Changes will be autosaved');
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
        var columns = headers.map(function(col) {
            return col === 'id' ? { readOnly: true } : {};
        });

        return {
            allowInsertColumn: false,
            allowInsertRow: false,
            allowRemoveColumn: false,
            allowRemoveRow: false,
            colHeaders: headers,
            columnSorting: true,
            columns: columns,
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
        Util.setMessage('<span class="glyphicon glyphicon-refresh spin"></span> Loading data...');

        $.get(Util.urls.uploadedDataJSON, function(res) {
            Table.dataTable.loadData(res.data);

            if (Table.isEmpty()) {
                $('.table-controls input, .table-controls button').prop('disabled', true);
                Table.$table.addClass('disabled');
                Util.setMessage('<span class="glyphicon glyphicon-remove-circle"></span> Error loading data');
            } else {
                $('.table-controls input, .table-controls button').not().prop('disabled', false);
                Table.$table.removeClass('disabled');
                Util.setMessage('<span class="glyphicon glyphicon-ok-circle"></span> Data loaded');
            }

            Table.updateErrorCount();
        });
    },

    updateErrorCount: function() {
        var data = Table.dataTable.getData();
        var errorCount = 0;
        data.forEach(function(row) {
            row.forEach(function(cell) {
                errorCount += cell === 0 ? 1 : 0;
            });
        });
        $('#error-count')
                .text(errorCount)
                .toggleClass('errors', errorCount > 0);

        $('#commit').prop('disabled', function() { return errorCount > 0; });
    }
};

$(Table.init);
