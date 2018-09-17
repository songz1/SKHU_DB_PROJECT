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
									<li><a href="../substitution.jsp">대체과목 목록 조회</a></li>
									<li><a href="/">전공인정 신청</a></li>
									<li><a href="/">성적 조회</a></li>
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
				<h3 class="text-center mb-25">대체 과목 신청</h3>
				<form>
					<div class="form-group col-md-4 col-md-offset-1">
						<input type="text" name="changeSubject" class="form-control" placeholder="대체할 과목">
					</div>
					<div class="form-group text-center col-md-2"><i class="glyphicon glyphicon-arrow-right"></i></div>
					<div class="form-group col-md-4">
						<input type="text" name="changeSubject" class="form-control" placeholder="신청할 과목">
					</div>
					<div class="form-group col-md-6 col-md-offset-3 mt-25 mb-25">
					<textarea name="reportContent" class="form-control" maxlength="1024" style="height: 100px;" placeholder="기타사항"></textarea>
					</div>
					<div>
						<button type="button" class="btn btn-danger col-md-2 col-md-offset-3">취소</button>
					</div>
					<div>
						<button type="submit" class="btn btn-info col-md-2 col-md-offset-2 mb-25">대체 과목 신청</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

