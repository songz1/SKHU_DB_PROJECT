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
	src="../../../res/script/admin/hideChange.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<table>
					<h4 class="text-center">대체과목신청 규칙</h4>
					<hr />
					<tr>
						<td class="col-md-5 text-center">${ rule.content }</td>
					</tr>
				</table>
				<hr />
				<h3 class="text-center mb-25">대체 과목 신청</h3>
				<div class="form-group col-md-4 col-md-offset-1">
					<div class="text-center">
						<label>폐지과목</label>
					</div>
					<select id="option-show" class="option form-control">
						<option value="0">미선택</option>
						<c:forEach var="map" items="${ changeMap }" varStatus="status">
							<option value="${ map.key.id }">${ map.key.subject.name }</option>
						</c:forEach>
					</select>
				</div>
				<c:forEach var="map" items="${ changeMap }">
					<form action="changerequest" id="${ map.key.id }" class="hide-form" method="post">
						<div class="form-group text-center col-md-2">
							<i class="glyphicon glyphicon-arrow-right"></i>
						</div>
						<div class="form-group col-md-4">
							<div class="text-center">
								<label>대체과목</label>
							</div>
							<input type="hidden" name="id" value="${ map.key.id }"/>
							<select name="change" class="form-control">
								<c:forEach var="subject" items="${ map.value }">
									<option value="${ subject.code }">${ subject.name }</option>
								</c:forEach>
							</select>
						</div>
						<div>
							<button type="submit" class="btn btn-info col-md-2 col-md-offset-5 mb-25">신청</button>
						</div>
					</form>
				</c:forEach>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>