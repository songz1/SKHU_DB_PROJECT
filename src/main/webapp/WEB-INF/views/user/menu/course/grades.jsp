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
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<table class="table text-center">
					<h3 class="text-center">성적 조회</h3>
					<tr>
						<td class="title col-md-1">학번</td>
						<td class="col-md-1">${ student.studentNumber }</td>
						<td class="title col-md-1">이름</td>
						<td class="col-md-1">${ student.name }</td>
						<td class="title col-md-1">학과</td>
						<td class="col-md-2">${ student.department.name }</td>
					</tr>
				</table>

				<form:form method="get" modelAttribute="condition" action="grades">
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">년도</td>
						<td class="col-md-1">
							<input type="text" name="year" value="${ searchText }" class="form-control"/>
						</td>
						<td class="title col-md-1">학기</td>
						<td class="col-md-1">
							<form:select path="semester" class="form-control">
								<form:option value="0" label="전체" />
								<form:option value="1" label="1학기" />
								<form:option value="2" label="2학기" />
								<form:option value="summer" label="여름학기" />
								<form:option value="winter" label="겨울학기" />
							</form:select>
						</td>
						
						<td class="col-md-1">
							<span style="float: right">
								<button type="submit" class="btn btn-default btn-block" style="WIDTH: 100pt;">조회</button>
							</span>
						</td>
					</tr>
				</table>
				</form:form>
				 
				<form method="post" enctype="multipart/form-data" action="addscore">
					<input type="hidden" name="studentNumber" value="${ student.studentNumber }" />
					<input type="hidden" name="id" value="${ student.id }" />
					<table class="table text-center">
						<tr>
							<td class="title col-md-3">성적 일괄 업로드</td>
							<td class="title col-md-2"><input type="file"
								class="form-control form-width" name="listFile" /></td>
							<td class="title col-md-1"><button type="submit"
									class="btn btn-default">확인</button></td>
						</tr>
					</table>
				</form>

				<table class="table text-center">
					<tr class="title">
						<td class="col-md-1">년도</td>
						<td class="col-md-1">학기</td>
						<td class="col-md-1">과목코드</td>
						<td class="col-md-4">과목명</td>
						<td class="col-md-1">교수명</td>
						<td class="col-md-1">이수구분</td>
						<td class="col-md-1">학점</td>
						<td class="col-md-1">성적등급</td>
						<td class="col-md-1">비고</td>
					</tr>
					<c:forEach var="score" items="${ scores }" varStatus="status">
						<tr>
							<td class="col-md-1">${ score.subject.year }</td>
							<td class="col-md-1">${ score.subject.semester }학기</td>
							<td class="col-md-1">${ score.subject.code }</td>
							<td class="col-md-4">${ score.subject.name }</td>
							<td class="col-md-1">${ score.subject.admin.name }</td>
							<td class="col-md-1">${ score.subject.division }</td>
							<td class="col-md-1">${ score.subject.score }</td>
							<td class="col-md-1">${ scoreChar[status.index] }</td>
							<td class="col-md-1">
								<c:if test="${ score.majorAdmit }">전공인정신청<br /></c:if> 
								<c:if test="${ score.substitutionCode ne '0' }">대체과목신청: ${ score.substitutionCode }</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>

				<table class="table text-center">
					<tr>
						<td class="title col-md-1">신청학점</td>
						<td class="col-md-1">${ requestGrade }</td>
						<td class="title col-md-1">취득학점</td>
						<td class="col-md-1">${ getGrade }</td>
						<td class="title col-md-1">평점</td>
						<td class="col-md-1">${ averageGrade }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>