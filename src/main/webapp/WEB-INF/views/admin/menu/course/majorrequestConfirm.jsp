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
				<table>
					<h4 class="text-center">전공인정신청 규칙</h4>
					<hr />
					<tr>
						<td class="col-md-5 text-center">${ rule.content }</td>
					</tr>
				</table>

				<hr />

				<h3 class="text-center mb-25">전공인정신청</h3>
				<form action="majoradmit" method="post">
					<div class="form-group col-md-4 col-md-offset-4">
						<select name="subject" class="form-control">
							<option value="0">미선택</option>
							<c:forEach var="score" items="${ scores }">
								<option value="${ score.id }">${ score.subject.name }</option>
							</c:forEach>
						</select>
					</div>
					<div>
						<button type="submit" class="btn btn-info col-md-2 col-md-offset-5 mb-25">신청</button>
					</div>
				</form>

			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

