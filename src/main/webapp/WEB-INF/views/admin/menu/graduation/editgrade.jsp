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
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<form:form method="post" action="gradeupdate" modelAttribute="graduationGrade" class="form-horizontal mb-25 mt-25">
					<form:hidden path="id" />
					<div class="form-group">
						<label class="col-sm-2 control-label">적용년도</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:input path="year" class="form-control" />
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">적용학과</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:select path="departmentId" class="form-control" itemValue="id" itemLabel="name" items="${ departments }" />
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">졸업요건명</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:select path="graduationId" class="form-control" itemValue="id" itemLabel="name" items="${ graduations }" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">학점명</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:input path="name" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">학점</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:input path="score" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">비고</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:input path="note" class="form-control" />
						</div>
					</div>
					<button type="submit"
						class="btn btn-info mb-25 col-md-2 col-md-offset-5">확인</button>
				</form:form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

