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
<link rel="stylesheet" type="text/css"
	href="../../../res/css/common/form.css?ver=1">
<script type="text/javascript"
	src="../../../res/script/admin/graduationlist.js?ver=1"></script>
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
				<h3 class="text-center">졸업요건 목록</h3>
				<form:form method="get" modelAttribute="condition"
					action="gradelist">
					<table class="table text-center">
						<tr>
							<td class="title col-md-1">적용년도</td>
							<td class="col-md-1"><input type="text" name="searchText"
								value="${ searchText }" /></td>
							<td class="title col-md-1">학과</td>
							<td class="col-md-1">
								<form:select path="departmentId">
									<form:option value="0" label="전체" />
									<form:options itemValue="id" itemLabel="name" items="${ departments }"/>
								</form:select>
							</td>
							<td class="title col-md-1">졸업요건</td>
							<td class="col-md-1">
								<form:select path="graduationId">
									<form:option value="0" label="전체" />
									<form:options itemValue="id" itemLabel="name" items="${ graduations }"/>
								</form:select>
							</td>
						</tr>
					</table>
					<div class="form-group">
						<div class="col-md-4 col-md-offset-4 text-center mb-25">
							<button type="submit" class="btn btn-info btn-width">조회</button>
						</div>
					</div>
				</form:form>
				<form method="post" action="gradedelete">
					<table class="table table-bordered table-condensed">
						<thead>
							<tr class="title">
								<th class="text-center">id</th>
								<th class="text-center">적용학번</th>
								<th class="text-center">학과</th>
								<th class="text-center">졸업요건명</th>
								<th class="text-center">학점명</th>
								<th class="text-center">학점</th>
								<th class="text-center">비고</th>
								<th class="text-center"><input type="checkbox"
									id="allCheck" /></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="graduationGrade" items="${ graduationGrades }">
								<tr class="text-center tr-hover">
									<td class="cursor" data-url="editgrade?id=${ graduationGrade.id }">${ graduationGrade.id }</td>
									<td class="cursor" data-url="editgrade?id=${ graduationGrade.id }">${ graduationGrade.year }</td>
									<td class="cursor" data-url="editgrade?id=${ graduationGrade.id }">${ graduationGrade.department.name }</td>
									<td class="cursor" data-url="editgrade?id=${ graduationGrade.id }">${ graduationGrade.graduation.name }</td>
									<td class="cursor" data-url="editgrade?id=${ graduationGrade.id }">${ graduationGrade.name }</td>
									<td class="cursor" data-url="editgrade?id=${ graduationGrade.id }">${ graduationGrade.score }</td>
									<td class="cursor" data-url="editgrade?id=${ graduationGrade.id }">${ graduationGrade.note }</td>
									<td><input type="checkbox" name="deleteId"
										value="${ graduationGrade.id }" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="text-right">
						<button type="submit" class="btn btn-default"
							onclick="return confirm('삭제하시겠습니까?')">
							<i class="glyphicon glyphicon-trash glyphicon-default"></i> 삭제
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

