<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${pageContext.request.contextPath }/recordboard/list.do">여행기록리스트</a>
<a href="${pageContext.request.contextPath }/recommandboard/list.do">추천글리스트</a>
<a href="${pageContext.request.contextPath }/recommandboard/list.do">추천글리스트</a>
<a href="${pageContext.request.contextPath }/member/login.do">로그인</a>
<a href="${pageContext.request.contextPath }/member/edit.do?id=${sessionScope.loginId}">내정보확인</a>
<a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
</body>
</html>