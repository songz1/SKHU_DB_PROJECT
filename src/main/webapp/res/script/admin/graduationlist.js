$(function(){
	$("#allCheck").click(function() {
		if($("#allCheck").prop("checked")){
            $("input[name=deleteId]").prop("checked",true);
        }else{
            $("input[name=deleteId]").prop("checked",false);
        }
    })
    
    $("[edit-subject]").click(function() {
    	var url = $(this).attr("edit-subject");
		location.href = url;
	});
	
	$("[edit-grade]").click(function() {
		var url = $(this).attr("edit-grade");
		location.href = url;
	}); 
});