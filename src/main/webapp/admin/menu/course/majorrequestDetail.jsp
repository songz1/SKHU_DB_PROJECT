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
				<h3 class="text-center">전공인정 신청 정보</h3>
				<hr />
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">학번</td>
						<td class="col-md-1">201432019</td>
						<td class="title col-md-1">이름</td>
						<td class="col-md-1">신정호</td>
						<td class="title col-md-1">학과</td>
						<td class="col-md-2">소프트웨어공학과</td>
					</tr>
				</table>

				<table class="table text-center">
					<tr>
						<td class="title" colspan="4">전공인정 신청 과목</td>
					</tr>
					<tr>
						<td class="title col-md-1">과목코드</td>
						<td class="title col-md-2">과목명</td>
						<td class="title col-md-1">이수구분</td>
						<td class="title col-md-1">학점</td>
					</tr>
					<tr>
						<td class="col-md-1">AC00049</td>
						<td class="col-md-2">어쩌구저쩌구</td>
						<td class="col-md-1">교선</td>
						<td class="col-md-1">3.0</td>
					</tr>
				</table>

				<button type="submit"
					class="btn btn-danger mb-20 col-md-2 col-md-offset-3">거절</button>
				<button type="submit"
					class="btn btn-info mb-20 col-md-2 col-md-offset-2">승인</button>

			</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>

