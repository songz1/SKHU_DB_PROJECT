$(function(){
	var optionShow = document.getElementById("option-show");

	$("#option-show").change(function() {
		var optionShowValue = optionShow.options[optionShow.selectedIndex].value;
		var temp = document.getElementById(optionShowValue);
		
		for(var count = 0; count < optionShow.length; count++) {
			if(optionShowValue == temp)
				temp.show();
			
			else
				temp.hide();
		}
    })
});