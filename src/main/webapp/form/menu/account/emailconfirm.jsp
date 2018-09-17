<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="../../../res/css/main.css?ver=1">
<script type="text/javascript" src="../../../res/script/main.js?ver=1"></script>
<script type="text/javascript" src="https://unpkg.com/vue/dist/vue.js"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">이메일 변경</h3>
				<form class="form-inline mt-25 mb-25">
					<div class="input-group col-md-4">
						<div class="input-group-addon">인증번호</div>
						<input type="text" class="form-control" id="confirmCode">
					</div>
					<a href="./login.jsp"><button type="submit" class="btn btn-info">인증</button></a>
				</form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

