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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../res/css/main.css?ver=1">
<script type="text/javascript" src="../../res/script/main.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
<header>
	<div id="divNav">
		<nav class="navbar navbar-custom navbar-fixed-top" id="topnavbar">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="main.jsp">성공회대학교 졸업관리</a>
				</div>
				<div id="bs-navbar-collapse" class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 졸업 요건 <span class="caret"></span>
						</a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 수강 관리 <span class="caret"></span>
						</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 계정 정보 변경 <span class="caret"></span>
						</a></li>
					</ul>

					<div class="uib-button-bar navbar-right">
						<div class="divItem">
							<div>
								<i class="glyphicon glyphicon-user"></i> 201532020 송지은 (6학기)<br />
							</div>
							<button type="submit" class="btn btn-default btn-block"
								onclick="/">로그아웃</button>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
</header>
<main>
	<div class="container">
	<div id="header" class="panel panel-default">
		<div class="panel-body">
			<div class="table-responsive">
			<table class="table text-center">
				<h3 class="text-center">졸업 학점 현황</h3>
					<tr class="warning summary">
  						<td class="col-md-4">필수교양 13/16</td>
  						<td class="col-md-4"></td>
  						<td class="col-md-4"></td>
  					</tr>
  					<tr class="detail">
  						<td class="col-md-4 warning">채플 1/2</td>
  						<td class="col-md-4 danger">사회봉사 0/2</td>
  						<td class="col-md-4 success">대학생활세미나I 2/2</td>
  					</tr>
  					<tr class="etail">
  						<td class="col-md-4 success">대학생활세미나II 2/2</td>
  						<td class="col-md-4 success">인권과평화 0/2</td>
  						<td class="col-md-4 success">말과글 2/2</td>
  					</tr>
  					<tr class="detail">
  						<td class="col-md-4 success">과학기술과에콜로지 2/2</td>
  						<td class="col-md-4 success">데이터활용및분석 2/2</td>
  						<td class="col-md-4 success"></td>
  					</tr>
  					<tr class="detail">
  						<td class="col-md-4"></td>
  						<td class="col-md-4"></td>
  						<td class="col-md-4"></td>
  					</tr>
  					<tr>
  						<td class="col-md-4 warning">전공탐색 16/19</td>
  						<td class="col-md-4 success">전공탐색세미나 <i class="glyphicon glyphicon-ok"></</i></td>
  						<td class="col-md-4 danger">융학자율학부개설과목<i class="glyphicon glyphicon-remove"></i></td>
  					<tr>
  						<td class="col-md-4 success">가치역량 6/6</td>
  						<td class="col-md-4 warning">대안역량 3/6</td>
  						<td class="col-md-4 danger">실천역량 0/6</td>
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
<footer>
</footer>
</body>
</html>

