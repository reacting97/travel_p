<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 상세보기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 부트스트랩 CSS 파일 링크 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
/* CSS 코드 */
body {
	background-color: #f8f9fa;
}

.container {
	margin-top: 50px;
}

.post {
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 15px;
	box-shadow: 2px 2px 5px #ccc;
}

.post h2 {
	margin-top: 0;
	margin-bottom: 10px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
	color: #333;
	font-size: 24px;
	font-weight: bold;
	text-transform: uppercase;
}

.post .date {
	font-size: 14px;
	color: #888;
	margin-top: 10px;
}

.post-content {
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 15px;
	margin-top: 20px;
	box-shadow: 2px 2px 5px #ccc;
	line-height: 1.8;
	font-size: 16px;
	color: #555;
}

.comments {
	margin-top: 20px;
}

.comment {
	background-color: #f8f9fa;
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 15px;
	margin-bottom: 20px;
	box-shadow: 2px 2px 5px #ccc;
}

.comment .author {
	font-size: 16px;
	font-weight: bold;
	margin-top: 0;
}

.comment .date {
	font-size: 14px;
	color: #888;
	margin-top: 5px;
}

.comment .content {
	margin-top: 10px;
	font-size: 16px;
	color: #555;
}

.comment-form {
	margin-top: 50px;
}

.comment-form label {
	font-weight: bold;
}

.comment-form .form-group {
	margin-bottom: 20px;
}

.comment-form textarea {
	height: 150px;
	font-size: 16px;
	color: #555;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	background-color: #0062cc;
	border-color: #005cbf;
}

.btn-primary:focus, .btn-primary.focus {
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
}

.btn-primary:active, .btn-primary
	  .btn-primary:active, .btn-primary.active {
	background-color: #0062cc;
	border-color: #005cbf;
}
</style>
</head>
<body>
	<div class="container">
		<div class="post">
			<h2>${vo.title }</h2>
			<p class="date">작성일자: ${vo.w_date}</p>
			<div class="post-content">
				<p>${vo.content }</p>
				<div class="images">
					<img src="${vo.pic1 }" alt="이미지 1">
					<img src="${vo.pic2 }" alt="이미지 2">
				</div>
			</div>

		</div>
		<a href="${pageContext.request.contextPath }/joinboard/list.do" class="btn btn-warning">모집글게시판 리스트로 이동</a>
		<c:if test="${sessionScope.loginId eq vo.writer }">
			<a href="${pageContext.request.contextPath }/joinboard/del.do?num=${vo.num}" class="btn btn-warning">이 글 삭제</a>
			<a href="${pageContext.request.contextPath }/joinboard/edit.do?num=${vo.num}" class="btn btn-warning">이 글 수정</a>
		</c:if>
		<div class="comments">
			<h3>댓글</h3>
			<c:forEach var="co" items="${clist }">
			<div class="comment">
				<p class="author">${co.user_id }</p>
				<p class="date">작성일자: ${co.date }</p>
				<p class="content">${co.content }</p>
			</div>
			</c:forEach>
			<form action="${pageContext.request.contextPath }/comment/add.do" method="get" class="comment-form">
				<h3>댓글 작성</h3>
				<div class="form-group">
					<label for="name">게시물 번호</label> <input type="text" value="${vo.num}" class="form-control" name="num" id="name" readonly>
				</div>
				<div class="form-group">
					<label for="name">작성자</label> <input type="text" value="${sessionScope.loginId}" class="form-control" name="name" id="name" readonly>
				</div>
				<div class="form-group">
					<label for="comment">내용</label>
					<textarea class="form-control" id="comment" name="content"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">작성하기</button>
			</form>
		</div>
	</div>
	<!-- 부트스트랩 JS 파일 링크 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>