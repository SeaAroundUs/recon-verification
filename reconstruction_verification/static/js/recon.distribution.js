(function (){

'use strict';

/* global $ */
/* global d3 */
/* global console */

var Distribution = {
  init: function() {
    if ($('#distribution').length) {
      Distribution.initDistribution();
    }
  },

  initDistribution: function() {
    var el = $('#distribution .run');
    var map = null;
    el.click(function() {
      var data = $(this).data();
      if (data.taxon_key) {
        $.post('', data)
        .done(function(data) {
          console.log('response: ', data);
        });
        $(this).addClass('spin');
        // only allow this to be clicked once
        $(this).data('taxon_key', '');
      }
    });

    var modal = $('#modal');
    var modal_content = $('#modal .modal-content');

    modal.on('hide.bs.modal', function() {
      modal_content.empty();
    });

    $(".view-taxon-link").click(function(event) {
      event.stopPropagation();
      var taxon_key = $(event.target).data().taxon_key;
      var taxon_name = $(event.target).data().taxon_name;

      modal_content.empty();
      var content = '<span class="x glyphicon glyphicon-remove"></span>' +
        '<h1>Distribution for ' + taxon_name +
        ' (' + taxon_key + ')</h1>' +
        '<div id="gridMap"></div>';
      modal_content.html(content);
      modal.modal('show');

      $('.modal .x').click(function() {modal.modal('hide'); });

      d3.json('../static/geo/countries.topojson', function(error, countries) {
        var colorScale = d3.scale.quantize()
          .domain([0,255])
          .range(colorbrewer.RdYlGn[10]);
        var options = {
          hud: {
            fontSize: 20,
            fontColor: 'white',
            verticalOffset: 5
          },
          colorScale: colorScale,
          geoJsonColor: 'rgba(255,255,255,0.5)',
          onCellHover: function(feature) { console.debug('hovering over ', feature);}
        };
        var gridSize = [720, 360];
        $('#gridMap').html('');
        map = new d3.geo.GridMap('#gridMap', options);
        map.setData(countries);

        d3.xhr('taxon/' + taxon_key)
          .responseType('arraybuffer')
          .get(function(error, xhr) {
            var buff = xhr.response;
            var gridOptions = {gridSize: [720,360]};
            map.setData(buff, gridOptions);
            map.panToCentroid();
          });
      });
    });
  }
};

$(Distribution.init);

})();
