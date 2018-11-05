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
<link rel="stylesheet" type="text/css"
	href="../../../res/css/common/form.css?ver=1">
<script type="text/javascript"
	src="../../../res/script/common/graduation.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h1>학부/학과 졸업요건</h1>
				<form method="post" enctype="multipart/form-data">
					<table class="table mt-25">
						<thead>
							<tr>
								<th class="col-md-12">${ department.name }</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="year" items="${ years }">
								<tr class="tr-hover cursor" data-url="info?id=${ department.id }&year=${ year.year }">
									<td>${ year.year }학번</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

