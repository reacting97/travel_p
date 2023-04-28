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
<script type="text/javascript">
function likey2(num){
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function(){
		let val = xhttp.responseText;
		let arr = JSON.parse(val);
		let html = '';
		html = arr.cnt;
		let res = document.getElementById("likenum");
		res.innerHTML = html;//responseText: 서버로부터 받은 응답값
	}
	
	let param = "?recommandnum=" + num;
	param += "&writer=${sessionScope.loginId}";
	//요청 전송방식, 서버페이지 url 설정. get방식인 경우 url뒤에 파람 붙임
	xhttp.open("GET", "${pageContext.request.contextPath}/recommandboard/likeup.do"+param);
	xhttp.send();
}
</script>
</head>
<body>
	<div class="container">
		<div class="post">
			<h2>${vo.title } <button type="button" class="btn btn-primary" onclick="likey2(${vo.num})">좋아요</button><span id="likenum">${cnt }</span></h2>
			<p class="date">작성일자: ${vo.w_date}</p>
			<div class="post-content">
				<p>${vo.content } ${sessionScope.loginId} ${vo.writer }</p>
				<div class="images">
					<img src="${vo.pic1 }" alt="이미지 1">
					<img src="${vo.pic2 }" alt="이미지 2">
				</div>
			</div>

		</div>
		<a href="${pageContext.request.contextPath }/recommandboard/list.do" class="btn btn-warning">여행기록게시판 리스트로 이동</a>
		<c:if test="${sessionScope.loginId eq vo.writer }">
			<a href="${pageContext.request.contextPath }/recommandboard/del.do?num=${vo.num}" class="btn btn-warning">이 글 삭제</a>
		</c:if>
	</div>
	<!-- 부트스트랩 JS 파일 링크 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>