$(function(){
	var optionShow = document.getElementById("option-show");
	
	$(".hide-form").hide();

	$("#option-show").change(function() {
		var optionShowValue = optionShow.options[optionShow.selectedIndex].value;
		
		$(".hide-form").hide();
		
		$("#" + optionShowValue).show();
			
    })
});