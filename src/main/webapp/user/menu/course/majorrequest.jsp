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
	href="../../../res/css/user/main.css?ver=1">
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center mb-25">전공 인정 신청</h3>
				<form>
					<div class="form-group col-md-4 col-md-offset-4">
						과목 코드: <input type="text" name="subjectCode" class="form-control"
							placeholder="과목 코드"></br> 과목명: <input type="text"
							name="subjectName" class="form-control" placeholder="과목명"></br>
						개설 학과: <select name="department" class="form-control">
							<option value="1">소프트웨어공학과</option>
							<option value="2">컴퓨터공학과</option>
							<option value="3">글로컬IT학과</option>
							<option value="4">정보통신공학과</option>
						</select>
					</div>
					<div class="form-group col-md-6 col-md-offset-3 mt-25 mb-25">
						<textarea name="reportContent" class="form-control"
							maxlength="1024" style="height: 100px" placeholder="기타사항"></textarea>
					</div>
					<div>
						<button type="submit"
							class="btn btn-info col-md-2 col-md-offset-5 mb-25">신청</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

