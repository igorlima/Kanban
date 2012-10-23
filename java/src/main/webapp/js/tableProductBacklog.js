   google.load('visualization', '1', {packages: ['table']});
   function drawTableProductBacklog() {
      var cssClassNames = {
         'headerRow': '',
         'tableRow': 'table-row',
         'oddTableRow': 'table-row-odd',
         'selectedTableRow': '',
         'hoverTableRow': '',
         'headerCell': 'google-visualization-table-th google-visualization-table-sorthdr header-cell',
         'tableCell': '',
         'rowNumberCell': 'google-visualization-table-th google-visualization-table-sorthdr row-numbercell'};
         
      var options = {'showRowNumber': true, 'allowHtml': true, 'cssClassNames': cssClassNames};
      
      var data = getData();
      setCellsProperty( data );
    
      // Create and draw the visualization.
      var table = new google.visualization.Table(document.getElementById('table_productbacklog'));
      google.visualization.events.addListener(table, 'select', selectHandler);
      table.draw(data, options);
      
      function getData(){
    	  // Create and populate the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('number', 'Item');
          data.addColumn('string', 'Descrição');
          data.addColumn('number', 'Estimativa');
          data.addColumn('string', 'by');
          data.addColumn('string', 'Notas');
          data.addColumn('boolean', 'OK');
    	  
          
    	  var rowsDataProductBacklog = $('#data_productbacklog').val().split('\n');
    	  for( var row=0; row<rowsDataProductBacklog.length; row++ ){
    		  data.addRows(1);
    		  var cells = rowsDataProductBacklog[row].split(';');
    		  for( var column=0; column<rowsDataProductBacklog.length; column++ ){
    			  if( column < data.getNumberOfColumns() ){
    				  data.setCell(row, column, convertData( column, cells ) );
    			  }
    		  }
    	  }
    	  
          return data;
          
          function convertData( column, cells ){
        	  switch( data.getColumnType( column ) ){
              case 'string':
            	  return cells[column];
            	  break;
              case 'number':
            	  var strNumber = parseFloat( cells[column] );
            	  if( strNumber.toString() == 'NaN' ){
            		  return null;
            	  }else{
            		  return strNumber;
            	  }
            	  break;
              case 'boolean':
            	  if( cells[column] == null || cells[column] == '' ){
            		  return null;
            	  }else if( $type(cells[column])=='string' && cells[column].toLowerCase() == 'false' ){
            		  return false;
            	  }else{
            		  return Boolean( cells[column] );
            	  }
            	  break;
              default:
            	  return null;
              } 
          }
      }
	  
      function setCellsProperty( data ){
         for( var row=0; row<data.getNumberOfRows(); row++ ){
            for( var column=0; column<data.getNumberOfColumns(); column++ ){
               setCellProperty( data, row, column );
            }
         }
     
         function setCellProperty( data, row, column ){
            switch( column ){
            case 0:
               data.setProperty(row, column, 'className', 'google-visualization-table-td column-item');
               break;
            case 1:
                data.setProperty(row, column, 'className', 'google-visualization-table-td column-descricao');
               break;
            case 2:
               data.setProperty(row, column, 'className', 'google-visualization-table-td column-estimativa');
               break;
            case 3:
               data.setProperty(row, column, 'className', 'google-visualization-table-td column-by');
               break;
            case 4:
            	data.setProperty(row, column, 'className', 'google-visualization-table-td column-notas');
               break;
            case 5:
               if( data.getValue(row,column) ){
            	   data.setProperty(row, column, 'className', 'google-visualization-table-td column-ok-true');
               }else{
            	   data.setProperty(row, column, 'className', 'google-visualization-table-td column-ok-false');
               }
               break;
            default:
            }
         }
      }
      
      function selectHandler() {
	   
      }
   }
   //google.setOnLoadCallback(drawTableProductBacklog);
