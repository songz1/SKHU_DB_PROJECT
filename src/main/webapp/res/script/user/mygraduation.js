$(function(){
	$(".way-detail").hide();
	$(".subject-detail").hide();
	$(".td-minor").hide();
	$(".td-double").hide();
	
	$(".way-essential").click(function() {
		if ($('.way-detail').is(":visible")) { 
	        $('.way-detail').hide();
	    } else { 
	        $('.way-detail').show();
	    } 
	})
	
	$(".essential-subject").click(function() {
		if ($('.subject-detail').is(":visible")) { 
	        $('.subject-detail').hide();
	    } else { 
	        $('.subject-detail').show();
	    } 
	})
	
	$("#tse").change(function() {
		var ss = document.getElementById("tse");
		var ssValue = ss.options[ss.selectedIndex].value;
		
		if(ssValue == 2) {
			$(".td-minor").show();
			$(".td-double").hide();
		}
		
		else if(ssValue == 3) {
			$(".td-double").show();
			$(".td-minor").hide();
		}
		
		else {
			$(".td-minor").hide();
			$(".td-double").hide();
		}
    })
});