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
	href="../../../res/css/admin/creategraduation.css?ver=1">
<link rel="stylesheet" type="text/css"
	href="../../../res/css/common/form.css?ver=1">
<script type="text/javascript"
	src="../../../res/script/admin/creategraduation.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">졸업요건 생성</h3>
				<select class="option form-control" id="show-form">
					<option value="0">선택</option>
					<option value="1">학점</option>
					<option value="2">과목</option>
					<option value="3">엑셀 파일 업로드</option>
				</select>
				<form:form method="post" action="creategrade" modelAttribute="graduationGrade" class="form-horizontal mb-25 mt-25 create-grade">
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
				<form:form method="post" action="createsubject" modelAttribute="graduationSubject" class="form-horizontal mb-25 mt-25 create-subject">
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
						<label class="col-sm-2 control-label">과목코드</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<input type="text" name="code" class="form-control" value="${ graduationSubject.subject.code }"/>
						</div>
					</div>
					<div class="form-group mb-50">
						<label class="col-sm-2 control-label">학기</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:select path="semester">
								<form:option value="0" label="상관없음" />
								<form:option value="1" label="1학기" />
								<form:option value="2" label="2학기" />
								<form:option value="3" label="3학기" />
								<form:option value="4" label="4학기" />
								<form:option value="5" label="5학기" />
								<form:option value="6" label="6학기" />
								<form:option value="7" label="7학기" />
								<form:option value="8" label="8학기" />
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">비고</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:input path="note" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">필수</label>
						<div class="mb-25 col-md-4 col-md-offset-2">
							<form:checkbox path="essential" />
						</div>
					</div>
					<button type="submit"
						class="btn btn-info mb-25 col-md-2 col-md-offset-5">확인</button>
				</form:form>
				<form method="post" enctype="multipart/form-data" action="createexcel"
					class="create-upload">
					<div class="form-group">
					<hr/>
						<label>양식</label><br/>
						<a href="downgradegraduation">성적졸업요건양식</a><br/>
						<a href="downsubjectgraduation">과목졸업요건양식</a>
						<hr/>
						<label>성적졸업요건파일</label>
						<input type="file" class="form-control form-width form-height"
							name="gradeFile" />
						<label>과목졸업요건파일</label>
						<input type="file" class="form-control form-width form-height"
							name="subjectFile" />
					</div>
					<div class="form-group">
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

