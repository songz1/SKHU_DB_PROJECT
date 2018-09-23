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
	href="../../res/css/main.css?ver=1">
<script type="text/javascript" src="../../res/script/main.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<div class="table-responsive">
					<h3 class="text-center">졸업 학점 현황</h3>

					<table class="table text-center">
						<tr class="warning summary">
							<td class="col-md-4">교양 필수 11/16</td>
							<td class="col-md-4"></td>
							<td class="col-md-4"></td>
						</tr>
						<tr class="detail">
							<td class="col-md-4 warning">채플 1/2</td>
							<td class="col-md-4 danger">사회봉사 0/2</td>
							<td class="col-md-4 success">대학생활세미나I 2/2</td>
						</tr>
						<tr class="detail">
							<td class="col-md-4 success">대학생활세미나II 2/2</td>
							<td class="col-md-4 danger">인권과평화 0/2</td>
							<td class="col-md-4 success">말과글 2/2</td>
						</tr>
						<tr class="detail">
							<td class="col-md-4 success">과학기술과에콜로지 2/2</td>
							<td class="col-md-4 success">데이터활용및분석 2/2</td>
							<td class="col-md-4"></td>
						</tr>
						<tr class="detail">
							<td class="col-md-4"></td>
							<td class="col-md-4"></td>
							<td class="col-md-4"></td>
						</tr>
					</table>

					<table class="table text-center">
						<tr class="warning summary">
							<td class="col-md-4">영역 필수 9/18</td>
							<td class="col-md-4"></td>
							<td class="col-md-4"></td>
						</tr>
						<tr class="detail">
							<td class="col-md-4 success">가치역량 6/6</td>
							<td class="col-md-4 warning">대안역량 3/6</td>
							<td class="col-md-4 danger">실천역량 0/6</td>
						</tr>
					</table>
					
					<table class="table text-center">
						<tr class="warning summary">
							<td class="col-md-4 warning">전공 탐색 7/19</td>
							<td class="col-md-4"></td>
							<td class="col-md-4"></td>
						</tr>
						<tr class="detail">
							<td class="col-md-4 success">전공탐색세미나 1/1</td>
							<td class="col-md-4 success">IT융합자율학부 개설과목 6/3</td>
							<td class="col-md-4 danger">타 학부 개설과목 0/3</td>
						</tr>
					</table>
					
				</div>
				<div class="table-responsive">
					<table class="table text-center">
						<thead>
							<tr class="info">
								<td class="col-md-3">분류</td>
								<td class="col-md-3">필수</td>
								<td class="col-md-3">선택</td>
								<td class="col-md-3">계</td>
							</tr>
						</thead>
						<tbody>
							<tr class="active">
								<td class="col-md-3">전공</td>
								<td class="col-md-3">19</td>
								<td class="col-md-3">6</td>
								<td class="col-md-3">25</td>
							</tr>
							<tr class="active">
								<td class="col-md-3">부전공</td>
								<td class="col-md-3">6</td>
								<td class="col-md-3">3</td>
								<td class="col-md-3">9</td>
							</tr>
							<tr class="active">
								<td class="col-md-3">복수전공</td>
								<td class="col-md-3">6</td>
								<td class="col-md-3">3</td>
								<td class="col-md-3">9</td>
							</tr>
							<tr class="active">
								<td class="col-md-3">편입</td>
								<td class="col-md-3">3</td>
								<td class="col-md-3">3</td>
								<td class="col-md-3">6</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="table-responsive">
					<table class="table text-center">
						<tr class="info">
							<td class="col-md-4">기타</td>
							<td class="col-md-4">교직</td>
							<td class="col-md-4">평교</td>
						</tr>
						<tr class="active">
							<td class="col-md-4">3</td>
							<td class="col-md-4">3</td>
							<td class="col-md-4">3</td>
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

