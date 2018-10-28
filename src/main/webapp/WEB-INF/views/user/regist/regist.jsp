<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	href="../../res/css/user/login.css?ver=1">
<link rel="stylesheet" type="text/css"
	href="../../res/css/common/login.css?ver=1">
<title>성공회대 학사 시스템</title>
</head>
<body>
	<div class="wrap text-center">
		<div class="outer">
			<div class="inner">
				<div class="centered">
					<form:form action="insert" method="post" modelAttribute="student">
						<div class="form-group">
							<img src="../../res/image/login_logo.png"
								class="img-responsive center-block" alt="Responsive image" />
						</div>
						<div class="form-group title">회원가입</div>
						<div class="form-group">
							<input type="text" class="form-control" name="name"
								placeholder="이름">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="studentNumber"
								placeholder="학번">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email"
								placeholder="이메일">
						</div>
						<div class="form-group">
							<form:select path="departmentId" class="form-control" itemValue="id" itemLabel="name" items="${ departments }" />
						</div>
						<div class="form-group">
							<select name="year" class="form-control">
								<option value="1">1학년</option>
								<option value="2">2학년</option>
								<option value="3">3학년</option>
								<option value="4">4학년 이상</option>
							</select>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="password"
								placeholder="비밀번호">
						</div>
						<div class="form-group">
							<input type="password" class="form-control"
								name="passwordConfirm" placeholder="비밀번호 확인">
						</div>
						<div>
							<button type="submit" class="btn btn-info btn-block">다음</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>