$(document).ready(function() {
  $(".tablesorter").tablesorter();
  createAverageGraph();
  createLeftGraph();
  createJoinedGraph();
});

function createAverageGraph() {
  chart = new Highcharts.Chart({
      chart: {
         renderTo: 'graph_average',
         defaultSeriesType: 'column'
      },
      title: { text: 'Average Number of Players in Server' },
      subtitle: { text: 'MI6 Battlefield 3 Server' },
      xAxis: { categories: getAverageCategories() },
      yAxis: {
         min: 0,
         title: { text: 'Number of Players' }
      },
      tooltip: {
         formatter: function() {
            return '' + this.x + ': ' + this.y + ' Players';
         }
      },
      plotOptions: {
         column: {
            pointPadding: 0.2,
            borderWidth: 0
         }
      },
      series: [{
         name: 'Map',
         data: getAverageData()
   
      }]
   });
}

function getAverageCategories() {
  return ( new Function( "return " + $("#graph_average").attr("data-categories") ) )();
}

function getAverageData() {
  return ( new Function( "return " + $("#graph_average").attr("data-players") ) )();
}
function createLeftGraph() {
  chart = new Highcharts.Chart({
      chart: {
         renderTo: 'graph_left',
         defaultSeriesType: 'column'
      },
      title: { text: 'Average Number of Players Who Left' },
      subtitle: { text: 'MI6 Battlefield 3 Server' },
      xAxis: { categories: getLeftCategories() },
      yAxis: {
         min: 0,
         title: { text: 'Number of Players' }
      },
      tooltip: {
         formatter: function() {
            return '' + this.x + ': ' + this.y + ' Players';
         }
      },
      plotOptions: {
         column: {
            pointPadding: 0.2,
            borderWidth: 0
         }
      },
      series: [{
         name: 'Map',
         data: getLeftData()
      }]
   });
}

function getLeftCategories() {
  return ( new Function( "return " + $("#graph_left").attr("data-categories") ) )();
}

function getLeftData() {
  return ( new Function( "return " + $("#graph_left").attr("data-players") ) )();
}
function createJoinedGraph() {
  chart = new Highcharts.Chart({
      chart: {
         renderTo: 'graph_joined',
         defaultSeriesType: 'column'
      },
      title: { text: 'Average Number of Players Who Joined' },
      subtitle: { text: 'MI6 Battlefield 3 Server' },
      xAxis: { categories: getJoinedCategories() },
      yAxis: {
         min: 0,
         title: { text: 'Number of Players' }
      },
      tooltip: {
         formatter: function() {
            return '' + this.x + ': ' + this.y + ' Players';
         }
      },
      plotOptions: {
         column: {
            pointPadding: 0.2,
            borderWidth: 0
         }
      },
      series: [{
         name: 'Map',
         data: getJoinedData()
   
      }]
   });
}

function getJoinedCategories() {
  return ( new Function( "return " + $("#graph_joined").attr("data-categories") ) )();
}

function getJoinedData() {
  return ( new Function( "return " + $("#graph_joined").attr("data-players") ) )();
}
