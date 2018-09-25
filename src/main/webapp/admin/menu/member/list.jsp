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
	href="../../../res/css/admin/main.css?ver=1">
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
			<h3 class="text-center">학생 목록</h3>
			
				<table class="table table-bordered mt5">
					<thead>
						<tr>
							<th>학번</th>
							<th>이름</th>
							<th>학과</th>
							<th>학년</th>
						</tr>
					</thead>
					<tbody>
							<tr data-url="detail?id=201532020">
								<td>201532020</td>
								<td>송지은</td>
								<td>소프트웨어공학과</td>
								<td>3학년</td>
							</tr>
							<tr data-url="detail?id=201432019">
								<td>201432019</td>
								<td>신정호</td>
								<td>소프트웨어공학과</td>
								<td>3학년</td>
							</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

