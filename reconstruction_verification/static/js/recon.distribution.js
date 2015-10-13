(function (){

'use strict';

/* global $ */
/* global d3 */
/* global console */

var map = null;
var modal = null;

var Distribution = {

  initMap: function() {
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
    map = new d3.geo.GridMap('#gridMap', options);
  },

  loadCountries: function() {
    d3.json('../static/geo/countries.topojson', function(error, countries) {
      map.setData(countries);
    });
  },

  loadTaxonDistribution: function(taxon_key) {

    d3.xhr('taxon/' + taxon_key)
      .responseType('arraybuffer')
      .get(function(error, xhr) {
        var buff = xhr.response;
        var gridOptions = {gridSize: [720,360], renderOnAnimate: false};
        if (map.dataLayer) {
          // remove last data
          map.removeLayer(map.dataLayer);
        }
        map.resize();
        map.dataLayer = map.setData(buff, gridOptions);
      });
  },

  init: function() {
    modal = $('#modal');
    Distribution.initMap();
    Distribution.loadCountries();
    Distribution.initDistribution();
    $('.modal .x').click(function() {modal.modal('hide'); });
  },

  initDistribution: function() {
    $('#distribution .run')
      .click(function() {
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

    $(".view-taxon-link").click(function(event) {
      event.stopPropagation();
      var taxon_key = $(event.target).data().taxon_key;
      var taxon_name = $(event.target).data().taxon_name;

      $('#taxon_name').html(taxon_name);
      $('#taxon_key').html(taxon_key);

      modal.off('shown.bs.modal');
      modal.on('shown.bs.modal', function(event) {
        Distribution.loadTaxonDistribution(taxon_key);
      });

      modal.modal('show');

    });
  }
};

$(Distribution.init());

})();
