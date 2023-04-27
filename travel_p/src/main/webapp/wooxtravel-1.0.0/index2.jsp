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
                        <li><a href="${pageContext.request.contextPath }/member/login.do">Login</a></li>
                        <li><a href="${pageContext.request.contextPath }/member/logout.do">Logout</a></li>
                    </ul>   
                    
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
                <div class="container hide-position" style="text-align: center">
                <ul class="hideboard">
							<li class="board-li" ><a href="${pageContext.request.contextPath }/recommandboard/list.do" id="board-li-a">추천게시판</a>
    						<li class="board-li"><a href="${pageContext.request.contextPath }/recordboard/list.do" id="board-li-a">관광일기</a>
    						<li class="board-li"><a href="${pageContext.request.contextPath }/joinboard/list.do" id="board-li-a">같이가자!</a>
  	 					 </ul>
  	 			</div>		 
            </div>
        </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->
<!-- 	메인화면(이미지) -->
  <!-- ***** Main Banner Area Start ***** -->
  <section id="section-1">
    <div class="content-slider">
      <input type="radio" id="banner1" class="sec-1-input" name="banner" checked>
      <input type="radio" id="banner2" class="sec-1-input" name="banner">
      <input type="radio" id="banner3" class="sec-1-input" name="banner">
      <input type="radio" id="banner4" class="sec-1-input" name="banner">
      <div class="slider">
        <div id="top-banner-1" class="banner">
          <div class="banner-inner-wrapper header-text">
            <div class="main-caption">
              <h2>Take a Glimpse Into The Beautiful Country Of:</h2>
              <h1>경주</h1>
              <div class="border-button"><a href="about.html">Go There</a></div>
            </div>
            <div class="container">
              <div class="row">
                <div class="col-lg-12">
<!--                   <div class="more-info"> -->
<!--                     <div class="row"> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-user"></i> -->
<!--                         <h4><span>Population:</span><br>44.48 M</h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-globe"></i> -->
<!--                         <h4><span>Territory:</span><br>275.400 KM<em>2</em></h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-home"></i> -->
<!--                         <h4><span>AVG Price:</span><br>$946.000</h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <div class="main-button"> -->
<!--                           <a href="about.html">Explore More</a> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
                </div>
              </div>
            </div>
          </div>
        </div>
        <div id="top-banner-2" class="banner">
          <div class="banner-inner-wrapper header-text">
            <div class="main-caption">
              <h2>Take a Glimpse Into The Beautiful City Of:</h2>
              <h1>서울</h1>
              <div class="border-button"><a href="about.html">Go There</a></div>
            </div>
            <div class="container">
              <div class="row">
                <div class="col-lg-12">
<!--                   <div class="more-info"> -->
<!--                     <div class="row"> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-user"></i> -->
<!--                         <h4><span>Population:</span><br>8.66 M</h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-globe"></i> -->
<!--                         <h4><span>Territory:</span><br>41.290 KM<em>2</em></h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-home"></i> -->
<!--                         <h4><span>AVG Price:</span><br>$1.100.200</h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <div class="main-button"> -->
<!--                           <a href="about.html">Explore More</a> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
                </div>
              </div>
            </div>
          </div>
        </div>
        <div id="top-banner-3" class="banner">
          <div class="banner-inner-wrapper header-text">
            <div class="main-caption">
              <h2>Take a Glimpse Into The Beautiful Country Of:</h2>
              <h1>강원</h1>
              <div class="border-button"><a href="about.html">Go There</a></div>
            </div>
            <div class="container">
              <div class="row">
                <div class="col-lg-12">
<!--                   <div class="more-info"> -->
<!--                     <div class="row"> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-user"></i> -->
<!--                         <h4><span>Population:</span><br>67.41 M</h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-globe"></i> -->
<!--                         <h4><span>Territory:</span><br>551.500 KM<em>2</em></h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-home"></i> -->
<!--                         <h4><span>AVG Price:</span><br>$425.600</h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <div class="main-button"> -->
<!--                           <a href="about.html">Explore More</a> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
                </div>
              </div>
            </div>
          </div>
        </div>
        <div id="top-banner-4" class="banner">
          <div class="banner-inner-wrapper header-text">
            <div class="main-caption">
              <h2>Take a Glimpse Into The Beautiful Country Of:</h2>
              <h1>제주</h1>
              <div class="border-button"><a href="about.html">Go There</a></div>
            </div>
            <div class="container">
              <div class="row">
                <div class="col-lg-12">
<!--                   <div class="more-info"> -->
<!--                     <div class="row"> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-user"></i> -->
<!--                         <h4><span>Population:</span><br>69.86 M</h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-globe"></i> -->
<!--                         <h4><span>Territory:</span><br>513.120 KM<em>2</em></h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <i class="fa fa-home"></i> -->
<!--                         <h4><span>AVG Price:</span><br>$165.450</h4> -->
<!--                       </div> -->
<!--                       <div class="col-lg-3 col-sm-6 col-6"> -->
<!--                         <div class="main-button"> -->
<!--                           <a href="about.html">Explore More</a> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <nav>
        <div class="controls">
          <label for="banner1"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">1</span></label>
          <label for="banner2"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">2</span></label>
          <label for="banner3"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">3</span></label>
          <label for="banner4"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">4</span></label>
        </div>
      </nav>
    </div>
  </section>
  <!-- ***** Main Banner Area End ***** -->
<!--   지역별 버튼 -->
    <div class="container">
      <div class="row">
          <div class="section-heading">
          <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/seoulicon.png"  >서울</button></div> 
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/incheon.png" >인천</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/dejeon.png" >대전</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/guangju.png" >광주</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/daegu.png" >대구</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/ulsan.png" >울산</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/busan.png" >부산</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/jeju1.png" >제주</button></div>
          </div>
      </div>
      <div class="row">
          <div class="section-heading">
          <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/gyeonggi.png" >경기</button></div> 
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/kang.png" >강원</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/choongnam.png" >충남</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/choongbook.png" >충북</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/junnam.png" >전남</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/bap.png" >전북</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/green-tea.png" >경남</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='#'"><img src="assets/images/crab.png">경북</button></div>
          </div>
      </div>
<!--       랭킹 -->
      <div class="nav-ranking">
      	<nav class="navbar nav-border" style="background-color:#CCFFFF;">
  			<div class="container-fluid">
    			<a class="navbar-ranking">
      				<img src="assets/images/ranking.png" alt="급상승 관광지 랭킹"  class="d-inline-block align-text-top nav_bar_img">
     						실시간 관광곡곡 랭킹
   				 </a>
   				 <span class="navbar-ranking blink"><a href="#"> 1. 날씨 위젯 서버 이슈.. </a></span>
   				 <span class="navbar-ranking"> <button type="button" class="borderbutton drop"><img src="assets/images/햄버거바.png" class="nav_bar_img2" ></button></span>
  			</div>
  			<div >
  				<nav class="nav flex-column ranking">
  					<a class="nav-link" href="#">2. 관광곡곡</a>
 					<a class="nav-link" href="#">3. 방방곳곳 or 방방곡곡</a>
  					<a class="nav-link" href="#">4. 방방방방방방</a>
  					<a class="nav-link" href="#">5. 동탄 마딧게티</a>
				</nav>
  			</div>
		</nav>
      </div>
    </div>
    
    
  <h3 class="recommend-text">조회수 랭킹곡곡</h3>
  		<div class="container">
  			<div class="recommend"> 
			<div class="card" style="width: 18rem; height:20rem">
  					<img src="assets/images/nammountain.jpg" class="maincard-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-text-top"><a href="#" class="card-text">대표 랜드마크, 남산서울타워.</a></p>
  				</div>
			</div>
			<div class="card" style="width: 18rem; height:20rem">
  					<img src="assets/images/purpleisland.jpg" class="maincard-img-top" alt="...">
  				<div class="card-body">
   					 <p class="card-text-top"><a href="#" class="card-text">전남 신안의 푸른 바다 위 천사의 섬 '보라보라해'.</a>  </p>
  				</div>
			</div>
			<div class="card" style="width: 18rem; height:20rem">
  					<img src="assets/images/pohang.jpg" class="maincard-img-top" alt="..." >
  				<div class="card-body">
    				<p class="card-text-top"><a href="#" class="card-text">경북 포항의 대한민국 내륙에서 가장 해가 먼저 뜨는 곳.</a> </p>
  				</div>
			</div>
			<div class="card" style="width: 18rem; height:20rem">
  					<img src="assets/images/busan.jpg" class="maincard-img-top" alt="...">
 				 <div class="card-body">
   					 <p class="card-text-top"><a href="#" class="card-text">부산. 대한민국 동남부에 위치한 광역시이며 대한민국의 제2의 도시.</a> </p>
  				</div>
			</div>
			<div class="card" style="width: 18rem; height:20rem">
  					<img src="assets/images/kuje.jpg" class="maincard-img-top" alt="...">
 				 <div class="card-body">
   					 <p class="card-text-top"><a href="#" class="card-text">경남 거제의 바람의 언덕. 언덕에서 바다를 바라보면 한 없이 넓고, 고즈넉하며, 시원한 바람이 상쾌함을 선사한다.</a> </p>
  				</div>
			</div>
		</div>
	</div>
<!-- 	날씨 -->
	<div class="container">
		<div class="weather">
		<a class="weatherwidget-io" href="https://forecast7.com/en/35d91127d77/south-korea/" data-label_1="한국" data-label_2="날씨" data-icons="Climacons Animated" data-theme="mountains" >한국 날씨</a>
		<script>
		!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');
		</script>
		</div>
	</div>

	<div class="container commuhead">
	<div class="commu-main">
	<div class="container commu">
  <div class="column">
    <h2>추천곡곡</h2>
    <div class="slider">
      <div class="slide"><a href="#">여기 정말 최고야</a></div>
      <div class="slide"><a href="#">아니? 여기가 최곤데?</a></div>
      <div class="slide"><a href="#">여기도..</a></div>
      <div class="slide"><a href="#">여기도1..</a></div>
    </div>
  </div>
  <div class="column">
    <h2>나의관광일지</h2>
    <div class="slider">
      <div class="slide"><a href="#">나의 해방일지 아님</a></div>
      <div class="slide"><a href="#">비와서 망함</a></div>
      <div class="slide"><a href="#">눈와서 넘어짐</a></div>
      <div class="slide"><a href="#">222</a></div>
    </div>
  </div>
  <div class="column">
    <h2>같이 갈래?</h2>
    <div class="slider">
      <div class="slide"><a href="#">23살/남자/술 마실사람</a></div>
      <div class="slide"><a href="#">35살/남자/...</a></div>
      <div class="slide"><a href="#">20살/남자/여기 뭐하는 곳이죠?</a></div>
      <div class="slide"><a href="#">1살</a></div>
    </div>
  </div>
  </div>
</div>
</div>
	
	
	
	
	
	<div class="container  com">
	<div class="rec">
  <div class="slide-container">
    <div class="slide-image">
        <img src="assets/images/nammountain.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/purpleisland.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/best-02.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/best-03.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/best-01.jpg" alt="">
      </div>
  </div>
  <div class="slide-container">
    <div class="slide-image">
        <img src="assets/images/country-01.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/country-02.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/country-03.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/kuje.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/busan.jpg" alt="">
      </div>
  </div>
  
  <div class="slide-container">
    <div class="slide-image">
        <img src="assets/images/pohang.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/cities-01.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/cities-02.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/cities-03.jpg" alt="">
      </div>
      
      <div class="slide-image">
        <img src="assets/images/cities-04.jpg" alt="">
      </div>
  </div>
    <div class="slide-container-bottom"></div>
</div>
</div>
	
	
<!-- 	바닥글 -->
  <div class="call-to-action">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <h2>Are You Looking To Travel ?</h2>
          <h4>Make A Reservation By Clicking The Button</h4>
        </div>
        <div class="col-lg-4">
          <div class="border-button">
            <a href="reservation.html">Book Yours Now</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © 2036 <a href="#">WoOx Travel</a> Company. All rights reserved. 
          <br>Design: <a href="https://templatemo.com" target="_blank" title="free CSS templates">TemplateMo</a> Distribution: <a href="https://themewagon.com target="_blank" >ThemeWagon</a></p>
        </div>
      </div>
    </div>
  </footer>

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="assets/js/isotope.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/wow.js"></script>
  <script src="assets/js/tabs.js"></script>
  <script src="assets/js/popup.js"></script>
  <script src="assets/js/custom.js"></script>
  	 <script>
    function bannerSwitcher() {
      next = $('.sec-1-input').filter(':checked').next('.sec-1-input');
      if (next.length) next.prop('checked', true);
      else $('.sec-1-input').first().prop('checked', true);
    }

    var bannerTimer = setInterval(bannerSwitcher, 5000);

    $('nav .controls label').click(function() {
      clearInterval(bannerTimer);
      bannerTimer = setInterval(bannerSwitcher, 5000)
    });
  </script>
	

  </body>

</html>

