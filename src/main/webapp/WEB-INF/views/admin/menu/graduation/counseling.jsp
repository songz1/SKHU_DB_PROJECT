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
				<h3 class="text-center">조치사항 목록</h3>
				<form:form action="counseling" method="get" modelAttribute="condition">
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">학과(부)</td>
						<td class="col-md-2">
							<form:select path="departmentId" class="form-control">
								<form:option value="0" label="전체" />
								<form:options itemValue="id" itemLabel="name" items="${ departments }"/>
							</form:select>
						</td>
						<td class="title col-md-1">
							<select name="searchType">
									<option value="0">학번</option>
									<option value="1">이름</option>
							</select>
						</td>
						<td class="col-md-2">
							<input type="text" name="searchText" value="${ searchText }" />
						</td>
					
						<td class="col-md-1">
							<span style="float: right">
								<button type="submit" class="btn btn-default btn-block"
									style="WIDTH: 100pt;">조회</button>
							</span>
						</td>
					</tr>
				</table>

				<table class="table table-bordered mt5">
					<thead>
						<tr class="title">
							<th class="text-center">학번</th>
							<th class="text-center">이름</th>
							<th class="text-center">학과</th>
							<th class="text-center">최근 조치일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="student" items="${ students }">
							<tr data-url="counselingList?id=${ student.id }" class="text-center cursor tr-hover">
								<td>${ student.studentNumber }</td>
								<td>${ student.name }</td>
								<td>${ student.department.name }</td>
								<td><fmt:formatDate pattern="yy-MM-dd HH:MM:SS" value="${ student.action.date }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</form:form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

