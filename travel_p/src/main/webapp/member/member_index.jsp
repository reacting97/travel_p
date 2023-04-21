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
<tr><td colspan ="5"><h3>Test</h3></td></tr>
<tr>
<td><a href="${pageContext.request.contextPath }/member/join.do">회원가입</a></td>
<td><a href="${pageContext.request.contextPath }/member/login.do">로그인</a></td>
<td><a href="${pageContext.request.contextPath }/member/edit.do?id=${sessionScope.loginId}">내정보확인</a></td>
<td><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></td>
<td><a href="${pageContext.request.contextPath }/member/del.do?id=${sessionScope.loginId}">탈퇴</a></td>
</tr>
</table>
<div id="body">
${msg }
</div>
</body>
</html>