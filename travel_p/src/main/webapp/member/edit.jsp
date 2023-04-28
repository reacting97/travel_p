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
	    $(".ranking").slideToggle("slow");
	  });
	});
	</script>
 <style type="text/css">
 
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
    
 </style>
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
                        <a href="#" class="board">Board</a>
                         <ul class="hideboard">
							<li class="board-li" ><a href="${pageContext.request.contextPath }/recommandboard/list.do" id="board-li-a">추천게시판</a>
    						<li class="board-li"><a href="${pageContext.request.contextPath }/recordboard/list.do" id="board-li-a">관광일기</a>
    						<li class="board-li"><a href="${pageContext.request.contextPath }/joinboard/list.do" id="board-li-a">같이가자!</a>
  	 					 </ul>
  	 					 </li>
                        <li><a href="#">Deals</a></li>
                        <c:if test ="${empty sessionScope.loginId }">
                        <li><a href="${pageContext.request.contextPath }/member/login.do">Login</a></li>
                        </c:if>
                        <c:if test ="${not empty sessionScope.loginId }">
                        <li><a href="${pageContext.request.contextPath }/member/logout.do">Logout</a></li>
                        <li><a href="#" style="padding-top:6px">${sessionScope.loginId } 님 <img src="../assets/images/myinfo.png" class="myinfo-icon"></a>
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
  
  
  	<nav class="navbar bg-body-tertiary" style="height:190px">
  <div class="container-fluid" style="display: flex;
    flex-wrap: inherit;
    justify-content: center;
    font-size: -webkit-xxx-large;
    margin-top: 111px">
    <span class="navbar-brand mb-0 h1" style="font-size:-webkit-xxx-large">My page</span>
  </div>
	</nav>
	
	<div class="container" style="justify-content:flex-start; display: flex">
		<div class="card myinfo" style="margin:50px">
  <img src="../assets/images/myinfo.png" class="card-img-top" alt="...">
  <div class="card-body">
    <p class="card-text mypage-card" >안녕하세요! <br/> ${sessionScope.loginId } 님 </p>
  </div>
</div>
<form action="${pageContext.request.contextPath }/member/edit.do" method="post" style="height:100%; width:100%; margin:50px">
	<div class="card myinfo" style="width: 100%; height:100%">
  <ul class="list-group list-group-flush">
   <li> 
   <div class="input-group flex-nowrap">
  <span class="input-group-text" id="addon-wrapping" style="width: 100px">ID</span>
  <input type="text" class="form-control" name="id" value="${vo.id }" aria-describedby="addon-wrapping" style="background-image: none;" readonly >
	</div>
	</li>

  <li> 
  <div class="input-group flex-nowrap">
  <span class="input-group-text" id="addon-wrapping" style="width: 100px">Password</span>
  <input type="text" class="form-control" name="pwd" value="${vo.pwd }" aria-describedby="addon-wrapping" >
	</div>
	</li>

   <li>
   <div class="input-group flex-nowrap">
  <span class="input-group-text" id="addon-wrapping" style="width: 100px">Name</span>
  <input type="text" class="form-control" name="name" value="${vo.name }" aria-describedby="addon-wrapping">
	</div>
	</li>

	  <li>
    <div class="input-group flex-nowrap">
 	 <span class="input-group-text" id="addon-wrapping" style="width: 100px">Email</span>
 	 <input type="email" class="form-control" name="email" value="${vo.email }" aria-describedby="addon-wrapping" >
	</div>
	</li>

    <li>
    <div class="input-group flex-nowrap">
  	<span class="input-group-text" id="addon-wrapping" style="width: 100px">Phone</span>
  	<input type="tel" class="form-control" name="phone" value="${vo.phone }" aria-describedby="addon-wrapping" >
	</div>
	</li>
  
	<button type="submit" class="btn btn-link" style="display:flex; flex-direction:row-reverse; text-decoration:none">수정하기</button>
  </ul>
 
</div>
	 
  </form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>