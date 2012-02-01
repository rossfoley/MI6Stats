$(document).ready(function() {
  $(".tablesorter").tablesorter();
  createBarGraph();
});

function createBarGraph() {
  var colors, chart, data, new_data;

  colors = Highcharts.getOptions().colors;
  data = getGraphData();
  new_data = []

  $.each(data, function(index, value) {
    new_data.push({
      y: value,
      color: colors[index]
    });
  });

  $.each(getGraphCategories(), function(index, value) {
    var query = "." + value.replace(/\+/g, "");
    $(query).css("color", colors[index]);
  });

  chart = new Highcharts.Chart({
      chart: { renderTo: 'graph_container', defaultSeriesType: 'column' },
      title: { text: 'Headshot Count' },
      subtitle: { text: 'Number of Players in Each Range' },
      xAxis: { categories: getGraphCategories() },
      yAxis: { min: 0, title: { text: 'Number of Players' } },
      tooltip: { formatter: function() { return '' + this.x + ' Headshots: ' + this.y + ' Players'; } },
      plotOptions: { 
        column: { 
          pointPadding: 0.2,
          borderWidth: 0,
          dataLabels: {
            enabled: true,
            style: {
               fontWeight: 'bold'
            },
            formatter: function() {
              var end_string = ' Players';
              if (this.y === 1) { end_string = ' Player'; }
              return this.y + end_string;
            }
          }
        }
      },
      series: [{ name: 'Number of Headshots',  data: new_data }]
  });

  $.each(chart.series[0].data, function(index, point) {
    point.dataLabel.css({color: colors[index]});
  });
}

function getGraphCategories() {
  return ( new Function( "return " + $("#graph_container").data("categories") ) )();
}

function getGraphData() {
  return $("#graph_container").data("counts");
}
