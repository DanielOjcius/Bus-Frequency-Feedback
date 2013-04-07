$(function() {

 function drawChart(data) {
        // Create and draw the visualization.
        window.tree = new google.visualization.TreeMap(document.getElementById('chart_div'));
        tree.draw(data, {
          minColor: '#f00',
          midColor: '#ddd',
          maxColor: '#0d0',
          headerHeight: 15,
          fontColor: 'black',
          showScale: true});
        
        google.visualization.events.addListener(tree, 'select', selectHandler);
  };
  
  google.setOnLoadCallback(drawChart);

        

// // Notice that e is not used or needed.
//   function selectHandler(e) {
//     console.log('The user selected' + e +  tree.getSelection().length + ' items.');
//   }
     var consolidateData = function(data){
      return [['Location', 'Parent', 'Total'], ['Bus With low freq',null,0]].concat($.map(data, function(bus){
        return  [[bus.bus_no, 'Bus With low freq', bus.total]]; 
      }));
     };


    $.ajax({
        url: "/bus_frequencies/bus_high",
        dataType: "json",
        success: function(data){
          console.log("called");
          data= consolidateData(data);
          var a = google.visualization.arrayToDataTable(data);
          google.setOnLoadCallback(drawChart(a));
        }
      });
});