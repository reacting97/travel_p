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
<script type="text/javascript">
	
	$(document).ready(function(){
	  $(".board").click(function(){
	    $(".hideboard").slideToggle("slow");
	  });
	  $(".drop").click(function(){
	    $(".ranking").slideToggle("slow");
	  });
	});
	
	  var images1 = ["assets/images/kuje.jpg", "assets/images/추천.png", "assets/images/seoul.jpg"];
	  var images2 = ["assets/images/kang.png", "assets/images/jeju.avif", "assets/images/pohang.jpg"];
	  var images3 = ["assets/images/jeju.jpg", "assets/images/choong.png", "assets/images/dol.png"];
	  var currentIndex1 = 0;
	  var currentIndex2 = 0;
	  var currentIndex3 = 0;

	  // 추천글
	  function changeImage1(direction) {
	    if (direction == "next") {
	      currentIndex1 = (currentIndex1 + 1) % images1.length;
	    } else if (direction == "prev") {
	      currentIndex1--;
	      if (currentIndex1 < 0) {
	        currentIndex1 = images1.length - 1;
	      }
	    }
	    document.getElementById("image1").src = images1[currentIndex1];
	  }

	  // 일기 
	  function changeImage2(direction) {
	    if (direction == "next") {
	      currentIndex2 = (currentIndex2 + 1) % images2.length;
	    } else if (direction == "prev") {
	      currentIndex2--;
	      if (currentIndex2 < 0) {
	        currentIndex2 = images2.length - 1;
	      }
	    }
	    document.getElementById("image2").src = images2[currentIndex2];
	  }

	  // 모집 
	  function changeImage3(direction) {
	    if (direction == "next") {
	      currentIndex3 = (currentIndex3 + 1) % images3.length;
	    } else if (direction == "prev") {
	      currentIndex3--;
	      if (currentIndex3 < 0) {
	        currentIndex3 = images3.length - 1;
	      }
	    }
	    document.getElementById("image3").src = images3[currentIndex3];
	  }

	  // 버튼 클릭 이벤트 처리
	  document.getElementById("next1").addEventListener("click", function() {
	    changeImage1("next");
	  });
	  document.getElementById("prev1").addEventListener("click", function() {
	    changeImage1("prev");
	  });
	  document.getElementById("next2").addEventListener("click", function() {
	    changeImage2("next");
	  });
	  document.getElementById("prev2").addEventListener("click", function() {
	    changeImage2("prev");
	  });
	  document.getElementById("next3").addEventListener("click", function() {
	    changeImage3("next");
	  });
	  document.getElementById("prev3").addEventListener("click", function() {
	    changeImage3("prev");
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
                    <a href="index.jsp" class="logo">
                        <img src="assets/images/bangbang.png" class="main-logo" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="index.jsp" class="active">Home</a></li>
                        <li>
                        <a href="#" class="board">Board</a>
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
                        <li><a href="${pageContext.request.contextPath }/member/edit.do?id=${sessionScope.loginId}" style="padding-top:6px">${sessionScope.loginId } 님 <img src="assets/images/myinfo.png" class="myinfo-icon"></a>
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
          <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=서울'"><img src="assets/images/seoulicon.png" >서울</button></div> 
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=인천'"><img src="assets/images/incheon.png" >인천</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=대전'"><img src="assets/images/dejeon.png" >대전</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=광주'"><img src="assets/images/guangju.png" >광주</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=대구'"><img src="assets/images/daegu.png" >대구</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=울산'"><img src="assets/images/ulsan.png" >울산</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=부산'"><img src="assets/images/busan.png" >부산</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=제주'"><img src="assets/images/jeju1.png" >제주</button></div>
          </div>
      </div>
      <div class="row">
          <div class="section-heading">
          <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=경기도'"><img src="assets/images/gyeonggi.png" >경기</button></div> 
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=강원도'"><img src="assets/images/kang.png" >강원</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=충청남도'"><img src="assets/images/choongnam.png" >충남</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=충청북도'"><img src="assets/images/choongbook.png" >충북</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=전라남도'"><img src="assets/images/junnam.png" >전남</button></div>
           <div class="test"><button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=전라북도'"><img src="assets/images/bap.png" >전북</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=경상남도'"><img src="assets/images/green-tea.png" >경남</button></div>
          <div class="test"> <button type="button" class="lo_icons" onclick ="location.href ='${pageContext.request.contextPath}/travel/list.do?loc=경상북도'"><img src="assets/images/crab.png">경북</button></div>
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
   				 <span class="navbar-ranking" > <button type="button" class="borderbutton drop"><img src="assets/images/햄버거바.png" class="nav_bar_img2" ></button></span>
  			</div>
  			<div >
  				<nav class="nav flex-column ranking" style="display:none; padding-left:630px">
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
	<div class="container boards">
		<div class="column recommed">
      <h2 class="boards-title">Recommend<a href=""> ...</a></h2>
      <img id="image1" src="assets/images/kuje.jpg" alt="추천글 이미지" class="recommend-img">
      <p>추천글 내용</p>
      <div class="img-button">
        <button onclick="changeImage1('prev')" style="background-color: transparent; border:none"><img id="prev1" src="assets/images/left.png" alt="왼쪽 화살표" ></button> 
         <button onclick="changeImage1('next')" style="background-color: transparent; border:none"><img id="next1" src="assets/images/right.png" alt="오른쪽 화살표"></button>
      </div>
    </div>
    <!-- 일기 컬럼 -->
    <div class="column recommed">
      <h2 class="boards-title">Diary<a href=""> ...</a></h2>
      <img id="image2" src="assets/images/busan.jpg" alt="일기 이미지" class="recommend-img">
      <p>일기 내용</p>
      <div class="img-button">
         <button onclick="changeImage2('prev')" style="background-color: transparent; border:none"><img id="prev2" src="assets/images/left.png" alt="왼쪽 화살표"></button>
        <button onclick="changeImage2('next')" style="background-color: transparent; border:none"><img id="next2" src="assets/images/right.png" alt="오른쪽 화살표"></button>
      </div>
    </div>
    <!-- 모집 컬럼 -->
    <div class="column recommed">
      <h2 class="boards-title">Join<a href=""> ...</a></h2>
      <img id="image3" src="assets/images/nammountain.jpg" alt="모집 이미지" class="recommend-img">
      <p>모집 내용</p>
      <div class="img-button">
       <button onclick="changeImage3('prev')" style="background-color: transparent; border:none"><img id="prev3" src="assets/images/left.png" alt="왼쪽 화살표"></button>
       <button onclick="changeImage3('next')" style="background-color: transparent; border:none"><img id="next3" src="assets/images/right.png" alt="오른쪽 화살표"></button>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
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