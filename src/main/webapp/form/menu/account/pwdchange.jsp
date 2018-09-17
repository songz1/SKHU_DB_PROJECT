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
<script type="text/javascript" src="../../../res/script/main.js?ver=1"></script>
<script type="text/javascript" src="https://unpkg.com/vue/dist/vue.js"></script>
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
					<h3 class="text-center">비밀번호 변경</h3>
					<form class="form-inline mt-25 mb-25">
						<div>
							<div class="input-group mb-25 col-md-4 col-md-offset-1">
								<div class="input-group-addon">변경 패스워드</div>
								<input type="password" class="form-control" id="password">
							</div>
						</div>
						<div>
							<div class="input-group mb-25 col-md-4 col-md-offset-1">
								<div class="input-group-addon">패스워드 확인</div>
								<input type="password" class="form-control" id="password">
							</div>
						</div>
						<div>
						<a href=""><button type="submit" class="btn btn-info mb-25 col-md-1 col-md-offset-4">확인</button></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>

