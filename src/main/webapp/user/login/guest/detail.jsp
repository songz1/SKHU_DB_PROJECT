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
<script type="text/javascript"
	src="../../../res/script/admin/toDetail.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h1>학부/학과 졸업요건</h1>
				<form method="post" enctype="multipart/form-data">
					<table class="table mt-25">
						<thead>
							<tr>
								<th class="col-md-12">인문융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr class="tr-hover cursor" data-url="yearChoice.jsp">
								<td>영어학과</td>
							</tr>
							<tr class="tr-hover cursor" data-url="yearChoice.jsp">
								<td>일어일본학과</td>
							</tr>
							<tr class="tr-hover cursor" data-url="yearChoice.jsp">
								<td>중어중국학과</td>
							</tr>
							<tr class="tr-hover cursor" data-url="yearChoice.jsp">
								<td>신학과(기독교문화전공)</td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<th class="col-md-12">사회융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr class="tr-hover cursor">
								<td>사회과학과</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>사회복지학과</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>경영학과</td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<th class="col-md-12">미디어컨텐츠융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr class="tr-hover cursor">
								<td>신문방송학과</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>디지털컨텐츠학과</td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<th class="col-md-12">IT융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr class="tr-hover cursor">
								<td>컴퓨터공학과</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>소프트웨어공학과</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>정보통신공학과</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>글로컬IT공학과</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

