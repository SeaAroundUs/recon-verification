'use strict';

var Table = {
    autosave: null,
    autosaveNotification: null,
    dataTable: null,
    headers: null,
    $table: null,
    warnings: {},
    committed: [],

    events: {
        search: function() {
            Table.dataTable.search.query(this.value);
            Table.dataTable.render();
        },

        save: function(callback) {
            var params = { data: Table.dataTable.getData() };
            Util.$post(Util.urls.saveData, params, function(res) {
                var message = res.result === 'ok'
                        ? '<span class="glyphicon glyphicon-floppy-saved"></span> Data saved'
                        : '<span class="glyphicon glyphicon-floppy-remove"></span> Save error';
                Util.setMessage(message);

                if ($.isFunction(callback)) {
                    callback();
                }
            });
        },

        autosave: function() {
            var message = Table.autosave.checked
                    ? '<span class="glyphicon glyphicon-floppy-disk"></span> Changes will be autosaved'
                    : '<span class="glyphicon glyphicon-floppy-remove"></span> Changes will not be autosaved';
            Util.setMessage(message);
        },

        normalize: function() {
            var $normalize = $('#normalize');

            $normalize.prop('disabled', true);
            Util.setMessage('<span class="glyphicon glyphicon-refresh spin"></span> Normalizing data...');

            Util.$post(Util.urls.normalizeData, { ids: Table.getDataIds() }, function(res) {
                Table.updateWarnings(res.warnings);
                Table.updateCommitted(res.committed);

                Table.dataTable.loadData(res.data);
                Util.setMessage('<span class="glyphicon glyphicon-link"></span> Data normalized');

                Table.updateErrorCount();

                $normalize.prop('disabled', false);
            });
        },

        commit: function() {
            var $commit = $('#commit');
            var ids = Table.getDataIds();

            $commit.prop('disabled', true);
            Util.setMessage('<span class="glyphicon glyphicon-refresh spin"></span> Committing data...');

            Util.$post(Util.urls.commitData, { ids: ids }, function(res) {
                var message;

                if (res.result === 'ok') {
                    message = '<span class="glyphicon glyphicon-floppy-saved"></span> Data commited';
                    Table.updateCommitted(ids);
                    Table.dataTable.render();
                } else {
                    message = '<span class="glyphicon glyphicon-floppy-remove"></span> Commit error';
                }

                Util.setMessage(message);
                $commit.prop('disabled', false);
            });
        }
    },

    renderer: function(instance, td, row, col, prop, value, cellProperties) {
        var warningReason;
        var $td = $(td);
        var id = Table.dataTable ? Table.dataTable.getDataAtRowProp(row, 'id') : 0;

        // extend TextRenderer
        Handsontable.renderers.TextRenderer.apply(this, arguments);

        // clear existing marks
        $td.removeClass(['warning', 'error', 'committed']);

        // red for zeros
        if (value === 0) {
            $td.addClass('error');

            // yellow for warnings
        } else if (warningReason = Table.warnings[row + ',' + prop]) {
            $td.addClass('warning');
            // disable this for now
            /*
             $td.hover(function() {
                $(this).append('<span class="warning-reason">' + warningReason + '</span>');
             }, function() {
                $(this).children('span.warning-reason').remove();
             });
             */
        }

        // green for committed
        if (Table.committed.indexOf(id) !== -1) {
            $td.addClass('committed');
        }

        // read only for id , *_id and *_key columns
        if (Table.isReadOnlyColumn(col)) {
            cellProperties.readOnly = true;
            $td.addClass('readOnly');
        }
    },

    init: function() {
        if ($('#edit-normalize').length) {
            Table.autosave = $('#autosave')[0];
            Table.$table = $('#reconDataTableElement');
            Table.initTable();
            Table.loadTableData(Table.events.normalize);
        }
    },

    initTable: function() {
        Handsontable.renderers.registerRenderer('reconRenderer', Table.renderer);

        Table.dataTable = new Handsontable(Table.$table[0], Table.getTableOptions());

        Handsontable.Dom.addEvent($('#search_field')[0], 'keyup', Table.events.search);
        //Handsontable.Dom.addEvent($('#save')[0], 'click', Table.events.save);
        //Handsontable.Dom.addEvent(Table.autosave, 'click', Table.events.autosave);
        Handsontable.Dom.addEvent($('#normalize')[0], 'click', function() {
            Table.events.save(Table.events.normalize); // save before normalize
        });
        Handsontable.Dom.addEvent($('#commit')[0], 'click', Table.events.commit);
    },

    afterChange: function (changes, source) {
        if (source === 'loadData') {
            return; // don't save this change
        }

        if (Table.autosave.checked) {
            clearTimeout(Table.autosaveNotification);

            // add primary key to changes objects
            changes = changes.map(function(change) {
                return {
                    id: Table.dataTable.getDataAtCell(change[0], 0),
                    column: change[1],
                    old_value: change[2],
                    new_value: change[3]
                };
            });

            // save changes
            Util.$post(Util.urls.autoSaveData, { data: changes }, function() {
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

    getDataIds: function() {
        return Table.dataTable.getDataAtProp('id');
    },

    getTableHeaders: function() {
        if (Table.headers === null) {
            $.ajax({
                url: Util.urls.catchFieldsJSON,
                type: 'GET',
                async: false, //TODO don't use synch
                success: function(data) {
                    Table.headers = data;
                }
            });
        }

        return Table.headers;
    },

    getTableOptions: function() {
        var headers = Table.getTableHeaders();

        return {
            allowInsertColumn: false,
            allowInsertRow: false,
            allowRemoveColumn: false,
            allowRemoveRow: false,
            colHeaders: headers,
            columnSorting: true,
            startCols: 46,
            startRows: 1,
            minSpareCols: 0,
            minSpareRows: 0,
            maxRows: 0,
            contextMenu: false,
            search: true,
            afterChange: Table.afterChange,
            cells: function () {
                return { renderer: 'reconRenderer' };
            }
        };
    },

    isEmpty: function() {
        return Table.dataTable.isEmptyRow(0);
    },

    //TODO this should come from MT
    isReadOnlyColumn: function(col) {
        var ro;
        if (!ro) {
            ro = Table.getTableHeaders().map(function(header) {
                if (header === 'id') {
                    return true;
                }

                if (header === 'reference_id') {
                    return false;
                }

                return header.indexOf('_id') !== -1 || header.indexOf('_key') !== -1;
            });
        }
        return ro[col];
    },

    loadTableData: function(callback) {
        Util.setMessage('<span class="glyphicon glyphicon-refresh spin"></span> Loading data...');

        $.get(Util.urls.uploadedDataJSON, function(res) {
            Table.dataTable.updateSettings({ maxRows: res.data.length });
            Table.dataTable.loadData(res.data);

            if (Table.isEmpty()) {
                $('.table-controls input, .table-controls button').prop('disabled', true);
                Util.setMessage('<span class="glyphicon glyphicon-remove-circle"></span> Error loading data');
            } else {
                $('.table-controls input, .table-controls button').not().prop('disabled', false);
                Util.setMessage('<span class="glyphicon glyphicon-ok-circle"></span> Data loaded');
            }

            Table.updateErrorCount();
            Table.updateCommitted();

            if ($.isFunction(callback)) {
                callback();
            }
        });
    },

    updateWarnings: function(warnings) {
        var key;

        Table.warnings = warnings.reduce(function(warnings, warning) {
            key = warning.row + ',' + warning.col;
            if (warnings[key]) {
                warnings[key] += "<br />" + warning.reason;
            } else {
                warnings[key] = warning.reason;
            }
            return warnings;
        }, {});

        $('#warning-count').html(warnings.length);
    },

    updateErrorCount: function() {
        var cell;
        var data = Table.dataTable.getData();
        var errorCount = 0;

        data.forEach(function(row) {
            for (cell in row) {
                if (row.hasOwnProperty(cell)) {
                    errorCount += row[cell] === 0 ? 1 : 0;
                }
            }
        });

        $('#error-count')
                .text(errorCount)
                .toggleClass('errors', errorCount > 0);

        $('#commit').prop('disabled', function() { return errorCount > 0; });
    },

    updateCommitted: function(ids) {
        Table.committed = ids || [];
    }
};

$(Table.init);
