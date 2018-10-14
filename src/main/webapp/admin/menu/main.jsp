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
	src="../../res/script/admin/main.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<div class="table-responsive">
					<h3 class="text-center">조치사항 내역</h3>
					<table class="table text-center">
						<tr>
							<td class="title col-md-1">학번</td>
							<td class="title col-md-1">이름</td>
							<td class="title col-md-4">제목</td>
							<td class="title col-md-1">최근 조치일</td>
						</tr>
						<tr>
							<td class="col-md-1">201432019</td>
							<td class="col-md-1">신정호</td>
							<td class="col-md-4">교양필수 학점 관련</td>
							<td class="col-md-1">2018.10.13</td>
						</tr>
						<tr>
							<td class="col-md-1">201532020</td>
							<td class="col-md-1">송지은</td>
							<td class="col-md-4">전공필수 수업 관련</td>
							<td class="col-md-1">2018.09.09</td>
						</tr>
						<tr>
							<td class="col-md-1">201231099</td>
							<td class="col-md-1">홍길동</td>
							<td class="col-md-4">진로 상담</td>
							<td class="col-md-1">2018.09.02</td>
						</tr>
						<tr>
							<td class="col-md-1">201133099</td>
							<td class="col-md-1">이순신</td>
							<td class="col-md-4">학점 관련</td>
							<td class="col-md-1">2018.08.29</td>
						</tr>
						<tr>
							<td class="col-md-1">201335099</td>
							<td class="col-md-1">이세종</td>
							<td class="col-md-4">취업 관련</td>
							<td class="col-md-1">2018.08.03</td>
						</tr>
					</table>
					<nav>
					  <ul class="pager">
					    <li><a href="#" class="glyphicon glyphicon-menu-left"></a></li>
					    <li><a href="#" class="glyphicon glyphicon-menu-right"></a></li>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

