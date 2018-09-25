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
	href="../../res/css/admin/main.css?ver=1">
<link rel="stylesheet" type="text/css" href="test?ver=1">
<script type="text/javascript"
	src="../../../res/script/admin/main.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<div class="table-responsive">
					<h3 class="text-center">학생 신청 현황</h3>
					<table class="table text-center">
						<tr>
							<td class="title line" colspan="3">전공인청 신청내역</td>
							<td class="title" colspan="3">대체과목 신청내역</td>
						</tr>
						<tr>
							<td class="title col-md-1">신청자</td>
							<td class="title col-md-4">신청내역</td>
							<td class="title line"></td>
							<td class="title col-md-1">신청자</td>
							<td class="title col-md-4">신청내역</td>
							<td class="title col-md-1"></td>
						</tr>
						<tr>
							<td class="col-md-1">신정호</td>
							<td class="col-md-4">보안시스템</td>
							<td class="line">new</td>
							<td class="col-md-1">송지은</td>
							<td class="col-md-4">모바일 프로그래밍</td>
							<td class="col-md-1">new</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

