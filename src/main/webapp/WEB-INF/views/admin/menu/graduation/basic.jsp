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
	src="../../../res/script/admin/main.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<form method="post" enctype="multipart/form-data" action="basic">
					<c:forEach var="map" items="${ graduationGradeMap }">
						<table class="table text-center">
							<tr>
								<td class="title col-md-1"></td>
								<c:forEach var="graduation" items="${ map.value }">
									<td class="title col-md-1">${ graduation.name }</td>
								</c:forEach>
							</tr>
							<tr>
								<td class="title col-md-1">${ map.key }학번</td>
								<c:forEach var="graduation" items="${ map.value }">
									<td class="col-md-1">${ graduation.score }<c:if
											test="${ graduation.name eq '채플'}">회</c:if> 이상
									</td>
								</c:forEach>
							</tr>
						</table>
					</c:forEach>
					<h4 class="text-center">학년별 수료 학점</h4>
					<table class="table text-center">
						<tr>
							<td class="title col-md-1">구분</td>
							<td class="title col-md-1">총 취득 학점</td>
						</tr>
						<c:forEach var="completeScore" items="${ completeScores }">
							<tr>
								<td class="col-md-1">${ completeScore.grade }</td>
								<td class="col-md-1">${ completeScore.score }</td>
							</tr>
						</c:forEach>
					</table>
					<div class="form-group">
						<label>파일</label> <input type="file"
							class="form-control form-width form-height" name="completeFile" />
						<a href="downcompletescore"><i
							class="glyphicon glyphicon-download-alt"></i></a>
					</div>
					<h4 class="text-center">학번별 교양 필수 학점</h4>
					<c:forEach var="map" items="${ graduationSubjectMap }">
						<table class="table text-center">
							<tr>
								<td class="title col-md-1">구분</td>
								<td class="title col-md-2">내용</td>
							</tr>
							<tr>
								<td class="col-md-1">${ map.key }</td>
								<td class="col-md-1"><c:forEach var="graduation"
										items="${ map.value }">
											${ graduation.subject.name } ${ graduation.subject.score } 학점<br />
									</c:forEach></td>
							</tr>
						</table>
					</c:forEach>
					<h4 class="text-center">상세 졸업요건</h4>
					<table class="table text-center">
						<tr>
							<td class="title col-md-2"><a href="downdetail"><i
									class="glyphicon glyphicon-download-alt"></i></a></td>
						</tr>
					</table>
					<div class="form-group">
						<label>파일</label> <input type="file"
							class="form-control form-width form-height" name="detailFile" />
					</div>
					<div class="form-group text-center">
						<button type="submit" class="btn btn-primary">
							<i class="glyphicon glyphicon-ok"></i>저장
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

