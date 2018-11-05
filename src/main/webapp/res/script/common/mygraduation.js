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
	
	$("#option-show").change(function() {
		var optionShow = document.getElementById("option-show");
		var optionShowValue = optionShow.options[optionShow.selectedIndex].value;
		
		if(optionShowValue == 3) {
			$(".td-minor").show();
			$(".td-double").hide();
		}
		
		else if(optionShowValue == 4) {
			$(".td-double").show();
			$(".td-minor").hide();
		}
		
		else {
			$(".td-minor").hide();
			$(".td-double").hide();
		}
    })
});