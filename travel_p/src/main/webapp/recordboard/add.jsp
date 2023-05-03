<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>	
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>게시판 글쓰기 폼</title>

<!-- 부트스트랩 스타일시트 링크 -->
 <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	  $(".board").click(function(){
	    $(".hideboard").slideToggle("slow");
	  });
	});
	</script>
<!-- 폼 전용 스타일시트 -->
<style>
html,body{
background-image: url('https://t1.daumcdn.net/cfile/tistory/990BC43F5D2E590D1F');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

form {
	max-width: 650px;
	margin: 0 auto;
	padding: 20px;
	background-color: #f8f9fa;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	height:740px;
	position: relative;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	color: #007bff;
}

label {
	font-weight: bold;
	margin-bottom: 10px;
}

input[type="text"], input[type="number"], input[type="file"], textarea {
	margin-bottom: 8px;
}

button[type="submit"] {
	background-color: #91c8ca;
    border: none;
    font-weight: bold;
    font-size: 13px;
    padding: 10px 20px;
    margin-top: 20px;
    width: 100px;
}

button[type="submit"]:hover {
	background-color: #0069d9;
	border-color: #0062cc;
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
    						<li class="board-li"><a href="${pageContext.request.contextPath }/joinboard/list.do" id="board-li-a">같이가자!</a>
  	 					 </ul>
  	 					 </li>
                       
                        <c:if test ="${empty sessionScope.loginId }">
                        <li><a href="${pageContext.request.contextPath }/member/login.do">Login</a></li>
                        </c:if>
                        <c:if test ="${not empty sessionScope.loginId }">
                         <li><a href="${pageContext.request.contextPath }/recordboard/add.do">Let's record</a></li>
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
		

	<div class="container my-4" style="padding-top: 66px;">

		<form method="POST" action="${pageContext.request.contextPath }/recordboard/add.do" enctype="multipart/form-data">
			<div class="form-group">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" id="writer" value="${sessionScope.loginId }" name="writer" required>
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" name="title" required>
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea rows="10" cols="30" class="form-control" id="content" name="content" rows="5"
					required></textarea>
			</div>
			<div class="form-group">
				<label for="price">가격</label> <input type="number"
					class="form-control" id="price" name="price" required>
			</div>
			<div class="form-group">
				<label for="photo1">사진 1</label> <input type="file"
					class="form-control-file" id="photo1" name="file1" required>
			</div>
			<div class="form-group">
				<label for="photo2">사진 2</label> <input type="file"
					class="form-control-file" id="photo2" name="file2">
			</div>
			<div class="form-group">
				<label for="photo3">사진 3</label> <input type="file"
					class="form-control-file" id="photo3" name="file3">
			</div>
			<button type="submit" class="btn btn-primary">작성하기</button>
			<a href="${pageContext.request.contextPath }/recordboard/list.do"><button type="button" class="btn btn-primary"
			style=" width: 100px; margin-top: 20px; height: 41px; font-size: 13px; background-color: #8eb3d3; border: none;
    				font-weight: bold;">뒤로가기</button></a>
		</form>
	</div>
	
	<footer style="position: relative;">
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