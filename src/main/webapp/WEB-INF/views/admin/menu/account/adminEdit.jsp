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
	src="../../../res/script/admin/toDetail.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">관리자 정보</h3>
				<hr />
				<form:form method="post" action="edit" modelAttribute="admin" class="form-horizontal mb-25 mt-25">
					<form:hidden path="id" />
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label col-md-offset-1">교번</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<form:input path="loginId" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label col-md-offset-1">이름</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<form:input path="name" class="form-control" />
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label col-md-offset-1">담당
							부서</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<form:select path="departmentId" class="form-control"
								itemValue="id" itemLabel="name" items="${ departments }" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label col-md-offset-1">이메일</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<form:input path="email" class="form-control" />
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label col-md-offset-1">권한</label>
						<div class="mb-25 col-md-4 col-md-offset-1">
							<form:select path="authority" class="form-control">
								<form:option value="2" label="관리자" />
								<form:option value="3" label="행정/전산" />
								<form:option value="4" label="교수" />
							</form:select>
						</div>
					</div>
					<c:if test="${ admin.id > 0 }">
						<a href="delete?id=${ admin.id }"
							class="btn btn-danger mb-20 col-md-2 col-md-offset-3"
							data-confirm-delete>탈퇴</a>
					</c:if>
					<button type="submit"
						class="btn btn-info mb-20 col-md-2 col-md-offset-2">수정</button>
				</form:form>
			</div>
		</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>

