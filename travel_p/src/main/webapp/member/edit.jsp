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

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>해보자고</title>

    <!-- Bootstrap core CSS -->

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
 
    
<!--

TemplateMo 580 Woox Travel

https://templatemo.com/tm-580-woox-travel

-->
<script src="https://kit.fontawesome.com/df89dafb93.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
	  $(".board").click(function(){
	    $(".hideboard").slideToggle("slow");
	  });
	  $(".drop").click(function(){
	    $(".msg-detail").slideToggle("slow");
	  });
	  $('.msg-content').click(function(){
		  console.log($(this).attr('num'));
		  $.ajax({
			 method:'get',
			 url:'${pageContext.request.contextPath }/msg/del.do',
			 data:{'num' : $(this).attr('num'), 'id' : '${sessionScope.loginId}'},
			 success: function(data) {
				 if(data == 'true'){
					$(this).remove();
					alert(${msg})
				 }else{
					 alert(${msg})
				 }
				
			 }, error : function(request, status, error){
				 alert("status : "+request.status +"\n\n error : "+error);
				 
			 }
		  });
	  });
	  
	  $('.btn-danger').click(function() {
		  if(confirm("이 글의 좋아요를 취소하시겠습니까?")){
			  let li = $(this).closest('li');
			  $.ajax({
					 method:'get',
					 url:'${pageContext.request.contextPath }/recommandboard/likeup.do',
					 data:{'recommandnum' : $(this).attr('num'), 'writer' : '${sessionScope.loginId}'},
					 success: function(data) {
						 li.remove();
					 }, error : function(request, status, error){
						 alert("status : "+request.status +"\n\n error : "+error);
						 
					 }
				  });
		  } else {}
		  
	  });
	});
	</script>
 <style type="text/css">
 
 .sub-head-1 {
    height: 130px;
    background-color: #D3D3D3;
}
 
 .mypage-card{
	color:blue;
	text-align:center;
}
 .card{
 	display: inline-block;
 }
 .myinfo{
 	display:inline-block;
 	
 }
 
 .edit-img{
 	width:20px;
 	height:20px;
 }
 
 input{
    	background-img : url("../assets/images/edit.png");
    	background-repeat: no-repeat;
        backgroupd-size : 50px;
    }
 .card:hover{
 	transform:none;
 }   
 .mylike{
 	position: absolute;
    width: 30%;
    margin-top: 335px;
 }   
 
 .myinfo-detail{
 	display: flex;
    flex-direction: column;
 }
 
 .myinfo-detail:hover{
 	transform:none;
 }
 
 .message{
 	display: flex;
    position: relative;
    float: right;
    right: -160px;
    top:50px;
 
 }
 
 
 .msg-banner{
 	display: flex;
    flex-direction: column;
    z-index: 2;
 }
 
 .drop{
 	width: 90px;
    height: 110px;
    border: none;
    background-color: transparent;
 }
 .msg-detail{
 	border: 1px solid gray;
    border-radius: 20px;
    width: 420px;
    height: auto;
    word-break: break-all;
   	display:none;
 }
 
 
 .msg-content{
 	margin-bottom: 12px;
    border-bottom: 1px dashed #80808087;
    margin-top: 10px;
    margin-right: 10px;
 }
 
 .fav-content{
 	display: flex;
    justify-content: space-between;
    border-bottom: 1px dashed;
    margin-left: -30px;
    margin-bottom: 10px;
 }
 
 .trash-btn{
 	border: none;
    background-color: transparent;
    
 }
 
 .trash-btn {
  display:inline-block;
  position: relative;
  transition-duration: $defaultDuration;
  transition-property:transform;

  @include hideTapHighlightColor();
  @include hardwareAccel();
  @include improveAntiAlias();

  &:before {
    pointer-events: none;
    position: absolute;
    z-index: -1;
    content: '';
    top: 100%;
    left: 5%;
    height: 10px;
    width: 90%;
    opacity: 0;
    background: radial-gradient(ellipse at center, rgba(0,0,0,.35) 0%,rgba(0,0,0,0) 80%); /* W3C */
    transition-duration:$defaultDuration;
    transition-property:transform opacity;
  }

  &:hover {
    transform: translateY(-5px); /* move the element up by 5px */

   &:before {
      opacity: 1;
      transform:translateY(5px); /* move the element down by 5px (it will stay in place because it's attached to the element that also moves up 5px) */
    }
  }
}

.edit-del{
	display: flex;
    margin-right: 5px;
   	justify-content: flex-end;
    flex-direction: row;
}

#edit-btn:hover{
	text-shadow: 0 0 0.1em, 17px 20px 0.3em;
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
</head>
<body style="background-color: #14ed5d0d;">
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
  		
  		
  
  	<nav class="sub-head-1">
  <div class="container-fluid" style="display: flex;
    flex-wrap: inherit;
    justify-content: center;
    font-size: -webkit-xxx-large;
    margin-top: 70px">
    <span class="navbar-brand mb-0 h1" style="font-size:-webkit-xxx-large; padding-top:70px; font-family: KCC-간판체 ">
    My page</span>
  </div>
	</nav>
	
<!-- 	메세지 -->
	
	
	
	<div class="container" style="justify-content:flex-start; display: flex; margin-top: 80px;">
	
		<div class="card myinfo" style="margin:70px; background-color: beige; width: 25%; margin-top: 50px;">
  			<img src="../assets/images/myinfo.png" class="card-img-top" alt="...">
  		<div class="card-body">
   				 <p class="card-text mypage-card" >안녕하세요! <br/> ${sessionScope.loginId } 님 </p>
  		</div>
	</div>
	
	<div class="myinfo-detail">
	<form action="${pageContext.request.contextPath }/member/edit.do" method="post" style="height:100%; width:130%; margin:50px; margin-left: 0;">
	<div class="card myinfo" style="width: 100%; height:42%;">
  <ul class="list-group list-group-flush">
   <li> 
   <div class="input-group flex-nowrap">
  <span class="input-group-text" id="addon-wrapping" style="width: 100px; background-color: beige;">ID</span>
  <input type="text" class="form-control" name="id" value="${vo.id }" aria-describedby="addon-wrapping" style="background-image: none;" readonly >
	</div>
	</li>

  <li> 
  <div class="input-group flex-nowrap">
  <span class="input-group-text" id="addon-wrapping" style="width: 100px; background-color: beige;">Password</span>
  <input type="text" class="form-control" name="pwd" value="${vo.pwd }" aria-describedby="addon-wrapping" >
	</div>
	</li>

   <li>
   <div class="input-group flex-nowrap">
  <span class="input-group-text" id="addon-wrapping" style="width: 100px; background-color: beige;">Name</span>
  <input type="text" class="form-control" name="name" value="${vo.name }" aria-describedby="addon-wrapping">
	</div>
	</li>

	  <li>
    <div class="input-group flex-nowrap">
 	 <span class="input-group-text" id="addon-wrapping" style="width: 100px; background-color: beige;">Email</span>
 	 <input type="email" class="form-control" name="email" value="${vo.email }" aria-describedby="addon-wrapping" >
	</div>
	</li>

    <li>
    <div class="input-group flex-nowrap">
  	<span class="input-group-text" id="addon-wrapping" style="width: 100px; background-color: beige;">Phone</span>
  	<input type="tel" class="form-control" name="phone" value="${vo.phone }" aria-describedby="addon-wrapping" >
	</div>
	</li>
  	<li class="edit-del">
	<button type="submit" class="btn btn-link" id="edit-btn" style="text-decoration: none; color: #472b2bbd; font-weight: bold; " >수정하기</button>
	<button type="button" class="btn btn-link" id="edit-btn" onclick="javascript:location.href='${pageContext.request.contextPath }/member/del.do?id=${sessionScope.loginId}'"
	style="text-decoration: none; color: #472b2bbd; font-weight: bold;">탈퇴</button>
 	</li>
 	
  </ul>
 	</div>
  </form>
  
 	<div class="accordion mylike" id="accordionPanelsStayOpenExample" ">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
       <img src="../assets/images/like.png" style='width:20px; margin-right:10px'>나의 좋아요 
      </button>
    </h2>
    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
      <div class="accordion-body">
        <ul class="">
			<c:forEach var="fav" items="${favlist }">
				<li class="fav-content" id="fav_${fav.num }" num=${fav.num }>${fav.writer} 제목: ${fav.title }
					<button type="button" num=${fav.num } class="trash-btn"><img src="../assets/images/trash.png" style="width:20px; margin-bottom: 5px;">삭제</button>
				</li>
			</c:forEach>
			</ul>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
       <img src="../assets/images/write.png" style='width:20px; margin-right:10px'>내 노트
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
      <div class="accordion-body">
      	
      </div>
    </div>
  </div>
	</div>
</div>
	<div class="message" >
 	<span class="msg-banner">
  			<button class="drop"><img src="../assets/images/chat.png">
  			<p style="font-size: 16px; width: 80px; display: flex; align-items: center;}">메세지 ${cnt }개</p></button>
			<ul class="msg-detail">
			<c:forEach var="vo2" items="${mlist }">
				<li class="msg-content" num=${vo2.num }>${vo2.content }</li>
				
			</c:forEach>
			</ul>  		
  		</span>
  		</div>
</div>
	
	
	
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