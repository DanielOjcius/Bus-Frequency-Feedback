$(function() {

 function drawChart(data) {
        // Create and draw the visualization.
        window.data = data;
        window.tree = new google.visualization.TreeMap(document.getElementById('chart_div'));
        tree.draw(data, {
          minColor: '#F7CBCB',
          midColor: '#FA6E6E',
          maxColor: '#FF0000',
          headerHeight: 15,
          fontColor: 'black',
          showScale: true});
        
        google.visualization.events.addListener(tree, 'select', selectHandler);
  };
  

// // Notice that e is not used or needed.
  function selectHandler(e) {
    var bus_no = data.getFormattedValue(tree.getSelection()[0].row,0);
    window.location.replace('/bus_frequencies/bus/' + bus_no);
  }

     var consolidateData = function(data, type){
      return [['Location', 'Parent', 'Total'], ['Bus With ' + type + ' freq',null,0]].concat($.map(data, function(bus){
        return  [[bus.bus_no, 'Bus With ' + type + ' freq', parseInt(bus.total)]]; 
      }));
     };

     var load_frequency_chart = function(type){
      $.ajax({
          url: "/bus_frequencies/bus_" + type,
          dataType: "json",
          success: function(data){
            console.log("called");
            data= consolidateData(data, type);
            var a = google.visualization.arrayToDataTable(data);
            drawChart(a);
          }
        });
     };
     load_frequency_chart("low");

     $("#freq").change(function(){
      load_frequency_chart($(this).val());
     });

});