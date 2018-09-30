<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<div id="divNav">
		<nav class="navbar navbar-custom navbar-fixed-top navbar-color"
			id="topnavbar">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="//admin/menu/main.jsp">성공회대학교
						졸업관리</a>
				</div>
				<div id="bs-navbar-collapse" class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">졸업 요건 관리<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a
									href="/admin/menu/graduation/basic.jsp">기본
										졸업 요건</a></li>
								<li><a
									href="/admin/menu/graduation/detail.jsp">학과/학부별
										졸업 요건</a></li>
								<li><a
									href="/admin/menu/graduation/gradelist.jsp">졸업
										요건 목록 - 학점</a></li>
								<li><a
									href="/admin/menu/graduation/subjectlist.jsp">졸업
										요건 목록 - 과목</a></li>
								<li><a
									href="/admin/menu/graduation/creategraduation.jsp">졸업
										요건 생성</a></li>
								<li><a
									href="/admin/menu/graduation/mygraduation.jsp">졸업
										요건 확인</a></li>
							</ul>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">학생 성적/과목 관리<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a
									href="/admin/menu/course/substitutionList.jsp">대체과목</a></li>
								<li><a
									href="/admin/menu/course/majorrequestList.jsp">전공인정</a></li>
								<li><a
									href="/admin/menu/course/gradeList.jsp">성적</a></li>
							</ul>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">계정 관리<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/admin/menu/member/list.jsp">학생
										관리</a></li>
								<li><a
									href="/admin/menu/account/adminList.jsp">관리자
										목록</a></li>
								<li><a
									href="/admin/menu/account/addadmin.jsp">관리자
										추가</a></li>
								<li><a
									href="/admin/menu/account/pwdconfirm.jsp">내
										정보 관리</a></li>
							</ul>
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