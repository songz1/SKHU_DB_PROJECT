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
<title>SKHU 졸업관리</title>
</head>

<body>
	<jsp:include page="../header.jsp" flush="true"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<table>
					<h4 class="title text-center">대체과목신청 방법</h4>
					<hr />
					<tr>
						<td class="col-md-5 text-center">1. 대체희망과목이 대체과목 목록에 있는 경우</br> ▶
							수강신청기간에 대체 할 과목을 수강신청 한 다음 대체과목 재수강 신청 기간(수강변경 기간)에 신청
							</p> 2. 대체희망과목이 대체과목 목록에 없는 경우</br> ▶ 학과장 또는 지도교수 허가하에 다른 과목을 수강하여 성적이 나온
							후 아래 “재수강 성적 대체 청원서” 양식을 제출
							</p>
						</td>
					</tr>
					<tr>
						<td class="col-md-5 text-center">
							<hr /> ***</br> 1. 고학년들이 1, 2학년 과목을 재수강 또는 초수강 하려고 할 때, 전탐 과목을 대체
							과목으로 지정 가능 (졸업 사정시에 전공으로 인정하여 사정함. 학과에서 대체 과목 목록이 필요하면 작성)<p />
							2. 전탐 과목을 대체 과목으로 지정할 수 없고 이제는 개설되지 않는 1, 2학년 과목(예: 과정지도 1, 2 ,
							3등)은 개설된 다른 전공 과목을 수강(몇 학점이든 상관 없음)하면 인정</br>
							단, 재수강인 경우에는 대체과목으로 처리되어 B+이하의 성적만 받을 수 있음 (초수강인 경우에는 성적 부여에 제한이 없음)
							<p />
						</td>
					</tr>
				</table>

				<table>
					<hr />
					<h4 class="title text-center">양식 다운로드</h4>
					<hr />
					<tr>
						<td class="col-md-5 col-md-offset-5 text-center">1. <a
							href="/" download="재수강성적대체청원서">재수강 성적 대체 청원서</a></td>
					</tr>
				</table>

				<hr />

				<h3 class="text-center mb-25">대체 과목 신청</h3>
				<form>
					<div class="form-group col-md-4 col-md-offset-1">
						<div class="text-center">
							<label>폐지과목</label>
						</div>
						</p>
						과목 코드: <input type="text" name="lostSubjectCode"
							class="form-control" placeholder="과목 코드"></br> 과목명: <input
							type="text" name="lostSubjectName" class="form-control"
							placeholder="과목명"></br> 이수 구분: <select name="lostSubjectPart"
							class="form-control">
							<option value="1">전공필수</option>
							<option value="2">전공선택</option>
							<option value="3">전공탐색</option>
							<option value="4">교양필수</option>
							<option value="5">교양선택</option>
						</select>
					</div>
					<div class="form-group text-center col-md-2">
						<i class="glyphicon glyphicon-arrow-right"></i>
					</div>
					<div class="form-group col-md-4">
						<div class="text-center">
							<label>대체과목</label>
						</div>
						</p>
						과목 코드: <input type="text" name="changeSubjectCode"
							class="form-control" placeholder="과목 코드"></br> 과목명: <input
							type="text" name="changeSubjectName" class="form-control"
							placeholder="과목명"></br> 이수 구분: <select
							name="changeSubjectPart" class="form-control">
							<option value="1">전공필수</option>
							<option value="2">전공선택</option>
							<option value="3">전공탐색</option>
							<option value="4">교양필수</option>
							<option value="5">교양선택</option>
						</select>
					</div>
					<div class="form-group col-md-6 col-md-offset-3 mt-25 mb-25">
						<textarea name="reportContent" class="form-control"
							maxlength="1024" style="height: 100px;" placeholder="기타사항"></textarea>
					</div>
					<div>
						<input type="file"
							class="form-group col-md-5 col-md-offset-5 mb-25" name="file" />
					</div>
					<div>
						<button type="button"
							class="btn btn-danger col-md-2 col-md-offset-3">취소</button>
					</div>
					<div>
						<button type="submit"
							class="btn btn-info col-md-2 col-md-offset-2 mb-25">신청</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>

