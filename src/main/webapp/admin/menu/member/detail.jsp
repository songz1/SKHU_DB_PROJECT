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
	href="../../res/css/common/main.css?ver=1">
<script type="text/javascript"
	src="../../../res/script/admin/main.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">학생 정보</h3>
				<hr />
				<form class="form-horizontal mb-25 mt-25">
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label col-md-offset-1">학번</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<input type="text" name="number" class="form-control"
								value="201532020">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label col-md-offset-1">이름</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<input type="text" name="name" class="form-control" value="송지은">
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label col-md-offset-1">학과</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<select name="department" class="form-control">
								<option value="1">소프트웨어공학과</option>
								<option value="2">컴퓨터공학과</option>
								<option value="3">글로컬IT학과</option>
								<option value="4">정보통신공학과</option>
							</select>
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label col-md-offset-1">학년</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<select name="grade" class="form-control">
								<option value="3">3학년</option>
								<option value="1">1학년</option>
								<option value="2">2학년</option>
								<option value="4">4학년 이상</option>
							</select>
						</div>
					</div>
					
					<button type="submit"
						class="btn btn-danger mb-20 col-md-2 col-md-offset-3">취소</button>
					<button type="submit"
						class="btn btn-info mb-20 col-md-2 col-md-offset-2">수정</button>
				</form>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>

