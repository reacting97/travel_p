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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>이미지 게시판</h3>
	<input type="button" value="글작성"
		onclick="location.href='${pageContext.request.contextPath}/recordboard/add.do'">
	<input type="button" value="홈화면" 
		onclick="location.href='${pageContext.request.contextPath}/index.jsp'">

	<c:forEach var="vo" items="${list}">
		<table border="1">
			<tr>
				<th>num</th>
				<td>${vo.num}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.writer}</td>
			</tr>
			<tr>
				<th>글제목</th>
				<td>${vo.title}</td>
			</tr>
			<tr>
				<th>content</th>
				
			</tr>
			<tr>
				<th>price</th>
				<td>${vo.price}</td>
			</tr>
			<tr>
				<th>image</th>
				<td><img src="${vo.pic1}"
					style="width: 200px; height: 200px" name=img></td>
			</tr>
			<tr>
				<th>image</th>
				<td><img src="${vo.pic2}"
					style="width: 200px; height: 200px" name=img></td>
			</tr>
			<tr>
				<th>image</th>
				<td><img src="${vo.pic3}"
					style="width: 200px; height: 200px" name=img></td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>