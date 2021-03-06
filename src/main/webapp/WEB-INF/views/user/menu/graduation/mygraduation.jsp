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
	src="../../../res/script/common/mygraduation.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">학번</td>
						<td class="col-md-1">${ student.studentNumber }</td>
						<td class="title col-md-1">이름</td>
						<td class="col-md-1">${ student.name }</td>
						<td class="title col-md-1">학과</td>
						<td class="col-md-2">${ student.department.name }</td>
					</tr>
				</table>
				<form method="post" action="mygraduation">
					<table class="table text-center">
						<tr>
							<td class="title col-md-1">졸업과정</td>
							<td class="col-md-1"><select name="mainGraduation"
								id="option-show" class="form-control">
									<c:forEach var="graduation" items="${ graduations }">
										<c:if test="${ graduation.division eq 'a' }">
											<option value="${ graduation.id }"
												<c:if test="${graduation.id eq mainGraduationId}">selected</c:if>>${ graduation.name }</option>
										</c:if>
									</c:forEach>
							</select></td>
							<td class="title col-md-1 td-minor">타학과부전공</td>
							<td class="col-md-1 td-minor"><select name="minor" class="form-control">
									<option value="0">미선택</option>
									<c:forEach var="department" items="${ departments }">
										<c:if test="${ department.id != student.departmentId }">
											<option value="${ department.id }"
												<c:if test="${department.id eq minorId && doubleMajorId eq 0}">selected</c:if>>${ department.name }</option>
										</c:if>
									</c:forEach>
							</select></td>
							<td class="title col-md-1 td-double">타학과복수전공1</td>
							<td class="col-md-1 td-double"><select name="doubleMajor1" class="form-control">
									<option value="0">미선택</option>
									<c:forEach var="department" items="${ departments }">
										<c:if test="${ department.id != student.departmentId }">
											<option value="${ department.id }"
												<c:if test="${department.id eq minorId && doubleMajorId ne 0}">selected</c:if>>${ department.name }</option>
										</c:if>
									</c:forEach>
							</select></td>
							<td class="title col-md-1 td-double">타학과복수전공2</td>
							<td class="col-md-1 td-double"><select name="doubleMajor2" class="form-control">
									<option value="0">미선택</option>
									<c:forEach var="department" items="${ departments }">
										<c:if
											test="${ department.id != student.departmentId && department.id != minorId }">
											<option value="${ department.id }"
												<c:if test="${department.id eq doubleMajorId}">selected</c:if>>${ department.name }</option>
										</c:if>
									</c:forEach>
							</select></td>
						</tr>
					</table>
					<table class="table text-center">
						<tr>
							<td class="title col-md-1">상세졸업과정</td>
							<td class="col-md-1"><select name="subGraduation" class="form-control">
									<option value="0">미선택</option>
									<c:forEach var="graduation" items="${ graduations }">
										<c:if test="${ graduation.division eq 'c' }">
											<option value="${ graduation.id }"
												<c:if test="${graduation.id eq subGraduationId}">selected</c:if>>${ graduation.name }</option>
										</c:if>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td class="col-md-1"></td>
							<td class="col-md-1 text-right">
								<button type="submit" class="btn btn-default">조회</button>
							</td>
						</tr>
					</table>
				</form>
				<h5>기본설정 값: ${ student.graduation }</h5>
				<div class="text-center">
					<h3>필요 학점</h3>
				</div>
				<div class="table-responsive">
					<table class="table text-center">
						<c:forEach var="map" items="${ graduationGradeMap }"
							varStatus="status">
							<c:choose>
								<c:when test="${ status.index == 0 }">
									<tr>
										<td class="col-md-3 active"><c:if
												test="${map.key.departmentId != 1}">${ map.key.department.name } </c:if>${ map.key.graduation.name }</td>
									</tr>
								</c:when>
								<c:when
									test="${ map.key.graduation.id != graduationGrades[status.index - 1].graduation.id }">
					</table>
				</div>
				<div class="table-responsive">
					<table class="table text-center">
						<tr>
							<td class="col-md-3 active"><c:if
									test="${map.key.departmentId != 1}">${ map.key.department.name } </c:if>${ map.key.graduation.name }</td>
						</tr>
						</c:when>
						</c:choose>
						<tr>
								<c:if test="${ map.key.name ne '상세졸업과정'}">
								<td
									class="col-md-3 <c:choose> 
									<c:when test="${ map.key.score <= map.value }">success</c:when>
									<c:otherwise>danger</c:otherwise>
								</c:choose>">
									${ map.key.name } ${ map.value }/${ map.key.score }<c:if
										test="${ map.key.note ne ''}">(${ map.key.note })</c:if>
									
								</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>


				<div class="text-center">
					<h3>필요 과목</h3>
				</div>
				<div class="table-responsive">
					<table class="table text-center">
						<c:forEach var="map" items="${ graduationSubjectMap }"
							varStatus="status">
							<c:choose>
								<c:when test="${ status.index == 0 }">
									<tr>
										<td class="col-md-3 active"><c:if
												test="${map.key.departmentId != 1}">${ map.key.department.name } </c:if>${ map.key.graduation.name }</td>
									</tr>
								</c:when>
								<c:when
									test="${ map.key.graduation.id != graduationSubjects[status.index - 1].graduation.id }">
					</table>
				</div>
				<div class="table-responsive">
					<table class="table text-center">
						<tr>
							<td class="col-md-3 active"><c:if
									test="${map.key.departmentId != 1}">${ map.key.department.name } </c:if>${ map.key.graduation.name }</td>
						</tr>
						</c:when>
						</c:choose>
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
								class="col-md-3 <c:choose> 
									<c:when test="${ map.value == 0 }">danger</c:when>
									<c:when test="${ map.value == 1 }">success</c:when>
										<c:when test="${ map.value == 2 }">active</c:when>
									</c:choose>">
								${ map.key.subject.name }</td>
							</tr>
							</c:forEach>
						</table>
				</div>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>