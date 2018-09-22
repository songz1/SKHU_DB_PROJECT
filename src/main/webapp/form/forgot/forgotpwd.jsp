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
					<form class="form-horizontal" action="./confirm.jsp">
						<div>
							<img src="../../res/image/login_logo.png" class="img-responsive center-block" alt="Responsive image"/>
						</div>
						<div class="form-group title">패스워드 초기화</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" > 아이디</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="studentNumber">
						    </div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> 이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name">
							</div>
						</div>
						<div>
							<button type="submit" class="btn btn-info btn-block" onclick="confirm">다음</button>
						</div>
						<div class="forgot mt-10">초기화된 비밀번호는 s+주민등록번호  뒷자리(s1234567)입니다.</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>