<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>글 목록</title>
  <!-- 부트스트랩 스타일시트 링크 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
  <div class="container">
    <h1 class="my-5">여행기록글 목록</h1> <a href="${pageContext.request.contextPath }/recordboard/add.do">추가</a>
    <a href="${pageContext.request.contextPath }/index.jsp">메인페이지</a>
    <div class="row">
    <c:forEach var="vo" items="${list }">
      <div class="col-md-6">
        <div class="card mb-3">
          <div class="card-body">
            <h5 class="card-title">글번호:${vo.num } 제목:${vo.title }</h5>
            <p class="card-text">${vo.content }</p>
            <a href="${pageContext.request.contextPath}/recordboard/detail.do?num=${vo.num}" class="btn btn-primary">상세페이지</a>
          </div>
        </div>
      </div>
     </c:forEach>
    </div>
  </div>
  <!-- 부트스트랩 자바스크립트 링크 -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>