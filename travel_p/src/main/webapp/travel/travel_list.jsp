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
	<table border="1">
		<c:forEach var="travel" items="${list }">
			<tr>
				<td>${travel.id}</td>
				<td><a href="${pageContext.request.contextPath }/travel/detail.do?num=${travel.id }">${travel.name}</a></td>
				<td>${travel.address}</td>
				<td>${travel.phone}</td>
				<td>${travel.content}</td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>