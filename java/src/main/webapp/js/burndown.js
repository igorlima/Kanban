google.load('visualization', '1', {packages: ['corechart']});

function loadData( data ){
	var arrayData = $('#data_visualization').val().split('\n');
	for( var i=0; i<arrayData.length; i++ ){
		data.addRow( eval(arrayData[i]) );
	}
	/*
	 * Example:
	data.addRow(["03-jul", 204, 204]);
    data.addRow(["04-jul", 187, 162]);
    data.addRow(["05-jul", 170, null]);
    data.addRow(["06-jul", 153, null]);
    data.addRow(["07-jul", 136, null]);
    data.addRow(["08-jul", 119, null]);
    data.addRow(["11-jul", 102, null]);
    data.addRow(["12-jul", 085, null]);
    data.addRow(["13-jul", 068, null]);
    data.addRow(["14-jul", 051, null]);
    data.addRow(["15-jul", 034, null]);
    data.addRow(["18-jul", 017, null]);
    data.addRow(["19-jul", 000, null]);
    */
}

function drawVisualization() {
    // Create and populate the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'data');
    data.addColumn('number', 'PREVISTO');
    data.addColumn('number', 'Realizado');
    loadData( data );
   
    // Create and draw the visualization.
    new google.visualization.LineChart(document.getElementById('visualization')).
        draw(data, {curveType: "none",
        			axisTitlesPosition: 'in',
        			legend: 'bottom',
        			title: 'BURN DOWN',
        			titlePosition: 'in',
        			titleTextStyle: {fontSize: 15},
                    width: 850, height: 400,
                    hAxis: {title: 'DIAS', textStyle: {fontSize:10} },
                    vAxis: {title: 'HORAS', maxValue: 10, baseline: 0}} 
            );
    
    //Removing style attribute
    $('#visualization').removeAttr( 'style' );
}
  

//google.setOnLoadCallback(drawVisualization);