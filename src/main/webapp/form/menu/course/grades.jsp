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
	href="../../../res/css/main.css?ver=1">
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">

				<table class="table text-center">
					<h3 class="text-center">성적 조회</h3>
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
						<td class="title col-md-1">년도</td>
						<td class="col-md-1"><input type="text" name="year" value="2018"></input></td>
						<td class="title col-md-1">학기</td>
						<td class="col-md-1">
							<select name="semester">
								<option value="1">1학기</option>
								<option value="2">2학기</option>
								<option value="summer">여름학기</option>
								<option value="autumn">가을학기</option>
							</select>
						</td>
						<td class="col-md-1">
							<span style="float:left">
							<input type="checkbox">전체학기</button>
							</span>
						</td>
						<td class="col-md-1">
							<span style="float:right">
							<button type="submit" class="btn btn-info btn-block"
								style="WIDTH: 100pt;" onclick="/">조회</button>
							</span>
						</td>
					</tr>
				</table>

				<table class="table text-center">
					<tr class="title">
						<td class="col-md-1">년도</td>
						<td class="col-md-1">학기</td>
						<td class="col-md-1">과목코드</td>
						<td class="col-md-4">과목명</td>
						<td class="col-md-1">교수명</td>
						<td class="col-md-1">이수구분</td>
						<td class="col-md-1">학점</td>
						<td class="col-md-1">성적등급</td>
					</tr>

					<tr>
						<td class="col-md-1">2018</td>
						<td class="col-md-1">1학기</td>
						<td class="col-md-1">IC00043</td>
						<td class="col-md-4">과정지도5</td>
						<td class="col-md-1">이승진</td>
						<td class="col-md-1">전필</td>
						<td class="col-md-1">1.0</td>
						<td class="col-md-1">P</td>
					</tr>
					<tr>
						<td class="col-md-1">2018</td>
						<td class="col-md-1">1학기</td>
						<td class="col-md-1">IC00029</td>
						<td class="col-md-4">사물인터넷기초</td>
						<td class="col-md-1">유상신</td>
						<td class="col-md-1">전선</td>
						<td class="col-md-1">3.0</td>
						<td class="col-md-1">A0</td>
					</tr>
					<tr>
						<td class="col-md-1">2018</td>
						<td class="col-md-1">1학기</td>
						<td class="col-md-1">IC00011</td>
						<td class="col-md-4">고급웹프로그래밍I</td>
						<td class="col-md-1">이승진</td>
						<td class="col-md-1">전선</td>
						<td class="col-md-1">3.0</td>
						<td class="col-md-1">B+</td>
					</tr>
					<tr>
						<td class="col-md-1">2018</td>
						<td class="col-md-1">1학기</td>
						<td class="col-md-1">IC00010</td>
						<td class="col-md-4">알고리즘</td>
						<td class="col-md-1">이승진</td>
						<td class="col-md-1">전필</td>
						<td class="col-md-1">3.0</td>
						<td class="col-md-1">C+</td>
					</tr>
					<tr>
						<td class="col-md-1">2018</td>
						<td class="col-md-1">1학기</td>
						<td class="col-md-1">IC00004</td>
						<td class="col-md-4">웹페이지구축II</td>
						<td class="col-md-1">정영희</td>
						<td class="col-md-1">전선</td>
						<td class="col-md-1">3.0</td>
						<td class="col-md-1">C0</td>
					</tr>
					<tr>
						<td class="col-md-1">2018</td>
						<td class="col-md-1">1학기</td>
						<td class="col-md-1">IC00002</td>
						<td class="col-md-4">컴퓨터구조</td>
						<td class="col-md-1">유상신</td>
						<td class="col-md-1">전필</td>
						<td class="col-md-1">3.0</td>
						<td class="col-md-1">A+</td>
					</tr>
					<tr>
						<td class="col-md-1">2018</td>
						<td class="col-md-1">1학기</td>
						<td class="col-md-1">AE00074</td>
						<td class="col-md-4">젠더로세상보기</td>
						<td class="col-md-1">김영선</td>
						<td class="col-md-1">교선</td>
						<td class="col-md-1">3.0</td>
						<td class="col-md-1">A+</td>
					</tr>
					<tr>
						<td class="col-md-1">2018</td>
						<td class="col-md-1">1학기</td>
						<td class="col-md-1">AD00001</td>
						<td class="col-md-4">영어회화I</td>
						<td class="col-md-1">Steve</td>
						<td class="col-md-1">교선</td>
						<td class="col-md-1">2.0</td>
						<td class="col-md-1">B0</td>
					</tr>
				</table>

				<table class="table text-center">
					<tr>
						<td class="title col-md-1">신청학점</td>
						<td class="col-md-1">21.0</td>
						<td class="title col-md-1">취득학점</td>
						<td class="col-md-1">21.0</td>
						<td class="title col-md-1">평점</td>
						<td class="col-md-1">3.85</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>