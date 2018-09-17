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
<script type="text/javascript" src="../../res/script/main.js?ver=1"></script>
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
									<li><a href="/">기본 졸업 요건</a></li>
									<li><a href="/">학과/학부별 졸업 요건</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"> 수강 관리 <span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li><a href="../../course/substitution.jsp">대체과목 목록 조회</a></li>
									<li><a href="/">전공인정 신청</a></li>
									<li><a href="../../course/grades.jsp">성적 조회</a></li>
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
				<table class="table text-center">
					<h4 class="text-center">졸업 이수 학점</h4>
					<tr>
						<td class="title col-md-1"></td>
						<td class="title col-md-1">졸업 학점</td>
						<td class="title col-md-1">전공 학점</td>
						<td class="title col-md-1">교양 학점</td>
						<td class="title col-md-1">특별과정 학점</td>
						<td class="title col-md-1">전공탐색 학점</td>
					</tr>
					<tr>
						<td class="title col-md-1">2017학번까지</td>
						<td class="col-md-1">130 이상</td>
						<td class="col-md-1">32 이상</td>
						<td class="col-md-1">60 이상</td>
						<td class="col-md-1">15 이상</td>
						<td class="col-md-1">해당 없음</td>
					</tr>
					<tr>
						<td class="title col-md-1">2018학번부터</td>
						<td class="col-md-1">130 이상</td>
						<td class="col-md-1">34 이상</td>
						<td class="col-md-1">60~63 이상</td>
						<td class="col-md-1">해당 없음</td>
						<td class="col-md-1">18 이상</td>
					</tr>
				</table>

				<table class="table text-center">
					<h4 class="text-center">학년별 수료 학점</h4>
					<tr>
						<td class="title col-md-1">구분</td>
						<td class="title col-md-1">총 취득 학점</td>
					</tr>
					<tr>
						<td class="col-md-1">1학년 수료</td>
						<td class="col-md-1">34 이상</td>
					</tr>
					<tr>
						<td class="col-md-1">2학년 수료</td>
						<td class="col-md-1">68 이상</td>
					</tr>
					<tr>
						<td class="col-md-1">3학년 수료</td>
						<td class="col-md-1">102 이상</td>
					</tr>
					<tr>
						<td class="col-md-1">4학년 수료</td>
						<td class="col-md-1">130 이상</td>
					</tr>
				</table>

				<table class="table text-center">
					<h4 class="text-center">학번별 교양 필수 학점</h4>
					<tr>
						<td class="title col-md-1">구분</td>
						<td class="title col-md-2">내용</td>
					</tr>
					<tr>
						<td class="col-md-1">2015학번까지</td>
						<td class="col-md-2">채플 1학점 2회<br> 사회봉사 그룹 2학점
						</td>
					</tr>
					<tr>
						<td class="col-md-1">2016학번</td>
						<td class="col-md-2">채플 1학점 2회<br> 사회봉사 그룹 2학점<br>
							대학생활세미나I 2학점, 대학생활세미나II 2학점<br> 말과글 2학점
						</td>
					</tr>
					<tr>
						<td class="col-md-1">2017학번</td>
						<td class="col-md-2">채플 1학점 2회<br> 사회봉사 그룹 2학점<br>
							대학생활세미나I 2학점, 대학생활세미나II 2학점<br> 말과글 2학점
						</td>
					</tr>
					<tr>
						<td class="col-md-1">2018학번부터</td>
						<td class="col-md-2">채플 1학점 2회<br> 사회봉사 그룹 2학점<br>
							대학생활세미나I 2학점, 대학생활세미나II 2학점<br> 말과글 2학점, 인권과 평화 2학점<br>
							과학기술과 에콜로지 2학점, 데이터 활용 및 분석 2학점
						</td>
					</tr>
				</table>

				<h4 class="text-center">2018학번 교양학점 이수 조건표</h4>
				<div>
					<img src="../../../res/image/gradu.jpg"
						class="img-responsive center-block" alt="Responsive image" />
				</div>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

