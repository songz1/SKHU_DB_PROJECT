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
<link rel="stylesheet" type="text/css"
	href="../../../res/css/common/info.css?ver=1">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<title>졸업요건표</title>
</head>
<body>
	<table class="table table-bordered text-center align-middle">
		<thead>
			<tr class="test">
				<td class="col-md-1">전공</td>
				<td class="col-md-1">학점졸업조건</td>
				<td class="col-md-1">과목졸업조건</td>
				<td class="col-md-1">비고</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="graduation" items="${ graduations }">
			<tr>
				<td class="col-md-1">${ graduation.name }</td>
				<td class="col-md-1">
					<c:forEach var="graduationGrade" items="${ graduationGradeMap[graduation.id] }">
						${ graduationGrade.name } ${ graduationGrade.score } 이상 ${ graduationGrade.note }<br />
					</c:forEach>
				</td>
				<td class="col-md-1">
					<c:forEach var="graduationSubject" items="${ graduationSubjectMap[graduation.id] }">
						${ graduationSubject.subject.name }(${ graduationSubject.subject.score }) ${ graduationSubject.note }<br />
					</c:forEach>
				</td>
				<td class="col-md-1"></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>