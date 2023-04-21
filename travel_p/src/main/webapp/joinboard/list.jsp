<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>자료실</h3>
<table border="1">
<tr><th>title</th><th>writer</th><th>다운수</th></tr>
<c:forEach var="vo" items="${list }">
<tr><td><a href="${pageContext.request.contextPath }/joinboard/detail.do?num=${vo.num }">${vo.title }</a></td>
<td>${vo.writer }</td><td>${vo.cnt }</td></tr>
</c:forEach>
</table>
</body>
</html>