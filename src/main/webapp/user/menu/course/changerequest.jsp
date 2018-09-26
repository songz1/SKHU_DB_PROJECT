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
				<h3 class="text-center mb-25">대체 과목 신청</h3>
				<form>
					<div class="form-group col-md-4 col-md-offset-1">
						<div class="text-center">
							<label>폐지과목</label>
						</div>
						</p>
						과목 코드: <input type="text" name="subjectCodeB" class="form-control"
							placeholder="과목 코드"></br> 과목명: <input type="text"
							name="subjectNameB" class="form-control" placeholder="과목명"></br>
						이수 구분: <select name="partB" class="form-control">
							<option value="1">전공필수</option>
							<option value="2">전공선택</option>
							<option value="3">전공탐색</option>
							<option value="4">교양필수</option>
							<option value="5">교양선택</option>
						</select>
					</div>
					<div class="form-group text-center col-md-2">
						<i class="glyphicon glyphicon-arrow-right"></i>
					</div>
					<div class="form-group col-md-4">
						<div class="text-center">
							<label>대체과목</label>
						</div>
						</p>
						과목 코드: <input type="text" name="subjectCodeA" class="form-control"
							placeholder="과목 코드"></br> 과목명: <input type="text"
							name="subjectNameA" class="form-control" placeholder="과목명"></br>
						이수 구분: <select name="partA" class="form-control">
							<option value="1">전공필수</option>
							<option value="2">전공선택</option>
							<option value="3">전공탐색</option>
							<option value="4">교양필수</option>
							<option value="5">교양선택</option>
						</select>
					</div>
					<div class="form-group col-md-6 col-md-offset-3 mt-25 mb-25">
						<textarea name="reportContent" class="form-control"
							maxlength="1024" style="height: 100px;" placeholder="기타사항"></textarea>
					</div>
					<div>
						<button type="button"
							class="btn btn-danger col-md-2 col-md-offset-3">취소</button>
					</div>
					<div>
						<button type="submit"
							class="btn btn-info col-md-2 col-md-offset-2 mb-25">신청</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

