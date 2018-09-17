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
									<li><a href="../../graduation/basic.jsp">기본 졸업 요건</a></li>
									<li><a href="/">학과/학부별 졸업 요건</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"> 수강 관리 <span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li><a href="/">대체과목 목록 조회</a></li>
									<li><a href="/">전공인정 신청</a></li>
									<li><a href="../grades.jsp">성적 조회</a></li>
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
								<button type="submit" class="btn btn-default btn-block"
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
					<tr>
						<td class="title col-md-1">학번</td>
						<td class="col-md-1">201532020</td>
						<td class="title col-md-1">이름</td>
						<td class="col-md-1">송지은</td>
						<td class="title col-md-1">학과</td>
						<td class="col-md-2">소프트웨어공학과</td>
					</tr>
				</table>
				
				<table class="table text-center">
					<tr>
						<td class="title line" colspan="5">폐지과목 수강신청내역</td>
						<td class="title line" colspan="4">대체희망 수강신청내역</td>
						<td class="title col-md-1"></td>
					</tr>
					<tr>
						<td class="title col-md-1">과목코드</td>
						<td class="title col-md-2">과목명</td>
						<td class="title col-md-1">이수구분</td>
						<td class="title col-md-1">학점</td>
						<td class="title col-md-1 line">성적(등급)</td>
						<td class="title col-md-1">과목코드</td>
						<td class="title col-md-2">과목명</td>
						<td class="title col-md-1">이수구분</td>
						<td class="title col-md-1 line">학점</td>
						<td class="title col-md-1">대체여부</td>
					</tr>
					<tr>
						<td class="col-md-1">IC00048</td>
						<td class="col-md-2">보안시스템</td>
						<td class="col-md-1">전선</td>
						<td class="col-md-1">3.0</td>
						<td class="col-md-1 line">C0</td>
						<td class="col-md-1">IC00045</td>
						<td class="col-md-2">모바일 프로그래밍I</td>
						<td class="col-md-1">전선</td>
						<td class="col-md-1 line">3.0</td>
						<td class="col-md-1">O</td>
					</tr>
				</table>
				
				<table class="table text-center">
					<h3 class="text-center">대체과목 목록</h3>
					<tr>
						<td class="title col-md-1">과목코드</td>
						<td class="title col-md-2">과목명</td>
						<td class="title col-md-1">이수구분</td>
						<td class="title col-md-1">학점</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>
