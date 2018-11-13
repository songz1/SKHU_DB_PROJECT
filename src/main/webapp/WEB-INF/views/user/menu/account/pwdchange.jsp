<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">비밀번호 변경</h3>
				<form:form method="post" action="pwdupdate" modelAttribute="account" class="form-inline mt-25 mb-25">
					<form:hidden path="id" />
					<div>
						<div class="input-group mb-25 col-md-4 col-md-offset-1">
							<div class="input-group-addon">변경 패스워드</div>
							<form:password class="form-control" path="password" />
						</div>
					</div>
					<div>
						<div class="input-group mb-25 col-md-4 col-md-offset-1">
							<div class="input-group-addon">패스워드 확인</div>
							<input type="password" class="form-control" name="passwordConfirm">
						</div>
					</div>
					<div>
						<button type="submit" class="btn btn-info mb-25 col-md-1 col-md-offset-4">확인</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

