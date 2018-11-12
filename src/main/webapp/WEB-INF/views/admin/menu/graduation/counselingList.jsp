<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
				<h3 class="text-center">조치사항</h3>
				<form:form method="get" modelAttribute="action" action="counselingAdd">
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">학번</td>
						<td class="col-md-1">${ student.studentNumber }</td>
						<td class="title col-md-1">이름</td>
						<td class="col-md-1">${ student.name }</td>
						<td class="title col-md-1">학과</td>
						<td class="col-md-2">${ student.department.name }</td>

						<td class="col-md-1"><span style="float: right">
								<button type="submit" class="btn btn-info btn-block"
									style="WIDTH: 100pt;">추가</button>
						</span></td>
					</tr>
				</table>
				</form:form>
				<table class="table text-center">
					<tr>
						<td class="title" colspan="4">조치사항 목록</td>
					</tr>
					<tr>
						<td class="title col-md-1">조치일시</td>
						<td class="title col-md-3">조치제목</td>
						<td class="title col-md-1">조치 관리자</td>
					</tr>
					<c:forEach var="action" items="${ actions }">
							<tr data-url="counselingDetail?id=${ action.id }" class="text-center cursor tr-hover">
								<td><fmt:formatDate pattern="yy-MM-dd HH:MM:SS" value="${ action.date }" /></td>
								<td>${ action.name }</td>
								<td>${ action.admin.name }</td>
							</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>

