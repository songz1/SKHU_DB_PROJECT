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
	href="../../../res/css/admin/main.css?ver=1">
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
				<h3 class="text-center">조치사항 목록</h3>
				<table class="table text-center">
					<tr>
						<td class="title col-md-1">학번</td>
						<td class="col-md-1"><input type="text" name="studentNumber"></input>
						</td>
					
						<td class="col-md-1"><span style="float: right">
								<button type="submit" class="btn btn-default btn-block"
									style="WIDTH: 100pt;" onclick="/">조회</button>
						</span></td>
					</tr>
				</table>

				<table class="table table-bordered mt5">
					<thead>
						<tr class="title">
							<th class="text-center">학번</th>
							<th class="text-center">이름</th>
							<th class="text-center">학과</th>
							<th class="text-center">수정 날짜</th>
							<th class="text-center">성적 업로드</th>
						</tr>
					</thead>
					<tbody>
						<tr class="text-center cursor" data-url="gradeDetail.jsp">
							<td>201532020</td>
							<td>송지은</td>
							<td>소프트웨어공학과</td>
							<td>2018.09.09</td>
							<td class="col-md-4"><input type="file"
							class="form-control form-width" name="grade" /></td>
						</tr>
						<tr class="text-center cursor" data-url="gradeDetail.jsp">
							<td>201432019</td>
							<td>신정호</td>
							<td>소프트웨어공학과</td>
							<td>2018.07.21</td>
							<td class="col-md-4"><input type="file"
							class="form-control form-width" name="grade" /></td>
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

