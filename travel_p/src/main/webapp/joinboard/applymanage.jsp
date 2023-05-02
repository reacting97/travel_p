<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>신청관리</title>
  <script type="text/javascript">
  function aaa(num, id){
		const xhttp = new XMLHttpRequest();
		
		xhttp.onload = function(){
			let val = xhttp.responseText;
			let arr = JSON.parse(val);
			alert(arr.msg2);
		}
		let param = "?num=" + num;
		param += "&master=${sessionScope.loginId}";
		param += "&id="+id;
		//요청 전송방식, 서버페이지 url 설정. get방식인 경우 url뒤에 파람 붙임
		xhttp.open("GET", "${pageContext.request.contextPath }/joinboard/accept.do"+param);
		xhttp.send();
	}
  
  function bbb(num, id){
		const xhttp = new XMLHttpRequest();
		
		xhttp.onload = function(){
			let val = xhttp.responseText;
			let arr = JSON.parse(val);
			alert(arr.msg2);
		}
		let param = "?num=" + num;
		param += "&master=${sessionScope.loginId}";
		param += "&id="+id;
		//요청 전송방식, 서버페이지 url 설정. get방식인 경우 url뒤에 파람 붙임
		xhttp.open("GET", "${pageContext.request.contextPath }/joinboard/reject.do"+param);
		xhttp.send();
	}
  </script>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-5">
    <h1 class="mb-4">신청관리</h1>
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th>회원아이디</th>
          <th>게시판번호</th>
          <th>승인</th>
          <th>거절</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="vo" items="${list }">
        <tr>
          <td>${vo.party_member }</td>
          <td>${vo.party_board }</td>
          <td><button class="btn btn-success" onclick="aaa('${vo.party_board }','${vo.party_member }')">승인</button></td>
          <td><button class="btn btn-danger" onclick="bbb('${vo.party_board }','${vo.party_member }')">거절</button></td>
        </tr>
       </c:forEach>
        <!-- 추가적인 행은 여기서 작성 -->
      </tbody>
    </table>
  </div>

  <!-- jQuery, Popper.js, Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
          integrity="sha384-OY6Mz7Vj46r6X9hZk76LKZnB04s2pz4ZhInhTUVe1jKklUGnmeS/UcSLX9kCCNYk"
          crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
