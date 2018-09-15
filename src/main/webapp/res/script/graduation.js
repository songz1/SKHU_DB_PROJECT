$(function(){
	$(".old-detail").hide();
	$(".new-detail").hide();
	
	$(".old").click(function() {
		if ($('.old-detail').is(":visible")) { 
	        $('.old-detail').hide();
	        $('h1.new').show();
	    } else { 
	        $('.old-detail').show();
	        $('h1.new').hide();
	    }
		
		document.getElementById('mtb').classList.toggle('mt-200');
		document.getElementById('mtb').classList.toggle('mb-200');
	});
	
	$(".new").click(function() {
		if ($('.new-detail').is(":visible")) { 
	        $('.new-detail').hide();
	        $('h1.old').show();
	    } else { 
	        $('.new-detail').show();
	        $('h1.old').hide();
	    } 
	});
	
	$("[data-url]").click(function() {
		window.open("./info.jsp", "졸업요건", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	}); 
	
});