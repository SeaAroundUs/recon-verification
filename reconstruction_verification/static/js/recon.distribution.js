(function (){

'use strict';

/* global $ */
/* global d3 */
/* global console */

var map = null;
var modal = null;

var Distribution = {

  initMap: function() {

    var greenToRedColorScale = d3.scale.linear()
      .domain([0,127,255])
      .range(['green', 'yellow', 'red'] );

    var aquamapsColorScale = d3.scale.linear()
      .domain([0.0, 63.75, 127.5, 191.25, 255.0])
      .range([
        d3.rgb(255, 255, 105),
        d3.rgb(255, 218, 79),
        d3.rgb(255, 157, 82),
        d3.rgb(255, 81, 85),
        d3.rgb(214, 41, 47)
      ]);

    var options = {
      hud: {
        fontSize: 20,
        fontColor: 'white',
        verticalOffset: 5
      },
      projection: d3.geo.equirectangular(),
      legend: true,
      colorScale: aquamapsColorScale,
      geoJsonColor: 'rgba(255,255,255,0.5)',
      onCellHover: function(feature) { console.debug('hovering over ', feature);}
    };
    map = new d3.geo.GridMap('#gridMap', options);
  },

  loadCountries: function() {
    d3.json('../static/geo/countries.topojson', function(error, countries) {
      map.addLayer(countries, {fillColor: 'rgb(151,161,97)', zIndex: 1});
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
      map.panToCentroid(extent);
    });
  },

  showTaxon: function(taxon_key, taxon_name, taxon_level) {

    $('#aquamaps-link').data('taxon_key', taxon_key);
    if (taxon_level == 6) {
      $('#aquamaps-link').show();
      $('#aquamaps-missing').hide();
    } else {
      $('#aquamaps-link').hide();
      $('#aquamaps-missing').show();
    }
    $('.spin').hide();

    $('#taxon_name').html(taxon_name);
    $('#taxon_key').html(taxon_key);

    modal.off('shown.bs.modal');
    modal.on('shown.bs.modal', function(event) {
      Distribution.loadTaxonDistribution(taxon_key);
      Distribution.loadTaxonExtent(taxon_key);
    });

    modal.on('hide.bs.modal', function(event) {
      $('#aquamaps').html('');
      if (map.extentLayer) {
        map.removeLayer(map.extentLayer);
      }
      if (map.dataLayer) {
        map.removeLayer(map.dataLayer);
      }
    });

    modal.modal('show');
  },

  showAquamaps: function(taxon_key) {

    d3.html('taxon/' + taxon_key + '/aquamaps', function(error, html_fragment) {
      $('.spin').hide();
      $('#aquamaps').html(html_fragment);
      setTimeout(function() { window.dispatchEvent(new Event('resize')); }, 500);  // allows d3-grid-map to resize
    });

  },

  init: function() {
    $('table').tablesorter();
    modal = $('#modal');
    Distribution.initMap();
    Distribution.loadCountries();
    Distribution.initDistribution();
    $('.modal .x').click(function() {modal.modal('hide'); });

    $('[name="search"]').keyup(function() {
      var query = $(this).val();
      var regex = new RegExp(query, 'gi');
      $('tr.data').each(function(index) {
        var tr = $(this);
        var common_name = tr.find('.common_name').html();
        var scientific_name = tr.find('.scientific_name').html();
        var taxon_key = tr.find('.taxon_key').html();

        if (
          regex.test(common_name) ||
          regex.test(scientific_name) ||
          regex.test(taxon_key)
          ) {
          tr.show();
        } else {
          tr.hide();
        }
      });
    });
    var taxon_key = location.hash.slice(1)|0;
    if (taxon_key) {
      var taxon_name = $('button.view-taxon-link[data-taxon_key="' + taxon_key + '"]').data().taxon_name;
      var taxon_level = $('button.view-taxon-link[data-taxon_key="' + taxon_key + '"]').data().taxon_level;
      Distribution.showTaxon(taxon_key, taxon_name, taxon_level);
    }
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
          // only allow this to be clicked once
          $(this).remove();
        }
      });

    $(".view-taxon-link").click(function(event) {
      event.stopPropagation();
      var taxon_key = $(event.target).data().taxon_key;
      var taxon_name = $(event.target).data().taxon_name;
      var taxon_level = $(event.target).data().taxon_level;

      window.location.hash = taxon_key;

      Distribution.showTaxon(taxon_key, taxon_name, taxon_level);
    });

    $('#aquamaps-link').click(function(event) {
      $(event.target).hide();
      $('.spin').show();
      var taxon_key = $(event.target).data('taxon_key')
      Distribution.showAquamaps(taxon_key);
    });
  }
};

$(Distribution.init());

})();
