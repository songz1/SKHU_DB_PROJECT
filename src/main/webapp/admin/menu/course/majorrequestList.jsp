<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<jsp:include page="../header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">전공인정 신청 목록</h3>
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">학과(부)</td>
						<td class="col-md-1"><select name="department">
								<option value="0">전체</option>
								<option value="1">소프트웨어공학과</option>
								<option value="2">컴퓨터공학과</option>
								<option value="3">글로컬IT학과</option>
								<option value="4">정보통신공학과</option>
						</select></td>
						<td class="title col-md-1">학번</td>
						<td class="col-md-1"><input type="text" name="studentNumber"></input>
						</td>
						<td class="title col-md-1">이름</td>
						<td class="col-md-1"><input type="text" name="studentName"></input>
						</td>
						<td class="col-md-1"><span style="float: right">
								<button type="submit" class="btn btn-default btn-block"
									style="WIDTH: 100pt;" onclick="/">조회</button>
						</span></td>
					</tr>
				</table>
				<table class="table text-center">
					<tr>
						<td class="title col-md-3">규칙 업로드</td>
						<td class="title col-md-3"><input type="file" class="form-control form-width"
							name="rule" /></td>
					</tr>
					<tr>
						<td class="title col-md-3">신청 양식 업로드</td>
						<td class="title col-md-3"><input type="file" class="form-control form-width"
							name="file" /></td>
					</tr>
				</table>

				<table class="table table-bordered mt5">
					<thead>
						<tr class="title">
							<th class="text-center">학번</th>
							<th class="text-center">이름</th>
							<th class="text-center">학과</th>
							<th class="text-center">처리 여부</th>
						</tr>
					</thead>
					<tbody>
						<tr class="text-center cursor tr-hover" data-url="majorrequestDetail.jsp">
							<td>201432019</td>
							<td>신정호</td>
							<td>소프트웨어공학과</td>
							<td>X</td>
						</tr>
						<tr class="text-center cursor tr-hover" data-url="majorrequestDetail.jsp">
							<td>201333099</td>
							<td>홍길동</td>
							<td>정보통신공학과</td>
							<td>O</td>
						</tr>
						<tr class="text-center cursor tr-hover" data-url="majorrequestDetail.jsp">
							<td>201631099</td>
							<td>이순신</td>
							<td>컴퓨터공학과</td>
							<td>O</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

