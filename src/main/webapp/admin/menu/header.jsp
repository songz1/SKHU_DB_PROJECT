<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<div id="divNav">
		<nav class="navbar navbar-custom navbar-fixed-top navbar-color"
			id="topnavbar">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="/SKHU_DB_PROJECT/user/form/menu/main.jsp">성공회대학교 졸업관리</a>
				</div>
				<div id="bs-navbar-collapse" class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 졸업 요건  수정<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a
									href="/SKHU_DB_PROJECT/user/form/menu/graduation/basic.jsp">기본 졸업 요건</a></li>
								<li><a
									href="/SKHU_DB_PROJECT/user/form/menu/graduation/detail.jsp">학과/학부별 졸업 요건</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">수강 수정<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a
									href="/SKHU_DB_PROJECT/user/form/menu/course/substitution.jsp">대체과목 신청 목록</a></li>
								<li><a
									href="/SKHU_DB_PROJECT/user/form/menu/course/majorrequestList.jsp">전공인정 신청 목록</a></li>
								<li><a href="/SKHU_DB_PROJECT/user/form/menu/course/grades.jsp">성적 수정</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">계정정보변경<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a
									href="/SKHU_DB_PROJECT/user/form/menu/account/acntchange.jsp">학생 변경</a></li>
								<li><a
									href="/SKHU_DB_PROJECT/user/form/menu/account/pwdconfirm.jsp">계정 변경</a></li>
							</ul></li>
					</ul>
					<div class="uib-button-bar navbar-right">
						<div class="divItem">
							<div>
								<i class="glyphicon glyphicon-user"></i>root<br />
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