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
<script type="text/javascript"
	src="../../../res/script/admin/toDetail.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">대체과목 신청 정보</h3>
				<hr />
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">학번</td>
						<td class="col-md-1">201532020</td>
						<td class="title col-md-1">이름</td>
						<td class="col-md-1">송지은</td>
						<td class="title col-md-1">학과</td>
						<td class="col-md-2">소프트웨어공학과</td>
						<td class="col-md-1"><button type="submit"
					class="btn btn-info" data-url="changerequestConfirm.jsp">대체과목 확인</button></td>
					</tr>
				</table>

				<table class="table text-center">
					<tr>
						<td class="title line" colspan="5">폐지 과목</td>
						<td class="title line" colspan="4">대체희망 과목</td>
						<td class="title"></td>
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
						<td class="title col-md-1"></td>
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
						<td class="col-md-1"><button type="submit"
					class="btn btn-danger">취소</button></td>
					</tr>
				</table>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>

