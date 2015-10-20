(function (){

'use strict';

/* global $ */
/* global d3 */
/* global console */

var map = null;
var modal = null;

var Distribution = {

  initMap: function() {
    var colorScale = d3.scale.linear()
      .domain([0,127,255])
      .range(['red', 'yellow', 'green'] );
    var options = {
      hud: {
        fontSize: 20,
        fontColor: 'white',
        verticalOffset: 5
      },
      legend: true,
      colorScale: colorScale,
      geoJsonColor: 'rgba(255,255,255,0.5)',
      onCellHover: function(feature) { console.debug('hovering over ', feature);}
    };
    map = new d3.geo.GridMap('#gridMap', options);
  },

  loadCountries: function() {
    d3.json('../static/geo/countries.topojson', function(error, countries) {
      map.addLayer(countries, {zIndex: 1});
    });
  },

  loadTaxonDistribution: function(taxon_key) {

    d3.xhr('taxon/' + taxon_key)
      .responseType('arraybuffer')
      .get(function(error, xhr) {
        var buff = xhr.response;
        var layerOptions = {gridSize: [720,360], zIndex: 3, renderOnAnimate: false};
        map.resize();
        map.dataLayer = map.addLayer(buff, layerOptions);
      });
  },

  loadTaxonExtent: function(taxon_key) {

    d3.json('taxon/' + taxon_key + '/extent', function(error, extent) {
      var layerOptions = {
        renderOnAnimate: true,
        fillColor: 'rgba(0,0,0,.3)',
        strokeColor: 'rgba(0,0,0,1)',
        zIndex:2
      };
      map.extentLayer = map.addLayer(extent, layerOptions);
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
        Distribution.loadTaxonExtent(taxon_key);
      });
      modal.on('hide.bs.modal', function(event) {
        if (map.extentLayer) {
          map.removeLayer(map.extentLayer);
        }
        if (map.dataLayer) {
          map.removeLayer(map.dataLayer);
        }
      });

      modal.modal('show');

    });
  }
};

$(Distribution.init());

})();
