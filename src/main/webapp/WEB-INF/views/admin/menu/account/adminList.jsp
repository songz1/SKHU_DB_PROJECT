<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				<h3 class="text-center">관리자 목록</h3>
				<form:form>
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">담당 부서</td>
						<td class="col-md-1">
						<form:select path="departmentId" class="col-md-1" itemValue="id" itemLabel="name" items="${ departments }" />
						</td>
						<td class="title col-md-1"><select name="admin">
								<option value="1">교번</option>
								<option value="2">이름</option>
						</select></td>
						<td class="col-md-1"><input type="text" name="admin"></input>
						</td>

						<td class="col-md-1"><span style="float: right">
								<button type="submit" class="btn btn-default btn-block"
									style="WIDTH: 100pt;" onclick="/">조회</button>
						</span></td>
					</tr>
				</table>

				<table class="table table-bordered mt5">
					<thead>
						<tr class="title">
							<th class="text-center">교번</th>
							<th class="text-center">이름</th>
							<th class="text-center">담당 부서</th>
							<th class="text-center">권한</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="admin" items="${ admins }">
							<tr data-url="adminEdit?id=${ admin.id }">
								<td>${ admin.loginId }</td>
								<td>${ admin.name }</td>
								<td>${ admin.departmentId }</td>
								<td>${ admin.authority }</td>
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

