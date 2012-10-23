function init(){
	var request = new Request.JSON({
		method: 'get', 
		url: '/Kanban/dados/name/'+nameKanban+'.json',
		urlEncoded: true,
		async: false,
		headers: {		 	
			'Content-type': 'application/json; charset=utf8',
			'X-Request': 'JSON'
		},
		onSuccess: function(responseJSON){
			if( responseJSON.status == 'SUCCESS' ){
				$('#stories').text( responseJSON.returnObject.content );
				$('#data_visualization').val( responseJSON.returnObject.burndown );
				$('#data_productbacklog').val( responseJSON.returnObject.productbacklog );
				drawVisualization();
			}else{
				$('#stories').text( '' );
				alert( "This kanban does'nt exist. It'll create a new one if you save it." );
			}
		},
		onFailure: function(){
			alert( "fail" );
		}
	});
	
	if( nameKanban != null && nameKanban != "" ){
		request.send();
	}
}

function save( name, content, burndown, productbacklog ){
	var jsonData = { 'name': name, 'content': content, 'burndown': burndown, 'productbacklog': productbacklog };
	jsonData = JSON.encode( jsonData );
	var request = new Request.JSON({
	    method: 'post',
	    url: '/Kanban/dados/dados.json',
	    data: jsonData,
	    urlEncoded: false,
	    headers: {		 	
			'Content-type': 'application/json; charset=utf8',
			'X-Request': 'JSON'
		},
		onSuccess: function (responseJSON, responseText) {
			if( responseJSON.status == 'SUCCESS' ){
				alert( 'Saved!' );
			}else{
				alert( responseJSON.message );
			}
		}
	});
	request.post();
}

function getParams() {
	var mapOfParams = new Array();
	
	var loc = location.search.substring(1, location.search.length);
	var param_value = false;
	var params = loc.split("&");
	for (var i=0; i<params.length;i++) {
		var param_name = params[i].substring(0,params[i].indexOf('='));
		var param_value = params[i].substring(params[i].indexOf('=')+1);
		mapOfParams[ param_name ] = param_value; 
	}
	
	return mapOfParams;
}
