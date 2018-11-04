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
				<h3 class="text-center">학생 목록</h3>
				<table class="table text-center">
					<form:form method="get" modelAttribute="condition" action="graduationlist">
						<tr>
							<td class="title col-md-2">학과</td>
							<td class="col-md-1">
								<form:select path="departmentId">
									<form:option value="0" label="전체" />
									<form:options itemValue="id" itemLabel="name" items="${ departments }"/>
								</form:select>
							</td>
							<td class="title col-md-1">학년</td>
							<td>
								<form:select path="year">
									<form:option value="0" label="전체" />
									<form:option value="1" label="1학년" />
									<form:option value="2" label="2학년" />
									<form:option value="3" label="3학년" />
									<form:option value="4" label="4학년" />
								</form:select>
							</td>
							<td class="title col-md-1">이수학기</td>
							<td>
								<form:select path="semester">
									<form:option value="0" label="전체" />
									<form:option value="1" label="1학기" />
									<form:option value="2" label="2학기" />
									<form:option value="3" label="3학기" />
									<form:option value="4" label="4학기" />
									<form:option value="5" label="5학기" />
									<form:option value="6" label="6학기" />
									<form:option value="7" label="7학기" />
									<form:option value="8" label="8학기" />
								</form:select>
							</td>
						</tr>
						<tr>
							<td class="col-md-1">
								<input type="checkbox" name="majorCheck" <c:if test='${ majorCheck }'>checked</c:if>>전공필수 미충족
							</td>
							<td class="col-md-1">
								<input type="checkbox" name="minorCheck" <c:if test='${ minorCheck }'>checked</c:if> />교양필수 미충족
							</td>
							<td class="col-md-1">
								<select name="searchType">
									<option value="0" <c:if test="${searchType eq '0'}">selected</c:if> label="학번" />
									<option value="1" label="이름" <c:if test="${searchType eq '1'}">selected</c:if>/>
								</select>
							</td>
							<td class="col-md-1">
								<input type="text" name="searchText" value="${ searchText }" />
							</td>
							<td class="col-md-1">
								<span style="float: right">
									<button type="submit" class="btn btn-default btn-block" style="WIDTH: 100pt;">조회</button>
								</span>
							</td>
						</tr>
					</form:form>
				</table>

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
							<tr class="text-center cursor tr-hover" data-url="graduationdetail?id=${ student.id }">
								<td>${ student.studentNumber }</td>
								<td>${ student.name }</td>
								<td>${ student.department.name }</td>
								<td>${ student.year }</td>
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

