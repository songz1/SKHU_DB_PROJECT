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
	src="../../../res/script/common/mygraduation.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">학번</td>
						<td class="col-md-1">${ student.studentNumber }</td>
						<td class="title col-md-1">이름</td>
						<td class="col-md-1">${ student.name }</td>
						<td class="title col-md-1">학과</td>
						<td class="col-md-2">${ student.department.name }</td>
					</tr>
				</table>
				<div class="text-center">
					<h3>주전공</h3>
				</div>
				<div class="table-responsive">
					<table class="table text-center">
						<tr>
							<td class="col-md-4 danger">졸업 학점 109/130</td>
							<td class="col-md-4 success">전공 학점 41/32</td>
							<td class="col-md-4 danger">중국어영역 8/15</td>
						</tr>
					</table>
				</div>
				<div class="table-responsive">
					<table class="table text-center">
						<tr class="warning way-essential cursor">
							<td class="col-md-4"></td>
							<td class="col-md-4">전공 필수 </td>
							<td class="col-md-4"></td>
						</tr>
						<tr class="way-detail">
							<td class="col-md-4 success">c프로그래밍I</td>
							<td class="col-md-4 success">과정지도1</td>
							<td class="col-md-4 danger">C프로그래밍II</td>
						</tr>
						<tr class="way-detail">
							<td class="col-md-4 success">c프로그래밍I</td>
							<td class="col-md-4 success">과정지도1</td>
							<td class="col-md-4 danger">C프로그래밍II</td>
						</tr>
						<tr class="way-detail">
							<td class="col-md-4 success">c프로그래밍I</td>
							<td class="col-md-4 success">과정지도1</td>
							<td class="col-md-4 danger">C프로그래밍II</td>
						</tr>
					</table>
				</div>
				<h3 class="text-center">전공 기초</h3>
				<div class="table-responsive">
					<table class="table text-center">
						<tr>
							<td class="col-md-4 success">교양 57/47</td>
						</tr>
					</table>
				</div>
				<div class="table-responsive">
					<table class="table text-center">
						<tr class="success essential-subject cursor">
							<td class="col-md-4"></td>
							<td class="col-md-4">필수과목</td>
							<td class="col-md-4"></td>
						</tr>
						<tr class="subject-detail">
							<td class="col-md-4 success">c프로그래밍I</td>
							<td class="col-md-4 success">과정지도1</td>
							<td class="col-md-4 danger">C프로그래밍II</td>
						</tr>
					</table>
				</div>
				<div class="table-responsive">
					<table class="table text-center">
						<tr class="info">
							<td class="col-md-4"></td>
							<td class="col-md-4">부분필수과목</td>
							<td class="col-md-4"></td>
						</tr>
						<tr>
							<td class="col-md-4 success">이산수학</td>
							<td class="col-md-4 success">대학수학</td>
							<td class="col-md-4 danger">정보사회론</td>
						</tr>
						<tr class="active">
							<td class="col-md-4">2과목 이상 포함</td>
							<td class="col-md-4"></td>
							<td class="col-md-4"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>