<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<div id="divNav">
		<nav class="navbar navbar-custom navbar-fixed-top navbar-color"
			id="topnavbar">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="/user/menu/main.jsp">성공회대학교 졸업관리</a>
				</div>
				<div id="bs-navbar-collapse" class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 졸업 요건 <span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/user/menu/graduation/basic.jsp">기본 졸업 요건</a></li>
								<li><a href="/user/menu/graduation/detail.jsp">학과/학부별
										졸업 요건</a></li>
								<li><a href="/user/menu/graduation/mygraduation.jsp">내
										졸업요건 확인</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 수강 관리 <span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/user/menu/course/changerequest.jsp">대체과목인정
										신청</a></li>
								<li><a href="/user/menu/course/changerequestList.jsp">대체과목
										목록 조회</a></li>

								<li><a href="/user/menu/course/majorrequest.jsp">전공인정
										신청</a></li>
								<li><a href="/user/menu/course/majorrequestList.jsp">전공인정신청
										목록 조회</a></li>

								<li><a href="/user/menu/course/grades.jsp">성적 조회</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 계정 정보 변경 <span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/user/menu/account/acntchange">기본 정보
										변경</a></li>
								<li><a href="/user/menu/account/pwdconfirm">비밀번호 변경</a></li>
							</ul></li>
					</ul>
					<div class="uib-button-bar navbar-right">
						<div class="divItem">
							<div>
								<i class="glyphicon glyphicon-user"></i>${ userInfo.studentNumber } ${ userInfo.name }<br />
							</div>
							<form action="/user/login/logout" method="post">
								<button type="submit" class="btn btn-default btn-block">로그아웃</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
</header>