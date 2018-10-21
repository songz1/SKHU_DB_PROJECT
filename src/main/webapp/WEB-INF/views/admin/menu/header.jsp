<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<div id="divNav">
		<nav class="navbar navbar-custom navbar-fixed-top navbar-color"
			id="topnavbar">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="/admin/menu/main">성공회대학교 졸업관리</a>
				</div>
				<div id="bs-navbar-collapse" class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">졸업 요건 관리<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/admin/menu/graduation/basic">기본 졸업 요건</a></li>
								<li><a href="/admin/menu/graduation/detail">학과/학부별
										졸업 요건</a></li>
								<li><a href="/admin/menu/graduation/gradelist">졸업
										요건 목록 - 학점</a></li>
								<li><a href="/admin/menu/graduation/subjectlist">졸업
										요건 목록 - 과목</a></li>
								<li><a href="/admin/menu/graduation/creategraduation">졸업
										요건 생성</a></li>
								<li><a href="/admin/menu/graduation/graduationList">졸업
										요건 충족도 확인</a></li>
								<li><a href="/admin/menu/graduation/counseling">학생
										조치사항 내역</a></li>
							</ul>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">학생 성적/과목 관리<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/admin/menu/course/changerequestList">대체과목</a></li>
								<li><a href="/admin/menu/course/majorrequestList">전공인정</a></li>
								<li><a href="/admin/menu/course/gradeList">성적</a></li>
							</ul>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">계정 관리<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/admin/menu/member/list">학생 관리</a></li>
								<li><a href="/admin/menu/account/adminList">관리자 목록</a></li>
								<li><a href="/admin/menu/account/addadmin">관리자 추가</a></li>
								<li><a href="/admin/menu/account/pwdconfirm">내 정보
										관리</a></li>
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