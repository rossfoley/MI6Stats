$(document).ready(function() {
  $(".tablesorter").tablesorter();
  createPieChart();
});

function getPieData() {
  return ( new Function( "return " + $("#graph_container").attr("data-pie") ) )();
}

function createPieChart() {
  var chart = new Highcharts.Chart({
      chart: {
         renderTo: 'graph_container',
         plotBackgroundColor: null,
         plotBorderWidth: null,
         plotShadow: false
      },
      title: {
         text: 'MI6 Server: Number of Headshots'
      },
      tooltip: {
         formatter: function() {
            return '<b>'+ this.point.name +'</b>: '+ this.y +' Soldiers, '+ Math.round(this.percentage) +' %';
         }
      },
      plotOptions: {
         pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
               enabled: false
            },
            showInLegend: true
         }
      },
     series: [{
       type: 'pie',
       name: 'Headshot Statistics',
       data: getPieData()
     }]
  });
}

function getGraphData() {
  return ( new Function( "return " + $("#graph_container").attr("data-graph") ) )();
}

function getGraphCategories() {
  return ( new Function( "return " + $("#graph_container").attr("data-categories") ) )();
}

function createLineChart() {
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
               this.x +' Headshots: '+ this.y +'%';
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
}
