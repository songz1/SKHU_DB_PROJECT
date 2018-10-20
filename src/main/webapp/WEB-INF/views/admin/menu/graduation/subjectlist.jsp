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
	src="../../../res/script/admin/graduationlist.js?ver=1"></script>
<title>SKHU 졸업관리</title>
</head>
<body>
	<jsp:include page="../header.jsp" flush="false"></jsp:include>
	<main>
	<div class="container">
		<div id="header" class="panel panel-default">
			<div class="panel-body">
				<form>
					<h3 class="text-center">졸업요건 목록</h3>
					<table class="table text-center">
						<tr>
							<td class="title col-md-1">학번</td>
							<td class="col-md-1"><input type="text" name="studentNumber"></input>
							</td>
							<td class="title col-md-1">학과(부)</td>
							<td class="col-md-1"><select name="department">
									<option value="1">소프트웨어공학과</option>
									<option value="2">컴퓨터공학과</option>
									<option value="3">글로컬IT학과</option>
									<option value="4">정보통신공학과</option>
							</select></td>
							<td class="title col-md-1">졸업요건</td>
							<td class="col-md-1"><select name="graduation">
									<option value="1">주전공</option>
									<option value="2">부전공</option>
									<option value="3">전공기초</option>
									<option value="4">전공심화</option>
							</select></td>
						</tr>
					</table>
					<div class="form-group">
						<div class="col-md-4 col-md-offset-4 text-center mb-25">
							<button type="submit" class="btn btn-info btn-width">조회</button>
						</div>
					</div>
				</form>
				<form>
					<table class="table table-bordered table-condensed">
						<thead>
							<tr class="title">
								<th class="text-center">적용학번</th>
								<th class="text-center">학과</th>
								<th class="text-center">졸업요건명</th>
								<th class="text-center">과목명</th>
								<th class="text-center">필수여부</th>
								<th class="text-center">비고</th>
								<th class="text-center"><input type="checkbox" id="allCheck" /></th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-center tr-hover">
								<td class="cursor" edit-subject="editsubject.jsp">2018</td>
								<td class="cursor" edit-subject="editsubject.jsp">소프트웨어공학과</td>
								<td class="cursor" edit-subject="editsubject.jsp">주전공</td>
								<td class="cursor" edit-subject="editsubject.jsp">과정지도I</td>
								<td class="cursor" edit-subject="editsubject.jsp">O</td>
								<td class="cursor" edit-subject="editsubject.jsp"></td>
								<td><input type="checkbox" name="deleteId" value="5" /></td>
							</tr>
							<tr class="text-center">
								<td>2018</td>
								<td>소프트웨어공학과</td>
								<td>전공기초</td>
								<td>이산수학</td>
								<td>X</td>
								<td>2개 이상</td>
								<td><input type="checkbox" name="deleteId" value="4" /></td>
							</tr>
							<tr class="text-center">
								<td>2018</td>
								<td>소프트웨어공학과</td>
								<td>전공기초</td>
								<td>컴퓨터 활용</td>
								<td>X</td>
								<td>2개 이상</td>
								<td><input type="checkbox" name="deleteId" value="3" /></td>
							</tr>
							<tr class="text-center">
								<td>2018</td>
								<td>소프트웨어공학과</td>
								<td>전공기초</td>
								<td>대학 수학</td>
								<td>X</td>
								<td>2개 이상</td>
								<td><input type="checkbox" name="deleteId" value="2" /></td>
							</tr>
							<tr class="text-center">
								<td>2017</td>
								<td>소프트웨어공학과</td>
								<td>주전공</td>
								<td>자바 프로그래밍</td>
								<td>O</td>
								<td></td>
								<td><input type="checkbox" name="deleteId" value="1" /></td>
							</tr>
						</tbody>
					</table>
					<div class="text-right">
						<button type="submit" class="btn btn-default"
							onclick="return confirm('삭제하시겠습니까?')">
							<i class="glyphicon glyphicon-trash glyphicon-default"></i> 삭제
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

