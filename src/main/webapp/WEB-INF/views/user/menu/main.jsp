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
	href="../../res/css/common/main.css?ver=1">
<script type="text/javascript" src="../../res/script/user/main.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">졸업 학점 현황</h3>
				<div class="table-responsive">
					<table class="table text-center">
							<c:forEach var="map" items="${ graduationGradeMap }"
								varStatus="status">
							<tr>
							<td
								class="col-md-4 
								<c:choose> 
									<c:when test="${ map.key.score <= map.value }">success</c:when>
									<c:otherwise>danger</c:otherwise>
								</c:choose>">${ map.key.name } ${ map.value }/${ map.key.score }</td>
														</tr>
							</c:forEach>
					</table>
					<table class="table text-center">
						<c:forEach var="map" items="${ graduationSubjectMap }"
							varStatus="status">
							<c:choose>
								<c:when test="${ status.index == 0 }">
									<c:if test="${ map.key.note ne '' }">
									<tr>
										<td class="col-md-3 active">${ map.key.note }</td>
									</tr>
									</c:if>
								</c:when>
								<c:when
									test="${ map.key.note ne graduationSubjects[status.index - 1].note }">
									<c:if test="${ map.key.note ne '' }">
									<tr>
										<td class="col-md-3 active">${ map.key.note }</td>
									</tr>
									</c:if>
								</c:when>
							</c:choose>
							<tr>
								<td
									class="col-md-4 <c:choose> 
											<c:when test="${ map.value == 0 }">danger</c:when>
											<c:when test="${ map.value == 1 }">success</c:when>
											<c:when test="${ map.value == 2 }">active</c:when>
										</c:choose>">${ map.key.subject.name }</td>
							</tr>
						</c:forEach>
					</table>
					<div class="table-responsive">
						<table class="table text-center">
							<thead>
								<tr class="info">
									<td class="col-md-3">분류</td>
									<td class="col-md-3">필수</td>
									<td class="col-md-3">선택</td>
									<td class="col-md-3">계</td>
								</tr>
							</thead>
							<tbody>
								<tr class="active">
									<td class="col-md-3">전공</td>
									<td class="col-md-3">${ majorEssential }</td>
									<td class="col-md-3">${ majorSelection }</td>
									<td class="col-md-3">${ majorEssential + majorSelection }</td>
								</tr>
								<tr class="active">
									<td class="col-md-3">교양</td>
									<td class="col-md-3">${ liberalEssential }</td>
									<td class="col-md-3">${ liberalSelection }</td>
									<td class="col-md-3">${ liberalEssential + liberalSelection }</td>
								</tr>
								<tr class="active">
									<td class="col-md-3">부전공<c:if
											test="${ student.minor ne '0' && student.doubleMajor eq '0' }">(${ student.minor })</c:if></td>
									<td class="col-md-3">${ minorEssential }</td>
									<td class="col-md-3">${ minorSelection }</td>
									<td class="col-md-3">${ minorEssential + minorSelection }</td>
								</tr>
								<tr class="active">
									<td class="col-md-3">복수전공1<c:if
											test="${ student.minor ne '0' && student.doubleMajor ne '0' }">(${ student.minor })</c:if></td>
									<td class="col-md-3">${ doubleMajorEssential1 }</td>
									<td class="col-md-3">${ doubleMajorSelection1 }</td>
									<td class="col-md-3">${ dobuleMajorEssential1 + doubleMajorSelection1 }</td>
								</tr>
								<tr class="active">
									<td class="col-md-3">복수전공2<c:if
											test="${ student.doubleMajor ne '0' }">(${ student.doubleMajor })</c:if></td>
									<td class="col-md-3">${ doubleMajorEssential2 }</td>
									<td class="col-md-3">${ doubleMajorSelection2 }</td>
									<td class="col-md-3">${ dobuleMajorEssential2 + doubleMajorSelection2 }</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>

