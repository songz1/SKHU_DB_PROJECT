<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../../res/css/common/main.css?ver=1">
<script type="text/javascript"
	src="../../../res/script/admin/toDetail.js?ver=1"></script>
<title>조치사항</title>
</head>
<body>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">규칙 추가</h3>
				<hr />
				<form:form action="insertrule" method="post" modelAttribute="rule">
					<form:hidden path="studentId"/>
				<div class="form-group col-md-6 col-md-offset-3 mt-25 mb-25">
					제목 <form:input path="name" class="form-control"
						maxlength="1024" /><p />
					
					내용 <form:textarea path="content" class="form-control"
						maxlength="1024" style="height: 100px" />
				</div>
				<div>
					<button type="submit"
						class="btn btn-danger col-md-2 col-md-offset-3" data-url="../main">취소</button>
				</div>
				<div>
					<button type="submit" class="btn btn-info col-md-2 col-md-offset-2">확인</button>
				</div>
				</form:form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

