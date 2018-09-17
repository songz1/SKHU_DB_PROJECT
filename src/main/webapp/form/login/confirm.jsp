<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../res/css/form.css?ver=1">
<script type="text/javascript" src="../../res/script/form.js?ver=1"></script>
<title>성공회대 학사 시스템</title>
</head>
<body>
	<div class="wrap text-center">
		<div class="outer">
			<div class="inner">
				<div class="centered">
					<form class="form-inline" action="../menu/main.jsp">
						<div class="form-group title">이메일 인증</div>
						<div>
							<img src="../../res/image/regist_logo.jpg" class="img-responsive center-block" alt="Responsive image"/>
						</div>
						<div class="input-group">
							<div class="input-group-addon">인증번호</div>
								<input type="text" class="form-control" id="confirmCode">
						</div>
						<a href="login.jsp"><button type="submit" class="btn btn-info">인증</button></a>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>