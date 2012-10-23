
window.addEvent('domready',function(){
			
	document.id('btProductBacklog').addEvent('click',function(){
		
		drawTableProductBacklog();
		
		popup_productbacklog = new LightFace({
			width: 850,
 			title: 'Product Backlog',
 			content: $('#table_productbacklog').html(),
			draggable: true,
			buttons: [
				{ title: 'Fechar', event: function() { this.close(); } }
			]
 		});
		popup_productbacklog.open();
		
	});
	
});