$(function() {
	$("[data-url]").click(function() {
		var url = $(this).attr("data-url");
		location.href = url;
	})
	
	$("[data-confirm-delete]").click(function() {
		return confirm("계정을 삭제하시겠습니까?");
	})
})