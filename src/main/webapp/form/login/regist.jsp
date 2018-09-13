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
					<form action="./login.jsp">
						<div class="form-group title">계정 정보 입력</div>
						<div class="form-group">
							<img src="../../res/image/regist_logo.jpg" class="img-responsive center-block" alt="Responsive image"/>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" id="email" placeholder="이메일">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="password" placeholder="비밀번호">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="passwordConfirm" placeholder="비밀번호 확인">
						</div>
						<div>
							<a href="./confirm.jsp"><button type="submit" class="btn btn-primary btn-block">확인</button></a>
						</div>
					</form>
					<div class="forgot">확인 버튼을 누르면 입력한 이메일 주소로 인증 메일이 전송됩니다.</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>