<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${authInfo.id}</h1>
	<table class="table table-bordered mt5">
		<thead>
			<tr>
				<th>id</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="admin" items="${ admins }">
				<tr>
					<td>${ admin.id }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>