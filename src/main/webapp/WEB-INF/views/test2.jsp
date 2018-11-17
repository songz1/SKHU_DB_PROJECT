<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	교수진
	<form name="excelUploadForm" enctype="multipart/form-data" method="post"
		action="myTest1">
		<input type="file" name="excelFile" />
		<div class="bottom">
			<input type="submit"/>
		</div>
	</form>
	소프트웨어 과목
	<form name="excelUploadForm" enctype="multipart/form-data" method="post"
		action="myTest2">
		<input type="file" name="excelFile" />
		<div class="bottom">
			<input type="submit"/>
		</div>
	</form>
	일반과목
	<form name="excelUploadForm" enctype="multipart/form-data" method="post"
		action="myTest3">
		<input type="file" name="excelFile" />
		<div class="bottom">
			<input type="submit"/>
		</div>
	</form>
</body>
</html>