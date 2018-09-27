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
	href="../../../res/css/user/main.css?ver=1">
<link rel="stylesheet" type="text/css"
	href="../../../res/css/user/mygraduation.css?ver=1">
<script type="text/javascript"
	src="../../../res/script/user/mygraduation.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<form>
					<table class="table text-center">
						<h3 class="text-center">내 졸업요건</h3>
						<tr>
							<td class="title col-md-1">학번</td>
							<td class="col-md-1">201532020</td>
							<td class="title col-md-1">이름</td>
							<td class="col-md-1">송지은</td>
							<td class="title col-md-1">학과</td>
							<td class="col-md-2">소프트웨어공학과</td>
						</tr>
					</table>
	
					<table class="table text-center">
						<tr>
							<td class="title col-md-1">졸업요건</td>
							<td class="col-md-1">
								<select name="way" id="tse" onChange="test()">
										<option value="1">주전공</option>
										<option value="2">부전공</option>
										<option value="3">복수</option>
										<option value="4">편입</option>
								</select>
							</td>
							<td class="title col-md-1 td-minor">타학과부전공</td>
							<td class="col-md-1 td-minor">
								<select name="minor">
										<option value="1">소프트웨어공학과</option>
										<option value="2">컴퓨터공학과</option>
										<option value="3">영어학과</option>
										<option value="4">중국어학과</option>
								</select>
							</td>
							<td class="title col-md-1 td-double">타학과복수전공1</td>
							<td class="col-md-1 td-double">
								<select name="doubleMajor1">
										<option value="1">소프트웨어공학과</option>
										<option value="2">컴퓨터공학과</option>
										<option value="3">영어학과</option>
										<option value="4">중국어학과</option>
								</select>
							</td>
							<td class="title col-md-1 td-double">타학과복수전공2</td>
							<td class="col-md-1 td-double">
								<select name="doubleMajor2">
										<option value="1">소프트웨어공학과</option>
										<option value="2">컴퓨터공학과</option>
										<option value="3">영어학과</option>
										<option value="4">중국어학과</option>
								</select>
							</td>
						</tr>
					</table>
					<table class="table text-center">
						<tr>
							<td class="title col-md-1">특수졸업요건</td>
							<td class="col-md-1">
								<select name="special">
									<option value="1">없음</option>
									<option value="2">전공기초</option>
									<option value="3">전공심화</option>
									<option value="4">인도창</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="col-md-1"></td>
							<td class="col-md-1 text-right">
								<button type="submit" class="btn btn-default">
									조회
								</button>
							</td>
						</tr>
					</table>
				</form>
				<h3 class="text-center">주전공</h3>
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
						<tr class="warning way-essential">
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
						<tr class="success essential-subject">
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