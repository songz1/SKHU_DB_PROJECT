<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	href="../../res/css/common/main.css?ver=1">
<script type="text/javascript"
	src="../../res/script/admin/main.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<div class="table-responsive">
					<h3 class="text-center">조치사항 내역</h3>
					<table class="table text-center">
						<tr>
							<td class="title col-md-2">학번</td>
							<td class="title col-md-1">이름</td>
							<td class="title col md-1">학과명</td>
							<td class="title col-md-3">제목</td>
							<td class="title col-md-1">조치자명</td>
							<td class="title col-md-2">조치일</td>
						</tr>
						<c:forEach var="action" items="${ actions }">
							<tr>
								<td class="title col-md-2">${ action.student.studentNumber }</td>
								<td class="title col-md-1">${ action.student.name }</td>
								<td class="title col md-1">${ action.student.department.name }</td>
								<td class="title col-md-3">${ action.name }</td>
								<td class="title col-md-1">${ action.admin.name }</td>
								<td class="title col-md-2"><fmt:formatDate pattern="yy-MM-dd hh:ss" value="${ action.date }" /></td>
							</tr>
						</c:forEach>
					</table>
					<nav>
					  <ul class="pager">
					    <li><a href="#" class="glyphicon glyphicon-menu-left"></a></li>
					    <li><a href="#" class="glyphicon glyphicon-menu-right"></a></li>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

