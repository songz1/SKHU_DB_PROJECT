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
<link rel="stylesheet" type="text/css"
	href="../../../res/css/common/form.css?ver=1">
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
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">학번</td>
						<td class="col-md-1">${ action.student.studentNumber }</td>
						<td class="title col-md-1">이름</td>
						<td class="col-md-1">${ action.student.name }</td>
						<td class="title col-md-1">학과</td>
						<td class="col-md-2">${ action.student.department.name }</td>
					</tr>
					<tr>
						<td class="title col-md-1">조치 관리자</td>
						<td class="col-md-1">${ action.admin.name }</td>
						<td class="title col-md-1">조치일시</td>
						<td class="col-md-2"><fmt:formatDate pattern="yy-MM-dd HH:MM:SS" value="${ action.date }" /></td>
						<td class="col-md-1"></td>
						<td class="col-md-2">
							<c:if test="${ action.id > 0 }">
								<a href="delete?id=${ action.id }" class="btn btn-danger" data-confirm-delete>삭제</a>
							</c:if>
						</td>
					</tr>
				</table>

				<table class="table text-center">
					<tr>
						<td class="title" colspan="4">조치 내용</td>
					</tr>
					<tr>
						<td class="col-md-3">${ action.content }</td>
					</tr>
				</table>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>

