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
				<form:form method="post" action="editrule" modelAttribute="rule">
					<form:hidden path="name" />
					<table class="table">
						<tr>
							<td class="title col-md-4 text-center">규칙수정</td>
							<td class="title col-md-4">
								<button type="submit" class="btn btn-default">수정하기</button>
							</td>
						</tr>
					</table>
				</form:form>
				<hr />
				<h3 class="text-center">학생 목록</h3>
				<hr />
				<form:form action="changerequestlist" method="get" modelAttribute="condition">
					<table class="table text-center">
						<tr>
							<td class="title col-md-2">학과(부)</td>
							<td><form:select path="departmentId"
									class="form-control col-md-2">
									<form:option value="0" label="전체" />
									<form:options itemValue="id" itemLabel="name"
										items="${ departments }" />
								</form:select></td>
							<td class="title"><select name="searchType" class="form-control col-md-2">
									<option value="0">학번</option>
									<option value="1">이름</option>
							</select></td>
							<td><input type="text" name="searchText"
								value="${ searchText }" class="form-control col-md-2" /></td>
							<td class="col-md-1" />
						</tr>
						<tr>
							<td class="title col-md-2">학년</td>
							<td><form:select path="year"
									class="form-control col-md-2">
									<form:option value="0" label="전체" />
									<form:option value="1" label="1학년" />
									<form:option value="2" label="2학년" />
									<form:option value="3" label="3학년" />
									<form:option value="4" label="4학년" />
								</form:select></td>
							<td class="title col-md-2">이수학기</td>
							<td><form:select path="semester"
									class="form-control col-md-2">
									<form:option value="0" label="전체" />
									<form:option value="1" label="1학기" />
									<form:option value="2" label="2학기" />
									<form:option value="3" label="3학기" />
									<form:option value="4" label="4학기" />
									<form:option value="5" label="5학기" />
									<form:option value="6" label="6학기" />
									<form:option value="7" label="7학기" />
									<form:option value="8" label="8학기" />
								</form:select></td>
							<td class="col-md-1"><span style="float: right">
									<button type="submit" class="btn btn-default btn-block"
										style="WIDTH: 100pt;">조회</button>
							</span></td>
						</tr>
					</table>
				</form:form>
				<table class="table table-bordered mt5">
					<thead>
						<tr class="title">
							<th class="text-center">학번</th>
							<th class="text-center">이름</th>
							<th class="text-center">학과</th>
							<th class="text-center">학년</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="student" items="${ students }">
							<tr data-url="majordetail?id=${ student.id }"
								class="text-center cursor tr-hover">
								<td>${ student.studentNumber }</td>
								<td>${ student.name }</td>
								<td>${ student.department.name }</td>
								<td>${ student.year }학년</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav>
					  <ul class="pager">
					    <c:forEach var="page" items="${ pages }">
							<li>
								<a href="majorrequestlist?${ page.queryString }"> ${ page.label }</a>
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

