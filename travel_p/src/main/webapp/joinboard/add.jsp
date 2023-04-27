<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>게시판 글쓰기 폼</title>
<!-- 부트스트랩 스타일시트 링크 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 폼 전용 스타일시트 -->
<style>
html,body{
background-image: url('https://t1.daumcdn.net/cfile/tistory/990BC43F5D2E590D1F');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

form {
	max-width: 700px;
	margin: 0 auto;
	padding: 20px;
	background-color: #f8f9fa;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	color: #007bff;
}

label {
	font-weight: bold;
	margin-bottom: 10px;
}

input[type="text"], input[type="number"], input[type="file"], textarea {
	margin-bottom: 20px;
}

button[type="submit"] {
	background-color: #007bff;
	border-color: #007bff;
	font-size: 1.2rem;
	padding: 10px 20px;
	margin-top: 20px;
}

button[type="submit"]:hover {
	background-color: #0069d9;
	border-color: #0062cc;
}
</style>
</head>
<body>
	<div class="container my-4">
		<h1>게시판 글쓰기 폼</h1>
		<form method="POST" action="${pageContext.request.contextPath }/joinboard/add.do" enctype="multipart/form-data">
			<div class="form-group">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" id="writer" value="${sessionScope.loginId }" name="writer" required>
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" name="title" required>
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea rows="10" cols="30" class="form-control" id="content" name="content" rows="5"
					required></textarea>
			</div>
			<div class="form-group">
				<label for="photo1">사진 1</label> <input type="file"
					class="form-control-file" id="photo1" name="file1" required>
			</div>
			<div class="form-group">
				<label for="photo2">사진 2</label> <input type="file"
					class="form-control-file" id="photo2" name="file2">
			</div>
			<button type="submit" class="btn btn-primary">작성하기</button>
			<a href="${pageContext.request.contextPath }/joinboard/list.do"><button type="button" class="btn btn-primary">작성취소</button></a>
		</form>
	</div>
</body>
</html>