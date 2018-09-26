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
	<link rel="stylesheet" type="text/css"
	href="../../../res/css/admin/form.css?ver=1">
<script type="text/javascript"
	src="../../../res/script/admin/graduation.js?ver=1"></script>
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
							<tr data-url="info.jsp">
								<th class="col-md-10">인문융합 자율학부</th>
								<th class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-md-10">영어학과</td>
								<td class="text-right col-md-2">
									<input type="file" name="english" />
								</td>
							</tr>
							<tr>
								<td class="col-md-10">일어일본학과</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
							<tr>
								<td class="col-md-10">중어중국학과</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
							<tr>
								<td class="col-md-10">신학과(기독교문화전공)</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<th class="col-md-10">사회융합 자율학부</th>
								<th class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-md-10">사회과학과</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
							<tr>
								<td class="col-md-10">사회복지학과</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
							<tr>
								<td class="col-md-10">경영학과</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<th class="col-md-10">미디어컨텐츠융합 자율학부</th>
								<th class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-md-10">신문방송학과</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
							<tr>
								<td class="col-md-10">디지털컨텐츠학과</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<th class="col-md-10">IT융합 자율학부</th>
								<th class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-md-10">컴퓨터공학과</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
							<tr>
								<td class="col-md-10">소프트웨어공학과</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
							<tr>
								<td class="col-md-10">정보통신공학과</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
							<tr>
								<td class="col-md-10">글로컬IT공학과</td>
								<td class="text-right col-md-2"><a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a></td>
							</tr>
						</tbody>
					</table>
					<button type="submit" class="btn btn-primary">
						<i class="glyphicon glyphicon-ok"></i>저장
					</button>
				</form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

