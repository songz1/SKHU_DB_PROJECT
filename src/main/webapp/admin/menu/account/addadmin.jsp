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
	href="../../../res/css/common/main.css?ver=1">
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">관리자 추가</h3>
				<form class="form-horizontal mb-25 mt-25">
					<div class="form-group">
						<label class="col-sm-2 control-label">교번</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<input type="text" name="id" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">비밀번호</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<input type="password" name="password" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">비밀번호 확인</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<input type="password" name="passwordConfirm" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">이름</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<input type="text" name="name" class="form-control">
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">이메일</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<input type="email" name="email" class="form-control">
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">소속 학과</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<select name="department" class="form-control">
								<option value="1">소프트웨어공학과</option>
								<option value="2">컴퓨터공학과</option>
								<option value="3">영어학과</option>
								<option value="4">중국어학과</option>
							</select>
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">권한</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<select name="right" class="form-control">
								<option value="5">5 - 총괄</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="2">3</option>
								<option value="4">4</option>
							</select>
						</div>
					</div>
					
					<button type="submit"
						class="btn btn-info mb-25 col-md-2 col-md-offset-5">확인</button>
				</form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

