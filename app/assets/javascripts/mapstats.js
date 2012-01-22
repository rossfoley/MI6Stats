$(document).ready(function() {
  $(".tablesorter").tablesorter();
  createMapGraph();
});

function createMapGraph() {
  chart = new Highcharts.Chart({
      chart: { renderTo: 'graph_map', defaultSeriesType: 'column' },
      title: { text: 'Map Statistics' },
      subtitle: { text: 'Average Number of Players' },
      xAxis: { categories: getGraphCategories() },
      yAxis: { min: 0, title: { text: 'Number of Players' } },
      tooltip: { formatter: function() { return '' + this.series.name + ': ' + this.y + ' Players'; } },
      plotOptions: { column: { pointPadding: 0.2, borderWidth: 0 } },
      series: [{ name: 'Total',  data: getGraphData("total") },
               { name: 'Left',   data: getGraphData("left") },
               { name: 'Joined', data: getGraphData("joined") }]
   });
}

function getGraphCategories() {
  return ( new Function( "return " + $("#graph_map").data("categories") ) )();
}

function getGraphData(key) {
  return $("#graph_map").data(key);
}
