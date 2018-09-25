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
	href="../../../../res/css/user/main.css?ver=1">
<script type="text/javascript"
	src="../../../../res/script/user/main.js?ver=1"></script>
<script type="text/javascript" src="https://unpkg.com/vue/dist/vue.js"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">기본정보 변경</h3>
				<form class="form-horizontal mb-25 mt-25">
					<div class="form-group">
						<label class="col-sm-2 control-label">이름</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<input type="text" name="name" class="form-control">
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">소속 학과</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<input type="text" name="name" class="form-control">
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">이메일</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<input type="email" name="name" class="form-control">
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">학년</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<select name="grade" class="form-control">
								<option value="1">1학년</option>
								<option value="2">2학년</option>
								<option value="3">3학년</option>
								<option value="4">4학년 이상</option>
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

