$(function(){
	$(".detail").hide();
	
	$(".summary").click(function() {
		if ($('.detail').is(":visible")) { 
	        $('.detail').hide();
	    } else { 
	        $('.detail').show();
	    } 
	})
});