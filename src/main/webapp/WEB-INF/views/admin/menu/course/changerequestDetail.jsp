<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
						<td class="col-md-1">${ student.studentNumber }</td>
						<td class="title col-md-1">이름</td>
						<td class="col-md-1">${ student.name }</td>
						<td class="title col-md-1">학과</td>
						<td class="col-md-2">${ student.department.name }</td>
						<td class="col-md-1">
							<button type="submit" class="btn btn-info" data-url="changerequestConfirm.jsp">대체과목추가</button>
						</td>
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
					<c:forEach var="abolish" items="${ abolishes }" varStatus="status">
						<tr>
							<td class="title col-md-1">${ abolish.subject.code }</td>
							<td class="title col-md-2">${ abolish.subject.name }</td>
							<td class="title col-md-1">${ abolish.subject.division }</td>
							<td class="title col-md-1">${ abolish.subject.score }</td>
							<td class="title col-md-1 line">${ scores[status.index] }</td>
							<td class="title col-md-1">${ changes[status.index].code }</td>
							<td class="title col-md-2">${ changes[status.index].name }</td>
							<td class="title col-md-1">${ changes[status.index].division }</td>
							<td class="title col-md-1">${ changes[status.index].score }</td>
							<td class="col-md-1">
								<button type="submit" class="btn btn-danger" data-url="changecancel?id=${ abolish.id }">취소</button>
							</td>
						</tr>
					</c:forEach>		
				</table>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

