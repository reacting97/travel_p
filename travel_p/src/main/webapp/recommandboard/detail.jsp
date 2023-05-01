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
<title>게시판 상세보기</title>
 	<link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    
    
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 부트스트랩 CSS 파일 링크 -->

<style>
/* CSS 코드 */

.sub-head-1{ 
	height:130px; 
 	background-color: #D3D3D3; 
}

.post { 
	background-color: #fff; 
 	border: 1px solid #ddd; 
 	border-radius: 20px; 
 	padding: 15px; 
 	box-shadow: 2px 2px 5px #ccc; 
 } 

 .post h2 { 
 	margin-top: 0; 
 	margin-bottom: 10px; 
 	border-bottom: 1px solid #ddd; 
 	padding-bottom: 10px; 
	color: #333; 
 	font-size: 24px; 
 	font-weight: bold; 
	text-transform: uppercase; 
 } 

 .post .date { 
 	font-size: 14px; 
 	color: #888; 
 	margin:0;
 	margin-left:20px;
 	font-weight:bold;
} 

.post-content { 
	border: 1px solid #ddd; 
	border-radius: 4px; 
	padding: 15px; 
	margin-top: 20px; 
 	box-shadow: 2px 2px 5px #ccc; 
	line-height: 1.8; 
	font-size: 16px; 
	color: #555; 
 } 

.comments { 
	margin-top: 20px; 
} 

 .comment { 
 	background-color: #f8f9fa; 
	border: 1px solid #ddd; 
 	border-radius: 4px; 
	padding: 15px; 
 	margin-bottom: 20px; 
 	box-shadow: 2px 2px 5px #ccc; 
 } 

 .comment .author { 
 	font-size: 16px; 
	font-weight: bold; 
	margin-top: 0; 
 } 

 .comment .date { 
 	font-size: 14px; 
	color: #888; 
	margin-top: 5px; 
 } 

 .comment .content { 
 	margin-top: 10px; 
 	font-size: 16px; 
 	color: #555; 
 } 

 .comment-form { 
 	margin-top: 50px; 
 } 

.comment-form label { 
 	font-weight: bold; 
 } 

 .comment-form .form-group { 
 	margin-bottom: 20px; 
 } 

 .comment-form textarea { 
 	height: 150px; 
 	font-size: 16px; 
	color: #555; 
} 

.img-style{ 
 	display: flex; 
	justify-content: space-around; 
} 

.pic{ 
	border: 1px solid #ddd; 
	width:50%; 
	height:500px;
} 

.detail-title{
	width: 100%;
    word-break: break-word;
}

.detail-content{
	border: 1px solid #ddd;
    margin-top: 30px;
    margin-left: 20px;
    margin-right: 20px;
    margin-bottom: 30px;
    width: auto;
    height: 200px;
    word-break: break-all;
    box-shadow: 2px 2px 5px #ccc;
    border-radius: 5px;
}

.detail-content2{
	margin-top: 10px;
    margin-left: 1rem;
    margin-right: 1rem;
	font-size: 15px;
    font-weight: 900;
    color: #6c757d;
}


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
	  $(".board").click(function(){
	    $(".hideboard").slideToggle("slow");
	  });
	  $(".drop").click(function(){
	    $(".ranking").slideToggle("slow");
	  });
	});
	</script>

<script type="text/javascript">
function likey2(num){
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function(){
		let val = xhttp.responseText;
		let arr = JSON.parse(val);
		let html = '';
		html = arr.cnt;
		let res = document.getElementById("likenum");
		res.innerHTML = html;//responseText: 서버로부터 받은 응답값
	}
	
	let param = "?recommandnum=" + num;
	param += "&writer=${sessionScope.loginId}";
	//요청 전송방식, 서버페이지 url 설정. get방식인 경우 url뒤에 파람 붙임
	xhttp.open("GET", "${pageContext.request.contextPath}/recommandboard/likeup.do"+param);
	xhttp.send();
}
</script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body style="background-color:#F0FFFF">
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
                        <a href="#" class="board">Board</a>
                        <ul class="hideboard">
							<li class="board-li" ><a href="${pageContext.request.contextPath }/recommandboard/list.do" id="board-li-a">추천게시판</a>
    						<li class="board-li"><a href="${pageContext.request.contextPath }/recordboard/list.do" id="board-li-a">관광일기</a>
    						<li class="board-li"><a href="${pageContext.request.contextPath }/joinboard/list.do" id="board-li-a">같이가자!</a>
  	 					 </ul>
  	 					 </li>
                       
                        <c:if test ="${empty sessionScope.loginId }">
                        <li><a href="${pageContext.request.contextPath }/member/login.do">Login</a></li>
                        </c:if>
                        <c:if test ="${not empty sessionScope.loginId }">
                         <li><a href="${pageContext.request.contextPath }/recommandboard/add.do">Let's recommend</a></li>
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
  
  	<nav class="sub-head-1">
  <div class="container-fluid" style="display: flex;
    flex-wrap: inherit;
    justify-content: center;
    font-size: -webkit-xxx-large;
    margin-top: 70px">
    <span class="navbar-brand mb-0 h1" style="font-size:-webkit-xxx-large; padding-top:70px; font-family: KCC-간판체 ">
    추천 곡!곡!</span>
  </div>
	</nav>
  
  
  
  
	<nav style="padding-top:90px">
	<div class="container" style="width:55%;">
		<div class="post">
			<div>
			<span style="display:flex; justify-content: flex-end; margin:10px 20px">
				<button type="button"  onclick="likey2(${vo.num})" style= "background-color: transparent; border: none">
				<img src="../assets/images/like.png" style="width:30px; height:30px; background-color: transparent"></button>
				<span id="likenum" style="font-size:18px">${cnt }</span></span></div>
			<div class="detail-title">
			<h2 style="display: flex; justify-content: space-between;padding-left: 20px; padding-right: 20px; font-size:x-large; font-family: KCC-간판체">제목 : ${vo.title }
			</h2></div>
			<p class="date">작성자: ${vo.writer} </p>
			<p class="date"> 작성일: ${vo.w_date}</p>
			<div class="post-content">
				<div class="images">
					<div class="img-style">
					<img src="${vo.pic1 }" alt="이미지 1" class="pic" >
					<img src="${vo.pic2 }" alt="이미지 2" class="pic" >
					</div>
					<div class="detail-content">
					<p class="detail-content2">${vo.content } </p>
					</div>
				</div>
			</div>
		</div>
		<a href="${pageContext.request.contextPath }/recommandboard/list.do" class="btn btn-warning">여행기록게시판 리스트로 이동</a>
		<c:if test="${sessionScope.loginId eq vo.writer }">
			<a href="${pageContext.request.contextPath }/recommandboard/edit.do?num=${vo.num}" class="btn btn-warning">이 글 수정</a>
			<a href="${pageContext.request.contextPath }/recommandboard/del.do?num=${vo.num}" class="btn btn-warning">이 글 삭제</a>
		</c:if>
	</div>
	</nav>
	
	
	<!-- 	바닥글 -->
 <div class="call-to-action">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <h2>Are You Looking To Travel ?</h2>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © 2023 1조 관광곡곡 Travel Company. All rights reserved. 
          <br>From: 이주원 전준하 남영우 장하은</p> 
        </div>
      </div>
    </div>
  </footer>
	
	
	<!-- 부트스트랩 JS 파일 링크 -->
</body>
</html>