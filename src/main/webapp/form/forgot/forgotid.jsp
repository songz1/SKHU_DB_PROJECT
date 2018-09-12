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
<title>아이디 찾기</title>
</head>
<body>
	<div class="wrap text-center">
		<div class="outer">
			<div class="inner">
				<div class="centered">
					<form class="form-horizontal">
						<div class="form-group title">아이디 찾기</div>
						<div>
							<img src="../../res/image/login_logo.jpg" class="img-responsive center-block" alt="Responsive image"/>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" > 이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name">
						    </div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> 생년월일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="birth" placeholder="ex) 19921215">
							</div>
						</div>
						<div>
							<button type="submit" class="btn btn-primary btn-block" onclick="confirm">이메일 인증</button>
						</div>
					</form>
					<div class="forgot">이메일은 계정에서 인증한 이메일 주소로 전송됩니다.</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>