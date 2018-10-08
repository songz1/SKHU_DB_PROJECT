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
	src="../../../res/script/admin/main.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<form method="post" enctype="multipart/form-data">
					<table class="table text-center">
						<h4 class="text-center">졸업 이수 학점</h4>
						<tr>
							<td class="title col-md-1"></td>
							<td class="title col-md-1">졸업 학점</td>
							<td class="title col-md-1">전공 학점</td>
							<td class="title col-md-1">교양 학점</td>
							<td class="title col-md-1">특별과정 학점</td>
							<td class="title col-md-1">전공탐색 학점</td>
						</tr>
						<tr>
							<td class="title col-md-1">2017학번까지</td>
							<td class="col-md-1">130 이상</td>
							<td class="col-md-1">32 이상</td>
							<td class="col-md-1">60 이상</td>
							<td class="col-md-1">15 이상</td>
							<td class="col-md-1">해당 없음</td>
						</tr>
						<tr>
							<td class="title col-md-1">2018학번부터</td>
							<td class="col-md-1">130 이상</td>
							<td class="col-md-1">34 이상</td>
							<td class="col-md-1">60~63 이상</td>
							<td class="col-md-1">해당 없음</td>
							<td class="col-md-1">18 이상</td>
						</tr>
					</table>
					<div class="text-right btn-lg">
						<a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a>
					</div>
					<table class="table text-center">
						<tr>
							<td class="title col-md-1"></td>
							<td class="title col-md-1">졸업 학점</td>
							<td class="title col-md-1">전공 학점</td>
							<td class="title col-md-1">교양 학점</td>
							<td class="title col-md-1">특별과정 학점</td>
							<td class="title col-md-1">전공탐색 학점</td>
						</tr>
						<tr>
							<td class="title col-md-1">2018학번부터</td>
							<td class="col-md-1">130 이상</td>
							<td class="col-md-1">34 이상</td>
							<td class="col-md-1">60~63 이상</td>
							<td class="col-md-1">해당 없음</td>
							<td class="col-md-1">18 이상</td>
						</tr>
					</table>
					<div class="text-right btn-lg">
						<a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a>
					</div>
					<div class="form-group">
						<label>파일</label> <input type="file"
							class="form-control form-width form-height" name="scoreFile" />
					</div>
					<table class="table text-center">
						<h4 class="text-center">학년별 수료 학점</h4>
						<tr>
							<td class="title col-md-1">구분</td>
							<td class="title col-md-1">총 취득 학점</td>
						</tr>
						<tr>
							<td class="col-md-1">1학년 수료</td>
							<td class="col-md-1">34 이상</td>
						</tr>
						<tr>
							<td class="col-md-1">2학년 수료</td>
							<td class="col-md-1">68 이상</td>
						</tr>
						<tr>
							<td class="col-md-1">3학년 수료</td>
							<td class="col-md-1">102 이상</td>
						</tr>
						<tr>
							<td class="col-md-1">4학년 수료</td>
							<td class="col-md-1">130 이상</td>
						</tr>
					</table>
					<div class="text-right btn-lg">
						<a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a>
					</div>
					<div class="form-group">
						<label>파일</label> <input type="file"
							class="form-control form-width form-height" name="completeFile" />
					</div>

					<table class="table text-center">
						<h4 class="text-center">학번별 교양 필수 학점</h4>
						<tr>
							<td class="title col-md-1">구분</td>
							<td class="title col-md-2">내용</td>
						</tr>
						<tr>
							<td class="col-md-1">2015학번까지</td>
							<td class="col-md-2">채플 1학점 2회<br> 사회봉사 그룹 2학점
							</td>
						</tr>
						<tr>
							<td class="col-md-1">2016학번</td>
							<td class="col-md-2">채플 1학점 2회<br> 사회봉사 그룹 2학점<br>
								대학생활세미나I 2학점, 대학생활세미나II 2학점<br> 말과글 2학점
							</td>
						</tr>
						<tr>
							<td class="col-md-1">2017학번</td>
							<td class="col-md-2">채플 1학점 2회<br> 사회봉사 그룹 2학점<br>
								대학생활세미나I 2학점, 대학생활세미나II 2학점<br> 말과글 2학점
							</td>
						</tr>
						<tr>
							<td class="col-md-1">2018학번부터</td>
							<td class="col-md-2">채플 1학점 2회<br> 사회봉사 그룹 2학점<br>
								대학생활세미나I 2학점, 대학생활세미나II 2학점<br> 말과글 2학점, 인권과 평화 2학점<br>
								과학기술과 에콜로지 2학점, 데이터 활용 및 분석 2학점
							</td>
						</tr>
					</table>
					<div class="text-right btn-lg">
						<a href="#"><i class="glyphicon glyphicon-floppy-remove"></i></a>
					</div>
					<div class="form-group">
						<label>파일</label> <input type="file"
							class="form-control form-width form-height" name="essentialFile" />
					</div>

					<h4 class="text-center">상세 졸업요건</h4>
					<table class="table text-center">
						<tr>
							<td class="title col-md-1">학번</td>
							<td class="title col-md-2">첨부파일</td>
						</tr>
						<tr>
							<td class="col-md-1">2018학번</td>
							<td class="col-md-2"><a href="#"><i
									class="glyphicon glyphicon-download-alt"></i></a> <a href="#"><i
									class="glyphicon glyphicon-floppy-remove"></i></a></td>
						</tr>
					</table>
					<div class="form-group">
						<label>파일</label> <input type="file"
							class="form-control form-width form-height" name="detailFile" />
					</div>
					<div class="form-group text-center">
						<button type="submit" class="btn btn-primary">
							<i class="glyphicon glyphicon-ok"></i>저장
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

