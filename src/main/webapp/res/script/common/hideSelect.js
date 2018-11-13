$(function(){
	var optionShow = document.getElementById("option-show");
	var startOptionValue = optionShow.options[optionShow.selectedIndex].value;
	
	if(startOptionValue == "부전공") {
		$(".div-minor").show();
		$(".div-double").hide();
	}
	
	else if(startOptionValue == "복수전공") {
		$(".div-minor").hide();
		$(".div-double").show();
	}
	
	else {
		$(".div-minor").hide();
		$(".div-double").hide();
	}

	$("#option-show").change(function() {
		var optionShowValue = optionShow.options[optionShow.selectedIndex].value;
		if(optionShowValue == "부전공") {
			$(".div-minor").show();
			$(".div-double").hide();
		}
		else if(optionShowValue == "복수전공") {
			$(".div-double").show();
			$(".div-minor").hide();
		}
		else {
			$(".div-minor").hide();
			$(".div-double").hide();
		}
    })
});