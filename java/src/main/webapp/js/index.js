function onchangeSelectKanban(){
	var index = $('cbAllKanbans').selectedIndex;
	if( index > 0 ){
		var strUrl = $('avancar').name + $('cbAllKanbans').options[ index ].value;
		$('avancar').setAttribute( 'href', strUrl );
		$('avancar').setAttribute( 'onclick', '' );
	}else{
		$('avancar').setAttribute( 'href', '#' );
		$('avancar').setAttribute( 'onclick', "alert('Selecione um kanban!');" );
	}
}

function dataDispatcherGetAllKanbans(){
	var request = new Request.JSON({
		method: 'get',
		url: '/Kanban/dados/dados.json',
		urlEncoded: false,
		async: true,
		headers:{
			'Content-type': 'application/json; charset=utf8',
			'X-Request': 'JSON'
		},
		onSuccess: function( responseJSON ){
			responseAnalyserGetAllKanbans( responseJSON );
		}
	});
	request.send();
}

function responseAnalyserGetAllKanbans( responseJSON ){
	if( responseJSON == null || responseJSON.returnObject == null ) return;
	var options = responseJSON.returnObject;
	var comboBox = $( 'cbAllKanbans' );
	comboBox.appendChild( getOptionComboBoxDefault() );
	for( var i=0; i<options.length; i++ ){
		var option = options[i];
		comboBox.appendChild( getOptionComboBox( option.name, option.name ) );
	}
}

function getOptionComboBoxDefault(){
	var tagOption = document.createElement( 'option' );
	tagOption.setAttribute( 'value', 'undefined' );
	tagOption.setAttribute( 'selected', 'selected' );
	tagOption.innerHTML = 'Selecione uma opção...';
	
	return tagOption;
}

function getOptionComboBox( value, text ){
	if( $type( text ) != "string" ) return;
	
	var tagOption = document.createElement( 'option' );
	tagOption.setAttribute( 'value', value );
	tagOption.innerHTML = text;
	
	return tagOption;
}
