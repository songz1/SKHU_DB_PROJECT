$(function(){
	$(".essential-detail").hide();
	$(".area-detail").hide();
	$(".major-detail").hide();
	
	$(".essential").click(function() {
		if ($('.essential-detail').is(":visible")) { 
	        $('.essential-detail').hide();
	    } else { 
	        $('.essential-detail').show();
	    } 
	})
	
	$(".area-essential").click(function() {
		if ($('.area-detail').is(":visible")) { 
	        $('.area-detail').hide();
	    } else { 
	        $('.area-detail').show();
	    } 
	})
	
	$(".major-searching").click(function() {
		if ($('.major-detail').is(":visible")) { 
	        $('.major-detail').hide();
	    } else { 
	        $('.major-detail').show();
	    } 
	})
});