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
	<jsp:include page="../header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">관리자 정보</h3>
				<hr />
				<form class="form-horizontal mb-25 mt-25">
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label col-md-offset-1">교번</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<input type="text" name="number" class="form-control"
								value="201099999">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label col-md-offset-1">이름</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<input type="text" name="name" class="form-control" value="관리자1">
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label col-md-offset-1">담당 부서</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<select name="part" class="form-control">
								<option value="1">IT학부</option>
								<option value="2">행정</option>
								<option value="3">교수</option>
							</select>
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label col-md-offset-1">권한</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
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
						class="btn btn-danger mb-20 col-md-2 col-md-offset-3">탈퇴</button>
					<button type="submit"
						class="btn btn-info mb-20 col-md-2 col-md-offset-2">수정</button>
				</form>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>

