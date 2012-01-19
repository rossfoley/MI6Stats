$(document).ready(function() {
  var graphData = ( new Function( "return " + $("#headshots").attr("data-graph") ) )();
  $.plot($("#placeholder"), [graphData]);
});
