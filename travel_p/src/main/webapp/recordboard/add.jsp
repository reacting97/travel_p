<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h3>글작성</h3>
<form action="${pageContext.request.contextPath }/recordboard/add.do" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>작성자</th><td><input type="text" name="writer" value="${sessionScope.loginId }"></td></tr>
<tr><th>제목</th><td><input type="text" name="title"></td></tr>
<tr><th>글내용</th><td><textarea rows="10" cols="30" name="content"></textarea></td></tr>
<tr><th>가격</th><td><input type="text" name="price"></td></tr>
<tr><th>사진1</th><td><input type="file" name="file1"></td></tr>
<tr><th>사진2</th><td><input type="file" name="file2"></td></tr>
<tr><th>사진3</th><td><input type="file" name="file3"></td></tr>
<tr><th>작성</th><td><input type="submit" value="저장"></td></tr>
</table>
</form>
</body>
</html>