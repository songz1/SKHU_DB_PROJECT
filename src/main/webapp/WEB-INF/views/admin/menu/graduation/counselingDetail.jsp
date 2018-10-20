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
<link rel="stylesheet" type="text/css"
	href="../../../res/css/common/form.css?ver=1">
<script type="text/javascript"
	src="../../../res/script/admin/toDetail.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">조치사항</h3>
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">학번</td>
						<td class="col-md-1">201532020</td>
						<td class="title col-md-1">이름</td>
						<td class="col-md-1">송지은</td>
						<td class="title col-md-1">학과</td>
						<td class="col-md-2">소프트웨어공학과</td>
					</tr>
					<tr>
						<td class="title col-md-1">조치 관리자</td>
						<td class="col-md-1">행정직원</td>
						<td class="title col-md-1">조치일시</td>
						<td class="col-md-2">2018.09.09</td>
						<td class="col-md-1"></td>
						<td class="col-md-2"><span style="float: center">
								<button type="submit" class="btn btn-danger"
									style="WIDTH: 100pt;">삭제</button>
						</span></td>
					</tr>
				</table>

				<table class="table text-center">
					<tr>
						<td class="title" colspan="4">조치 내용</td>
					</tr>
					<tr>
						<td class="col-md-3">!!!지은아 공부해!!!</td>
					</tr>
				</table>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>

