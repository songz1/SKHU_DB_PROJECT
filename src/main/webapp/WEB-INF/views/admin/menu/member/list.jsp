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
				<h3 class="text-center">학생 목록</h3>
				<form:form action="searchStudentList" method="get"
					modelAttribute="student">
					<table class="table text-center">
						<tr>
							<td class="title col-md-2">학과(부)</td>
							<td class="col-md-1"><form:select path="departmentId"
									class="form-control" itemValue="id" itemLabel="name"
									items="${ departments }" /></td>
							<td class="title col-md-2"><select name="searchType">
									<option value="0" searchText="loginId">학번</option>
									<option value="1" searchText="name">이름</option>
							</select></td>
							<td><input type="text" name="searchText"></input></td>
							<td class="col-md-1"></td>
						</tr>
						<tr>
							<td class="title col-md-2">학년</td>
							<td class="col-md-1"><select name="year">
									<option value="0">전체</option>
									<option value="1">1학년</option>
									<option value="2">2학년</option>
									<option value="3">3학년</option>
									<option value="4">4학년 이상</option>
							</select></td>
							<td class="title col-md-2">이수학기</td>
							<td class="col-md-1"><select name="semester">
									<option value="0">전체</option>
									<option value="1">1학기</option>
									<option value="2">2학기</option>
									<option value="3">3학기</option>
									<option value="4">4학기</option>
									<option value="5">5학기</option>
									<option value="6">6학기</option>
									<option value="7">7학기</option>
									<option value="8">8학기</option>
							</select></td>

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
							<tr data-url="detail?id=${ student.id }"
								class="text-center cursor tr-hover">
								<td>${ student.studentNumber }</td>
								<td>${ student.name }</td>
								<td>${ student.department.name }</td>
								<td><c:if test="${ student.year == 1 }">1학년</c:if> <c:if
										test="${ student.year == 2 }">2학년</c:if> <c:if
										test="${ student.year == 3 }">3학년</c:if> <c:if
										test="${ student.year == 4 }">4학년</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

