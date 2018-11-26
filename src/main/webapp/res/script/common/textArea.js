$(function(){
	var str = $('#content').val();
	str = str.split('<br/>').join("\r\n");
	$('#content').val(str);
	
	$('#rule').submit(function() { 
		var str = $('#content').val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$('#content').val(str);
		
		return true; 
	});
	
	$('#action').submit(function() { 
		var str = $('#content').val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$('#content').val(str);
		
		return true; 
	});
	
});