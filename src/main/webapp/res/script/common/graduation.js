$(function(){
	$("[data-url]").click(function() {
		var url = $(this).attr("data-url");
		window.open(url, "졸업요건", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	}); 
	
});