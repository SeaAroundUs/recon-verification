'use strict';

var Table = {
    dataTable: null,
    headers: null,
    $table: null,
    warnings: {},
    errors: {},
    committed: [],

    events: {
        search: function() {
            Table.dataTable.search.query(this.value);
            Table.dataTable.render();
        },

        saveAndNormalize: function(firstLoad) {
            var $normalize = $('#normalize');
            var $commit = $('#commit');
            var saveParams = { data: Table.dataTable.getData() };
            var normalizeParams = { ids: Table.getDataIds() };

            var normalizeFunc = function() {
                Util.setMessage('<span class="glyphicon glyphicon-refresh spin"></span> Normalizing data...');

                Util.$post(Util.urls.normalizeData, normalizeParams, function(res) {
                    Table.updateWarnings(res.warnings);
                    Table.updateErrors(res.errors);
                    Table.updateCommitted(res.committed);

                    if (res.errors.length > 0 || res.warnings.length > 0) {
                        $('.click-message').show().delay(4000).fadeOut();
                    }

                    Table.dataTable.loadData(res.data);
                    Util.setMessage('<span class="glyphicon glyphicon-link"></span> Data normalized');

                    $normalize.prop('disabled', false);
                });
            };

            $normalize.prop('disabled', true);
            $commit.prop('disabled', true);

            if (firstLoad === true) {
                normalizeFunc(); // don't save on first load
            } else {
                Util.setMessage('<span class="glyphicon glyphicon-refresh spin"></span> Saving data...');

                Util.$post(Util.urls.saveData, saveParams, function(res) {
                    var message = res.result === 'ok'
                            ? '<span class="glyphicon glyphicon-floppy-saved"></span> Data saved'
                            : '<span class="glyphicon glyphicon-floppy-remove"></span> Save error';
                    Util.setMessage(message);

                    if (res.result === 'ok') {
                        normalizeFunc();
                    } else {
                        $normalize.prop('disabled', false);
                    }
                });
            }
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
        var $td = $(td);
        var id = Table.dataTable ? Table.dataTable.getDataAtRowProp(row, 'id') : 0;

        // extend TextRenderer
        Handsontable.renderers.TextRenderer.apply(this, arguments);

        // clear existing marks
        $td.removeClass(['warning', 'error', 'committed']);

        // red for zeros
        if (Table.errors[row + ',' + prop]) {
            $td.addClass('error');

        // yellow for warnings
        } else if (Table.warnings[row + ',' + prop]) {
            $td.addClass('warning');
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

        // add delete column
        if (prop === 'delete_row') {
            $td.html('<a href="#" class="delete" data-idx="' + row + '" data-id="' + id + '">Delete</a>');
        }
    },

    init: function() {
        if ($('#edit-normalize').length) {
            Table.$table = $('#reconDataTableElement');
            Table.initTable();
            Table.initDeleteButton();
            Table.loadTableData(function() { Table.events.saveAndNormalize(true); });
        }
    },

    initTable: function() {
        Handsontable.renderers.registerRenderer('reconRenderer', Table.renderer);

        Table.dataTable = new Handsontable(Table.$table[0], Table.getTableOptions());

        Handsontable.Dom.addEvent($('#search_field')[0], 'keyup', Table.events.search);
        Handsontable.Dom.addEvent($('#normalize')[0], 'click', Table.events.saveAndNormalize);
        Handsontable.Dom.addEvent($('#commit')[0], 'click', Table.events.commit);
    },

    initDeleteButton: function() {
        Table.$table.on('click', 'a.delete', function(e) {
            var $target = $(e.target);
            var idx = $target.data('idx');
            var rowId = $target.data('id');

            e.preventDefault();
            e.stopPropagation();

            if (confirm('Really delete row ' + rowId + '?')) {
                $.get(Util.urls.deleteRow, { rowId: rowId }).done(function() {
                    var data = Table.dataTable.getData();
                    data.splice(idx, 1);
                    Table.dataTable.loadData(data);
                    Util.setMessage('<span class="glyphicon glyphicon-ok-circle"></span> Row deleted');
                }).fail(function() {
                    Util.setMessage('<span class="glyphicon glyphicon-remove-circle"></span> Something went wrong');
                });
            }
        });
    },

    afterChange: function (changes, source) {
        if (source === 'loadData') {
            return null; // don't need to do anything on initial table load
        }

        // mark changed rows as dirty/uncommitted
        changes.forEach(function(change) {
            if (!change || change[2] === change[3]) { // make sure the value actually changed
                return;
            }

            var rowId = Table.dataTable.getDataAtRowProp(change[0], 'id');
            var idx = Table.committed.indexOf(rowId);

            $('#commit').prop('disabled', true);

            if (idx !== -1) {
                Table.committed.splice(idx, 1);
                Table.dataTable.render();
            }
        });
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
            allowRemoveRow: true,
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
            fixedColumnsLeft: 1,
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
                if (header === 'id' || header === 'delete_row') {
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

            Table.updateErrors(res.errors);
            Table.updateWarnings(res.warnings);
            Table.updateCommitted();

            if (res.errors.length > 0 || res.warnings.length > 0) {
                $('.click-message').show().delay(4000).fadeOut();
            }

            if ($.isFunction(callback)) {
                callback();
            }
        }).fail(function(xhr) {
            if (xhr.status === 404) {
                Util.setMessage('<span class="glyphicon glyphicon-remove-circle"></span> No data found');
                $('#reconDataTableElement').html('<h3>No data found for this working set</h3>');
            } else {
                Util.setMessage('<span class="glyphicon glyphicon-remove-circle"></span> Unknown error occured');
                $('#reconDataTableElement').html('<h3>Unknown error occured</h3>');
            }
        });
    },

    updateWarnings: function(warnings) {
        var warningModalContent = '';

        var warningDetails = warnings.reduce(function(warnings, warning) {
            var key = warning.reason + ' (' + warning.col + ')';
            warnings[key] = (warnings[key] || []).concat(Table.dataTable.getDataAtRowProp(warning.row, 'id'));
            return warnings;
        }, {});

        var warning;
        for (warning in warningDetails) {
            if (warningDetails.hasOwnProperty(warning)) {
                warningModalContent += '<b>' + warning + '</b>: ' +
                    Util.prettyList(warningDetails[warning]) + '<br />';
            }
        }

        Table.warnings = warnings.reduce(function(warnings, warning) {
            warnings[warning.row + ',' + warning.col] = true;
            return warnings;
        }, {});

        $('#warning-count').text(warnings.length);

        $('#warning-modal div.modal-body').html(warningModalContent);
    },

    updateErrors: function(errors) {
        var errorModalContent = '';

        var errorDetails = errors.reduce(function(errors, error) {
            var key = error.reason + ' (' + error.col + ')';
            errors[key] = (errors[key] || []).concat(Table.dataTable.getDataAtRowProp(error.row, 'id'));
            return errors;
        }, {});

        var error, url;
        for (error in errorDetails) {
            if (errorDetails.hasOwnProperty(error)) {
                if (error.match(/Lookup table mismatch/)) {
                    url = '/admin/catch/';
                    switch (error.match(/\((\w+)\)/)[1]) {
                        case 'original_taxon_name_id':
                        case 'taxon_key':
                            url += 'taxon/';
                            break;
                        case 'fishing_entity_id':
                        case 'original_country_fishing_id':
                            url += 'fishingentity/';
                            break;
                        case 'original_fao_name_id':
                        case 'fao_area_id':
                            url += 'fao/';
                            break;
                        case 'reference_id':
                            url += 'reference/';
                            break;
                        case 'eez_id':
                        case 'sector_type_id':
                        case 'input_type_id':
                        case 'catch_type_id':
                        default:
                            url = '';
                            break;
                    }
                    errorModalContent += url === '' ?
                        '<b>' + error + '</b>: ' :
                        '<a href="' + url + '" target="_blank">' + error + '</a>: ';
                } else if (error === 'Rare taxa should be excluded (taxon_key)') {
                    errorModalContent += '<a href="/admin/catch/raretaxon/" target="_blank">' + error + '</a>: ';
                } else {
                    errorModalContent += '<b>' + error + '</b>: ';
                }
                errorModalContent += Util.prettyList(errorDetails[error]) + '<br />';
            }
        }

        Table.errors = errors.reduce(function(errors, error) {
            errors[error.row + ',' + error.col] = true;
            return errors;
        }, {});

        $('#error-count').text(errors.length).toggleClass('errors', errors.length > 0);

        $('#error-modal div.modal-body').html(errorModalContent);

        $('#commit').prop('disabled', function() { return errors.length > 0; });
    },

    updateCommitted: function(ids) {
        Table.committed = ids || [];
    }
};

$(Table.init);
