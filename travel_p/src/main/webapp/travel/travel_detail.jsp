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
		<tr>
			<th>번호</th>
			<td>${travel.id }</td>
		</tr>
		<tr>
			<th>관광지명</th>
			<td>${travel.name }</td>
		</tr>
		<tr>
			<th>도로명 주소</th>
			<td>${travel.address }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${travel.phone }</td>
		</tr>
		<tr>
			<th>관광지 설명</th>
			<td>${travel.content }</td>
		</tr>
		<tr>
			<th>위도 / 경도</th>
			<td>${latitude } / ${longtitude }</td>
		</tr>
	</table>
	<table border="1">
		<c:forEach var="food" items="${foodList }">
			<tr>
				<td>${food.name} </td>
				<td>${food.address} </td>
				<td>${food.phone} </td>
			</tr>
		</c:forEach>
	</table>
	
	<table border="1">
		<c:forEach var="tra" items="${travelList}">
			<tr>
				<td>${tra.name }</td>
				<td>${tra.address }</td>
				<td>${tra.phone }</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>