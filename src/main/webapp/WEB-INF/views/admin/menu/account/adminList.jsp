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
				<form:form action="adminList" method="get" modelAttribute="condition">
					<table class="table text-center">
						<tr>
							<td class="title col-md-2">담당 부서</td>
							<td>
								<form:select path="departmentId" class="form-control col-md-2">
									<form:option value="0" label="전체" />
									<form:options itemValue="id" itemLabel="name" items="${ departments }"/>
								</form:select>
							</td>
							<td class="title">
								<select name="searchType" class="form-control col-md-2">
									<option value="0">교번</option>
									<option value="1">이름</option>
								</select></td>
							<td>
								<input class="col-md-2 form-control" type="text" name="searchText" value="${ searchText }"></input>
							</td>

							<td class="col-md-1">
								<span style="float: right">
									<button type="submit" class="btn btn-default btn-block"
										style="WIDTH: 100pt;">조회</button>
								</span>
							</td>
						</tr>
					</table>
					</form:form>
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
							<tr data-url="adminEdit?id=${ admin.id }" class="text-center cursor tr-hover">
								<td>${ admin.loginId }</td>
								<td>${ admin.name }</td>
								<td>${ admin.department.name }</td>
								<td>
									<c:if test="${ admin.authority == 1 }">super</c:if>
									<c:if test="${ admin.authority == 2 }">관리자</c:if>
									<c:if test="${ admin.authority == 3 }">행정/전산</c:if>
									<c:if test="${ admin.authority == 4 }">교수</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav>
					  <ul class="pager">
					    <c:forEach var="page" items="${ pages }">
							<li>
								<a href="adminList?${ page.queryString }"> ${ page.label }</a>
							</li>
						</c:forEach>
					  </ul>
				</nav>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

