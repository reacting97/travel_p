<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>맛집 등록 페이지</title>
<style type="text/css">
/* 맛집 등록 페이지 스타일 */
#restaurant-form {
	max-width: 700px;
	margin: 0 auto;
}

#restaurant-form label {
	font-size: 1.2rem;
}

#restaurant-form input[type="text"], #restaurant-form input[type="tel"]
	{
	font-size: 1.2rem;
	padding: 10px;
	margin-bottom: 20px;
	width: 100%;
}

#restaurant-form input[type="file"] {
	margin-bottom: 20px;
}

#restaurant-form button[type="submit"] {
	font-size: 1.2rem;
	padding: 10px 20px;
}
</style>
<!-- 부트스트랩 스타일시트 링크 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<!-- 맛집 등록 폼 -->
	<div class="container my-4">
		<h1 class="text-center">맛집 등록</h1>
		<form method="POST" action="${pageContext.request.contextPath }/food/add.do" method="post" enctype="multipart/form-data" id="restaurant-form">
			<div class="form-group">
				<label for="name">맛집 이름</label> <input type="text"
					class="form-control" id="name" name="name" required>
			</div>
			<div class="form-group">
				<label for="address">주소</label> <input type="text"
					class="form-control" id="address" name="address" required>
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label> <input type="text"
					class="form-control" id="phone" name="phone" required>
			</div>
			<div class="form-group">
				<label for="">음식점 설명</label> <textarea type="text"
					class="form-control" id="phone" name="content" required></textarea>
			</div>
			<div class="form-group">
				<label for="photo1">사진 1</label> <input type="file"
					class="form-control-file" id="photo1" name="file1" required>
			</div>
			<div class="form-group">
				<label for="photo2">사진 2</label> <input type="file"
					class="form-control-file" id="photo2" name="file2" required>
			</div>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</div>

	<!-- 부트스트랩 자바스크립트 및 제이쿼리 링크 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
