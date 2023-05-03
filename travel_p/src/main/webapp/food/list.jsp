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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <title>웹사이트</title>
    
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
 	
<style type="text/css">

.head-container{
    background: rgb(216, 216, 216);
    text-align: center;
   	padding-top: 130px;
}

.head-date{
    color: rgb(114, 114, 114);
    font-weight: 100;
    font-size: 13px;
    margin-bottom: 20px;
}
.head-title {
    font-weight: 600;
    font-size: 30px;
    color: rgb(65, 65, 65);
    margin-bottom: 20px;
}
.head-summary{
    color: rgb(114, 114, 114);
    font-weight: 400;
    font-size: 15px;
    font-weight: bold;
}

.main-container {
    display: flex;
    justify-content: center;
    flex-direction: column;
    flex-wrap: wrap;
    align-items: center;
}
.main-card{
    display:flex;
    justify-content: center;
    padding: 30px 0px;
    border-bottom: 2px solid rgb(170, 170, 170);

    width: 750px;
    border-width: 30%;
}
.card-photo{
    width: 250px;
    height: 250px;
}
.card-photo-img{
    width: 100%;
}
.card-content{
    padding: 0px 20px;
    width: 460px;
    height: 250px;
    word-wrap: break-word;
}
.card-content-title{
    color:rgb(59, 59, 59);
    font-size: 22px;
}
.card-content-address{
    margin: 7px 0px;
    color:rgb(80, 80, 80);
    font-size: 12px;
}
.card-content-review{
    color:rgb(31, 31, 31);
    font-size: 12px;
    height: 150px;
    overflow: scroll;
    display: -webkit-box;
    -webkit-line-clamp: 8;
    -webkit-box-orient: vertical;
}
.card-content-button{
    margin-top: 8px;
    text-align: right;
}
.card-content-button button {
    border: none;
    background-color: transparent;
    font-size: 11px;
    color: rgb(71, 71, 71);
    cursor: pointer;
    transition: 0.2s;
}
.card-content-button button:hover {
    color:red;
    border: 1px solid red;
    border-radius: 15px;
}

.nickname{
    
}

footer video {
  position: absolute; 
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover; /* 동영상 크기에 맞게 자동으로 늘리기 */
}
    </style>
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
		

   		<main>
        <div class="head-container">
            <div class="head-title">
                <p style="font-family: KCC-간판체; font-size: 42px; color: #3a3b1c;">
                <img src="../assets/images/food.png" style="width:55px; margin: 7px;">전국 8도 맛집 베스트 50곳</p>
            </div>
            <p class="head-summary">
                "k-매운맛부터 한식에 이렇게 실력있는 맛집이 많았다고?!"
            </p>
        </div>
        <c:forEach var="vo" items="${list }">
        <div class="main-container" style="margin-top: 60px;">
            <div class="main-card">
                <div class="card-photo">
                    <img class="card-photo-img" src="${vo.pic1 }">
                </div>
                <div class="card-content">
                    <div class="card-content-title">
                        <p style="font-family: KCC-간판체; font-size: 19px; color: #4e5d6b;">
                        ${vo.num }. ${vo.name }
                        </p>
                    </div>
                    <div class="card-content-address">
                        <p>${vo.address }</p>
                    </div>
                    <div class="card-content-review">
                        <p><b class="nickname">[전화번호=> ${vo.phone}]</b> ${vo.content}</p>
                    </div>
                    <div class="card-content-button">
                        <button>${vo.name } 더보기 ></button>
                    </div>
                </div>
            </div>
            </div>
            </c:forEach>
            <div class="container">
            <div>
            
            </div>
            </div>
            
            </main>
            
            
       <!-- 	바닥글 -->
 <footer style="position: relative; margin-top: 200px;">
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
            
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>            
</body>
</html>