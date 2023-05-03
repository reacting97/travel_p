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
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
     
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
	  $(".board").click(function(){
	    $(".hideboard").slideToggle("slow");
	  });
	});
	
	  var images1 = ["../assets/images/kuje.jpg", "../assets/images/koreaisland.jpg", "../assets/images/seoul.jpg"];
	  var images2 = ["../assets/images/deals-04.jpg", "../assets/images/jeju.avif", "../assets/images/pohang.jpg"];
	  var images3 = ["../assets/images/jeju.jpg", "../assets/images/cities-01.jpg", "../assets/images/cities-02.jpg"];
	  var images4 = ["../assets/images/cities-03.jpg", "../assets/images/cities-04.jpg", "../assets/images/country-01.jpg"];
	  var images5 = ["../assets/images/deals-01.jpg", "../assets/images/country-03.jpg", "../assets/images/deals-03.jpg"];
	  var currentIndex1 = 0;
	  var currentIndex2 = 0;
	  var currentIndex3 = 0;
	  var currentIndex4 = 0;
	  var currentIndex5 = 0;
		
	  // 봄
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

	  // 바다 
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

	  // 산 
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
	  
	  //이색체험
	  function changeImage4(direction) {
	    if (direction == "next") {
	      currentIndex4 = (currentIndex4 + 1) % images4.length;
	    } else if (direction == "prev") {
	      currentIndex4--;
	      if (currentIndex4 < 0) {
	        currentIndex4 = images4.length - 1;
	      }
	    }
	    document.getElementById("image4").src = images4[currentIndex4];
	  }
	  
	  //레저
	  function changeImage5(direction) {
	    if (direction == "next") {
	      currentIndex5 = (currentIndex5 + 1) % images5.length;
	    } else if (direction == "prev") {
	      currentIndex5--;
	      if (currentIndex5 < 0) {
	        currentIndex5 = images5.length - 1;
	      }
	    }
	    document.getElementById("image5").src = images5[currentIndex5];
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
	  document.getElementById("next4").addEventListener("click", function() {
	    changeImage4("next");
	  });
	  document.getElementById("prev4").addEventListener("click", function() {
	    changeImage4("prev");
	  });
	  document.getElementById("next5").addEventListener("click", function() {
	    changeImage5("next");
	  });
	  document.getElementById("prev5").addEventListener("click", function() {
	    changeImage5("prev");
	  });
	
	
		</script>
	

<style type="text/css">


.col-3{
	margin-top: 10px;
	margin-bottom: 10px;
}
.card img {
    height: 200px;
    object-fit: cover;
}
.hideboard{
	display: none;
}

.sub-head-1{
	height:130px;
	background-color: #D3D3D3;
}

.boss-rec{
	margin-top:70px;
}

.boss-rec-img{
	display: flex;
    justify-content: center;
    border-bottom: 1px dashed gray;
    padding-bottom: 80px;
    margin-top: 30px;
}

.boss-recommend{
	margin:5px;
	background-color:transparent;
}

.boards-title-2{
	font-size:1.8rem;
	font-family: 고령딸기체;
}


.recommend-img2{
	height:300px;
	border-radius: 40px;
}

.rec-btn1-l {
    position: absolute;
    width: 40px;
    top: 520px;
    left: 110px;
    cursor: auto;
}

.rec-btn1-r {
    position: absolute;
    width: 40px;
    top: 520px;
    left: 332px;
}

.rec-btn2-l {
    position: absolute;
    width: 40px;
    top: 520px;
    left: 370px;
}

.rec-btn2-r {
    position: absolute;
    width: 40px;
    top: 520px;
    left: 592px;
}

.rec-btn3-l {
    position: absolute;
    width: 40px;
    top: 520px;
    left: 629px;
}

.rec-btn3-r {
    position: absolute;
    width: 40px;
    top: 520px;
    right: 628px;
}

.rec-btn4-l {
    position: absolute;
    width: 40px;
    top: 520px;
    right: 590px;
}

.rec-btn4-r {
    position: absolute;
    width: 40px;
    top: 520px;
    right: 370px;
}


.rec-btn5-l {
    position: absolute;
    width: 40px;
    top: 520px;
    right: 330px;
}

.rec-btn5-r {
    position: absolute;
    width: 40px;
    top: 520px;
    right: 110px;
}

.write-recommend{
	display:flex;
	justify-content:flex-end;
	margin-bottom: 30px;
	margin-right: 10px;
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
  <header class="header-area header-sticky" style="position: fixed">
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
    						<li class="board-li"><a href="${pageContext.request.contextPath }/joinboard/list.do" id="board-li-a" >같이가자!</a>
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
	
	
	<div class="container" >		
		<div class="boss-rec" style="font-family: 고령딸기체"> 
			<h4 style="display: inline-block; border-bottom: 1px dashed gray; padding-bottom: 10px">방방의 추천!</h4>
		</div>
		<div class="boss-rec-img" >
			<div class="column boss-recommend">
      <h2 class="boards-title-2" >봄</h2>
      <img id="image1" src="../assets/images/kuje.jpg" alt="추천글 이미지" class="recommend-img2">
        <span class="rec-btn1-l "><button onclick="changeImage1('prev')"  class="push" style="background-color: transparent; border:none"><img id="prev1" src="../assets/images/left1.png" alt="왼쪽 화살표" class="push"></button></span> 
         <span class="rec-btn1-r "><button onclick="changeImage1('next')" class="push" style="background-color: transparent; border:none"><img id="next1" src="../assets/images/right1.png" alt="오른쪽 화살표" class="push"></button></span>
      <p></p>
    </div>

    <div class="column boss-recommend">
      <h2 class="boards-title-2" >바다</h2>
      <img id="image2" src="../assets/images/busan.jpg" alt="일기 이미지" class="recommend-img2">
        <span class="rec-btn2-l"> <button onclick="changeImage2('prev')" class="push" style="background-color: transparent; border:none"><img id="prev2" src="../assets/images/left1.png" alt="왼쪽 화살표"></button></span>
         <span class="rec-btn2-r"><button onclick="changeImage2('next')" class="push" style="background-color: transparent; border:none"><img id="next2" src="../assets/images/right1.png" alt="오른쪽 화살표"></button></span>
    	<p></p>
    </div>

    <div class="column boss-recommend">
      <h2 class="boards-title-2">산</h2>
      <img id="image3" src="../assets/images/nammountain.jpg" alt="모집 이미지" class="recommend-img2">
      <span class="rec-btn3-l"> <button onclick="changeImage3('prev')" class="push" style="background-color: transparent; border:none"><img id="prev3" src="../assets/images/left1.png" alt="왼쪽 화살표"></button></span>
        <span class="rec-btn3-r"><button onclick="changeImage3('next')" class="push" style="background-color: transparent; border:none"><img id="next3" src="../assets/images/right1.png" alt="오른쪽 화살표"></button></span>
    	<p></p>
    </div>
   
    <div class="column boss-recommend">
      <h2 class="boards-title-2" >이색 체험</h2>
      <img id="image4" src="../assets/images/koreaisland.jpg" alt="모집 이미지" class="recommend-img2">
       <span class="rec-btn4-l"><button onclick="changeImage4('prev')" class="push" style="background-color: transparent; border:none"><img id="prev4" src="../assets/images/left1.png" alt="왼쪽 화살표"></button></span>
        <span class="rec-btn4-r"><button onclick="changeImage4('next')" class="push" style="background-color: transparent; border:none"><img id="next4" src="../assets/images/right1.png" alt="오른쪽 화살표"></button></span>
      <p></p>
    </div>
   
    <div class="column boss-recommend">
      <h2 class="boards-title-2">레저</h2>
      <img id="image5" src="../assets/images/country-03.jpg" alt="모집 이미지" class="recommend-img2">
       <span class="rec-btn5-l"><button onclick="changeImage5('prev')" class="push" style="background-color: transparent; border:none"><img id="prev5" src="../assets/images/left1.png" alt="왼쪽 화살표"></button></span>
        <span class="rec-btn5-r"><button onclick="changeImage5('next')" class="push" style="background-color: transparent; border:none"><img id="next5" src="../assets/images/right1.png" alt="오른쪽 화살표"></button></span>
      	<p></p>
   		 </div>
		</div>
	</div>
  
<!--   추천글 시작 -->
	<div class="container" style="display: flex; justify-content: center; margin-bottom:150px">
		<div class="row" style="margin-top: 100px; width:1000px">
		<div class="write-recommend">
				<h6 style="border-bottom:1px solid gray ">
				<c:if test="${not empty sessionScope.loginId }">
				<a href="${pageContext.request.contextPath }/recommandboard/add.do">
				<img src="../assets/images/pen.png" style="width:20px">추천하기</a>
				</c:if>
				</h6>
				</div>
				
		<c:forEach var="vo" items="${list }">
			<div class="col-3" style="margin-bottom:30px">
				<div class="card" style="width:100%; height:100%;">
					<div class="bg-image hover-overlay ripple"
						data-mdb-ripple-color="light">
						<img src=${vo.pic1 } class="img-fluid" style=""/>
							<div class="mask" style="background-color: rgba(251, 251, 251, 0.15)"></div>
					</div>
					<div class="card-header" style="font-family: KCC-간판체 "><strong>${vo.writer }</strong> 님의 추천</div>
					<div class="card-body" >
						<h5 class="card-title" style=" height: 25px; overflow: hidden; white-space: nowrap; width: 200px; text-overflow: ellipsis; font-family: Dovemayo_wild;">
						제목: ${vo.title }</h5>
						<p style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${vo.content }</p>

						<a href="${pageContext.request.contextPath}/recommandboard/detail.do?num=${vo.num}"><button type="button" class="btn btn-primary">상세보기</button></a>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	
	
	<!-- 	바닥글 -->
  <footer style="position: relative;">
  	<div class="call-to-action" style="height: 140px;">
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
  
</body>
</html>