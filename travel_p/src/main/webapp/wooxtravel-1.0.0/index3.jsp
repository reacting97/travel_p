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
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
 
    
<!--

TemplateMo 580 Woox Travel

https://templatemo.com/tm-580-woox-travel

-->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<style type="text/css">
.col-3{
	margin-top: 10px;
	margin-bottom: 10px;
}
.card img {
    height: 13rem;
    object-fit: cover;
}
.hi
</style>

<script type="text/javascript">
	
	$(document).ready(function(){
	  $(".board").click(function(){
	    $(".hideboard").slideToggle("slow");
	  });
	  $(".drop").click(function(){
	    $(".ranking").slideToggle("slow");
	  });
	});
	
	
	
	$(document).ready(function() {
		  $('.slider').each(function() {
		    var slides = $(this).find('.slide');
		    var currentSlide = 0;
		    var interval = setInterval(nextSlide, 3000);
		    
		    $(this).hover(function() {
		      clearInterval(interval);
		    }, function() {
		      interval = setInterval(nextSlide, 3000);
		    });
		    
		    function nextSlide() {
				  slides.eq(currentSlide).fadeOut(500, function() {
				    $(this).css('display', 'none');
				  });
				  currentSlide = (currentSlide + 1) % slides.length;
				  slides.eq(currentSlide).css('display', 'block').hide().fadeIn(500);

				  if (currentSlide === 0) {
				    slides.eq(slides.length - 1).css('display', 'block');
				  }
				}
		  	});
			});
	
		</script>
  
  </head>

<body>

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->
<!-- 	상단바 -->
  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container head-nav">
        <div class="row head-nav-sub">
            <div class="col-12 head-nav-sub2">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="index.html" class="logo">
                        <img src="assets/images/bangbang.png" class="main-logo" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="index.html" class="active">Home</a></li>
                        <li>
                        <a href="#" class="board">Board</a>
                        </li>
                        <li><a href="#">Deals</a></li>
                        <li><a href="#">Login</a></li>
                        <li><a href="#">Logout</a></li>
                    </ul>   
                    
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
                <div class="container hide-position" style="text-align: center">
                <ul class="hideboard">
							<li class="board-li" ><a href="#" id="board-li-a">추천게시판</a>
    						<li class="board-li"><a href="#" id="board-li-a">관광일기</a>
    						<li class="board-li"><a href="#" id="board-li-a">같이가자!</a>
  	 					 </ul>
  	 			</div>		 
            </div>
        </div>
    </div>
  </header>
  <div class="container">
		<div class="row" style="margin-top: 100px;">
		<c:forEach var="vo" items="${list }">
			<div class="col-3">
				<div class="card" style="width:100%; height:100%;">
					<div class="bg-image hover-overlay ripple"
						data-mdb-ripple-color="light">
						<img src=${vo.pic1 } class="img-fluid" style=""/>
							<div class="mask" style="background-color: rgba(251, 251, 251, 0.15)"></div>
					</div>
					<div class="card-header">${vo.writer }</div>
					<div class="card-body">
						<h5 class="card-title">${vo.title }</h5>
						<p>${vo.content }</p>

						<a href="${pageContext.request.contextPath}/recordboard/detail.do?num=${vo.num}"><button type="button" class="btn btn-primary">상세보기</button></a>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	

  </body>

</html>
