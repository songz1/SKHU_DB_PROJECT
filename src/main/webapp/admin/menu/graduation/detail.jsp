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
	src="../../../res/script/common/mygraduation.js?ver=1"></script>
	<script type="text/javascript"
	src="../../../res/script/common/graduation.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h1>학부/학과 졸업요건</h1>
				<form method="post" enctype="multipart/form-data">
					<table class="table mt-25">
						<thead>
							<tr>
								<th colspan="3">인문융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">영어학과</td>
							</tr>
							<tr class="way-detail">
								<td class="col-md-4 text-center cursor tr-hover" data-url="info.jsp">2018학번 이후</td>
								<td class="col-md-4 text-center cursor tr-hover">2017학번</td>
								<td class="col-md-4 text-center cursor tr-hover">2016학번</td>
							</tr>
							<tr class="way-detail">
								<td class="col-md-4 text-center cursor tr-hover">2015학번</td>
								<td class="col-md-4 text-center cursor tr-hover">2014학번</td>
								<td class="col-md-4 text-center cursor tr-hover">2013학번</td>
							</tr>
							<tr class="way-detail">
								<td class="col-md-4 text-center cursor tr-hover">2012학번</td>
								<td class="col-md-4 text-center cursor tr-hover">2011학번</td>
								<td class="col-md-4 text-center cursor tr-hover">2010학번 이전</td>
							</tr>


							<tr class="tr-hover cursor way-essential">
								<td colspan="3">일어일본학과</td>
							</tr>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">중어중국학과</td>
							</tr>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">신학과(기독교문화전공)</td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<th colspan="3">사회융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">사회과학과</td>
							</tr>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">사회복지학과</td>
							</tr>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">경영학과</td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<th colspan="3">미디어컨텐츠융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">신문방송학과</td>
							</tr>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">디지털컨텐츠학과</td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<th colspan="3">IT융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">컴퓨터공학과</td>
							</tr>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">소프트웨어공학과</td>
							</tr>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">정보통신공학과</td>
							</tr>
							<tr class="tr-hover cursor way-essential">
								<td colspan="3">글로컬IT공학과</td>
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

