$(document).ready(function() {
  var chart = new Highcharts.Chart({
      chart: {
         renderTo: 'graph_container',
         defaultSeriesType: 'column'
      },
      title: {
         text: 'Headshot Statistics'
      },
      subtitle: {
         text: 'MI6 Battlefield 3 Server'
      },
      xAxis: {
         categories: getGraphCategories()
      },
      yAxis: {
         min: 0,
         title: {
            text: 'Frequency'
         }
      },
      tooltip: {
         formatter: function() {
            return ''+
               this.x +' Headshots: '+ this.y +' People';
         }
      },
      plotOptions: {
         column: {
            pointPadding: 0.2,
            borderWidth: 0
         }
      },
     series: [{
         name: 'Headshots',
         data: getGraphData()
      }]
   });
});

function getGraphData() {
  return ( new Function( "return " + $("#graph_container").attr("data-graph") ) )();
}

function getGraphCategories() {
  return ( new Function( "return " + $("#graph_container").attr("data-categories") ) )();
}
