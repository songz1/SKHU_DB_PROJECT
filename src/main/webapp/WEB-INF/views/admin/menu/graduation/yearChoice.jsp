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
								<th class="col-md-12">영어학과</th>
							</tr>
						</thead>
						<tbody>
							<tr class="tr-hover cursor" data-url="info.jsp">
								<td>2018학번</td>
							</tr>
							<tr class="tr-hover cursor" data-url="info.jsp">
								<td>2017학번</td>
							</tr>
							<tr class="tr-hover cursor" data-url="info.jsp">
								<td>2016학번</td>
							</tr>
							<tr class="tr-hover cursor" data-url="info.jsp">
								<td>2015학번</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>2014학번</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>2013학번</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>2012학번</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>2011학번</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>2010학번</td>
							</tr>
							<tr class="tr-hover cursor">
								<td>2009학번</td>
							</tr>
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

