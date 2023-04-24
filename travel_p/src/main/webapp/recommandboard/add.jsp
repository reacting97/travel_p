<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>추천글 올리기</h3>
<form action="${pageContext.request.contextPath }/recommandboard/add.do" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>작성자</th><td><input type="text" name="writer" value="${sessionScope.loginId }" readonly></td></tr>
<tr><th>제목</th><td><input type="text" name="title"></td></tr>
<tr><th>내용</th><td><input type="text" name="content"></td></tr>
<tr><th>사진1</th><td><input type="file" name="file1"></td></tr>
<tr><th>사진2</th><td><input type="file" name="file2"></td></tr>
<tr><th>업로드</th><td><input type="submit" value="저장"></td></tr>
</table>
</form>
</body>
</html>