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
				<hr />
				<table>
					<tr>
						<td class="title col-md-5 col-md-offset-5 text-center">양식
							다운로드</td>
						<td class="col-md-5 col-md-offset-5 text-center">1. <a
							href="/" download="대체과목목록">대체과목 목록</a></td>
						<td class="col-md-5 col-md-offset-5 text-center">2. <a
							href="/" download="규칙">규칙</a></td>
					</tr>
				</table>
				<hr />
				<table class="table text-center">
					<tr>
						<td class="title col-md-3">대체과목 목록 업로드</td>
						<td class="title col-md-2"><input type="file"
							class="form-control form-width" name="list" /></td>
						<td class="title col-md-1"></td>
					</tr>
					<tr>
						<td class="title col-md-3">규칙 업로드</td>
						<td class="title col-md-2"><input type="file"
							class="form-control form-width" name="rule" /></td>
						<td class="title col-md-1"><a href=""><button
									type="submit" class="btn btn-default">확인</button></a></td>
					</tr>
				</table>

				<hr />
				<h3 class="text-center">대체과목 신청 목록</h3>
				<hr />
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
						<td class="title col-md-1"><select name="student">
								<option value="1">학번</option>
								<option value="2">이름</option>
						</select></td>
						<td class="col-md-1"><input type="text" name="student"></input>
						
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
						</tr>
					</thead>
					<tbody>
						<tr class="text-center cursor tr-hover"
							data-url="changerequestDetail.jsp">
							<td>201532020</td>
							<td>송지은</td>
							<td>소프트웨어공학과</td>
						</tr>
						<tr class="text-center cursor tr-hover"
							data-url="changerequestDetail.jsp">
							<td>201732099</td>
							<td>이세종</td>
							<td>소프트웨어공학과</td>
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

