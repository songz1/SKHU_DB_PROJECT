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
<script type="text/javascript"
	src="../../../res/script/common/hideSelect.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">기본정보 변경</h3>
				<form:form method="post" action="acntupdate" modelAttribute="account" class="form-horizontal mb-25 mt-25">
					<form:hidden path="id" />
					<form:hidden path="studentNumber" />
					<div class="form-group">
						<label class="col-sm-2 control-label">이름</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:input path="name" class="form-control" />
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">소속 학과</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:select path="departmentId" class="form-control" itemValue="id" itemLabel="name" items="${ departments }" />
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">이메일</label>
						<input type="email" class="form-control" name="email" placeholder="이메일">
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">학년</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:select path="year" class="form-control">
								<form:option value="1" label="1학년" />
								<form:option value="2" label="2학년" />
								<form:option value="3" label="3학년" />
								<form:option value="4" label="4학년" />
							</form:select>
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">학기</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:select path="semester" class="form-control">
								<form:option value="1" label="1학기" />
								<form:option value="2" label="2학기" />
							</form:select>
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">졸업과정</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<select name="mainGraduation" class="form-control" id="option-show">
								<c:forEach var="graduation" items="${ graduations }">
									<c:if test="${ graduation.division eq 'a' }">
										<option value="${ graduation.name }" <c:if test="${graduation.name eq mainSelect}">selected</c:if>>${ graduation.name }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">상세졸업과정</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<select name="detailGraduation" class="form-control">
								<option value="0">미선택</option>
								<c:forEach var="graduation" items="${ graduations }">
									<c:if test="${ graduation.division eq 'c' }">
										<option value="${ graduation.name }" <c:if test="${graduation.name eq detailSelect}">selected</c:if>>${ graduation.name }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group mb-50 div-minor">
						<label class="col-sm-2 control-label">타학과부전공</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<select name="minor" class="form-control">
								<option value="0">미선택</option>
								<c:forEach var="department" items="${ departments }">
									<c:if test="${ department.id ne account.departmentId }">
										<option value="${ department.name }" <c:if test="${department.name eq account.minor && account.doubleMajor eq '0'}">selected</c:if>>${ department.name }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group mb-50 div-double">
						<label class="col-sm-2 control-label">타학과복수전공1</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<select name="doubleMajor1" class="form-control">
								<option value="0">미선택</option>
								<c:forEach var="department" items="${ departments }">
									<c:if test="${ department.id ne account.departmentId }">
										<option value="${ department.name }" <c:if test="${department.name eq account.minor && account.doubleMajor ne '0'}">selected</c:if>>${ department.name }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group mb-50 div-double">
						<label class="col-sm-2 control-label">타학과복수전공2</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<select name="doubleMajor2" class="form-control">
								<option value="0">미선택</option>
								<c:forEach var="department" items="${ departments }">
									<c:if test="${ department.id ne account.departmentId }">
										<option value="${ department.name }" <c:if test="${department.name eq account.doubleMajor}">selected</c:if>>${ department.name }</option>
									</c:if>
								</c:forEach>
							</select>
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

