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
   <link rel="stylesheet" href="../assets/css/fontawesome.css">
       <link rel="stylesheet" href="../assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
 
   
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
     <script type="text/javascript">

 	$(document).ready(function(){
 	  $(".board").click(function(){
 	    $(".hideboard").slideToggle("slow");
 	  });
 	 });
     
 	</script>
  
  
  
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
<style type="text/css">

footer video {
  position: absolute; 
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover; /* 동영상 크기에 맞게 자동으로 늘리기 */
}
</style>  
 
  <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>

	 <header class="header-area header-sticky">
    <div class="container head-nav">
        <div class="row head-nav-sub">
            <div class="col-12 head-nav-sub2">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="../index.jsp" class="logo">
                        <img src="../assets/images/bangbang.png" class="main-logo" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="../index.jsp" class="active">Home</a></li>
                        <li>
                        <a class="board">Board</a>
                         <ul class="hideboard">
							<li class="board-li" ><a href="${pageContext.request.contextPath }/recommandboard/list.do" id="board-li-a">추천게시판</a>
    						<li class="board-li"><a href="${pageContext.request.contextPath }/recordboard/list.do" id="board-li-a">관광일기</a>
    						<li class="board-li"><a href="${pageContext.request.contextPath }/joinboard/list.do" id="board-li-a">같이가자!</a>
  	 					 </ul>
  	 					 </li>
                        <li><a href="${pageContext.request.contextPath }/food/list.do">Michelin</a></li>
                        <c:if test ="${empty sessionScope.loginId }">
                        <li><a href="${pageContext.request.contextPath }/member/login.do">Login</a></li>
                        </c:if>
                        <c:if test ="${not empty sessionScope.loginId }">
                        <li><a href="${pageContext.request.contextPath }/member/logout.do">Logout</a></li>
                        <li><a href="${pageContext.request.contextPath }/member/edit.do?id=${sessionScope.loginId}" style="padding-top:6px">${sessionScope.loginId } 님 <img src="../assets/images/myinfo.png" class="myinfo-icon"></a>
                        </li>
                        </c:if>
                    </ul>   
                    
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
<!--                 <div class="container hide-position" style="text-align: center"> -->
             
<!--   	 			</div>		  -->
            </div>
        </div>
    </div>
  </header>




  <div class="container mt-5" style=" padding-top: 100px;">
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
  
  
  <footer style="position: relative; margin-top: 500px;">
  	<div class="call-to-action" style="height: 140px; margin-top:0">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
        </div>
      </div>
    </div>
  </div>
	<video muted autoplay loop id="background-video" >
      <source src="../assets/images/sea.mp4" type="video/mp4">
      <strong>Your browser does not support the video tag.</strong>
   	 </video>
 
    <div class="container" style="position: relative;">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © 2023 1조 관광곡곡 Travel Company. All rights reserved. 
          <br>From: 이주원 전준하 남영우 장하은</p> 
        </div>
      </div>
    </div>
  </footer>

  <!-- jQuery, Popper.js, Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
          integrity="sha384-OY6Mz7Vj46r6X9hZk76LKZnB04s2pz4ZhInhTUVe1jKklUGnmeS/UcSLX9kCCNYk"
          crossorigin="anonymous"></script>
  	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script> 
</body>
</html>
