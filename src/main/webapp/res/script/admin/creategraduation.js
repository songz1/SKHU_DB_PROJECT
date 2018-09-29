$(function(){
	$(".create-grade").hide();
	$(".create-subject").hide();
	$(".create-upload").hide();
	
	$("#show-form").change(function() {
		var showForm = document.getElementById("show-form");
		var showFormValue = showForm.options[showForm.selectedIndex].value;
		
		if(showFormValue == 1) {
			$(".create-grade").show();
			$(".create-subject").hide();
			$(".create-upload").hide();
		}
		
		else if(showFormValue == 2) {
			$(".create-subject").show();
			$(".create-grade").hide();
			$(".create-upload").hide();
		}
		
		else if(showFormValue == 3) {
			$(".create-upload").show();
			$(".create-grade").hide();
			$(".create-subject").hide();
		}
    })
});