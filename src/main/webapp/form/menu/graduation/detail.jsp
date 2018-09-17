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
	href="../../../res/css/main.css?ver=1">
<script type="text/javascript" src="../../../res/script/graduation.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<header>
		<div id="divNav">
			<nav class="navbar navbar-custom navbar-fixed-top" id="topnavbar">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="main.jsp">성공회대학교 졸업관리</a>
					</div>
					<div id="bs-navbar-collapse" class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"> 졸업 요건 <span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li><a href="../graduation/basic.jsp">기본 졸업 요건</a></li>
									<li><a href="/">학과/학부별 졸업 요건</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"> 수강 관리 <span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li><a href="../course/substitution.jsp">대체과목 목록 조회</a></li>
									<li><a href="/">전공인정 신청</a></li>
									<li><a href="../course/grades.jsp">성적 조회</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"> 계정 정보 변경 <span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li><a href="/">기본 정보 변경</a></li>
									<li><a href="/">비밀번호 변경</a></li>
									<li><a href="/">이메일 변경</a></li>
								</ul></li>
						</ul>

						<div class="uib-button-bar navbar-right">
							<div class="divItem">
								<div>
									<i class="glyphicon glyphicon-user"></i> 201532020 송지은 (6학기)<br />
								</div>
								<button type="submit" class="btn btn-info btn-block"
									onclick="/">로그아웃</button>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<main>
		<div class="container">
			<div id="header" class="panel panel-default">
				<div class="panel-body">
					<h1 class="new">학부/학과 졸업요건</h1>
					<table class="table new-detail mt-25">
						<thead>
							<tr data-url="info.jsp">
								<th class="col-md-12">인문융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-md-12">영어학과</td>
							</tr>
							<tr>
								<td class="col-md-12">일어일본학과</td>
							</tr>
							<tr>
								<td class="col-md-12">중어중국학과</td>
							</tr>
							<tr>
								<td class="col-md-12">신학과(기독교문화전공)</td>
							</tr>
						</tbody>
					</table>
					<table class="table new-detail">
						<thead>
							<tr>
								<th class="col-md-12">사회융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-md-12">사회과학과</td>
							</tr>
							<tr>
								<td class="col-md-12">사회복지학과</td>
							</tr>
							<tr>
								<td class="col-md-12">경영학과</td>
							</tr>
						</tbody>
					</table>
					<table class="table new-detail">
						<thead>
							<tr>
								<th class="col-md-12">미디어컨텐츠융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-md-12">신문방송학과</td>
							</tr>
							<tr>
								<td class="col-md-12">디지털컨텐츠학과</td>
							</tr>
						</tbody>
					</table>
					<table class="table new-detail">
						<thead>
							<tr>
								<th class="col-md-12">IT융합 자율학부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-md-12">컴퓨터공학과</td>
							</tr>
							<tr>
								<td class="col-md-12">소프트웨어공학과</td>
							</tr>
							<tr>
								<td class="col-md-12">정보통신공학과</td>
							</tr>
							<tr>
								<td class="col-md-12">글로컬IT공학과</td>
							</tr>
						</tbody>
					</table>
					<h1 id='mtb' class="old mt-200 mb-200">기타졸업요건</h1>
					<table class="table old-detail mt-25 text-center">
						<tr>
							<td class="col-md-2">학과명</td>
							<td class="col-md-8">졸업학점 외 졸업요건</td>
							<td class="col-md-2">비고</td>
						</tr>
						<tr>
							<td class="col-md-2">신학과</td>
							<td class="col-md-8">TOEIC 750점 이상</td>
							<td class="col-md-2"></td>
						</tr>
						<tr>
							<td class="col-md-2">영어학과</td>
							<td class="col-md-8">TOEIC 750점 이상</td>
							<td class="col-md-2">2012학번까지</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>

