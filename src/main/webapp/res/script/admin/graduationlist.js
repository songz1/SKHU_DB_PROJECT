$(function(){
	$("#allCheck").click(function() {
		if($("#allCheck").prop("checked")){
            $("input[name=deleteId]").prop("checked",true);
        }else{
            $("input[name=deleteId]").prop("checked",false);
        }
    })
});