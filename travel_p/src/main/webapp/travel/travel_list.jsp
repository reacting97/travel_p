<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>travel list test</title>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../assets/css/fontawesome.css">
	<link rel="stylesheet" href="../assets/css/templatemo-woox-travel.css">
	<link rel="stylesheet" href="../assets/css/owl.css">
	<link rel="stylesheet" href="../assets/css/animate.css">
	<link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	let totalData; //총 데이터 수
	let dataPerPage; //한 페이지에 나타낼 글 수
	let pageCount = 10; //페이징에 나타낼 페이지 수
	let globalCurrentPage=1; //현재 페이지
	let dataList = null; //표시하려하는 데이터 리스트
	
	$(document).ready(function() {
		//dataPerPage 선택값 가져오기
		dataPerPage = $("#dataPerPage").val();
		
		$.ajax({ // ajax로 데이터 가져오기
			method: "GET",
			url: "${pageContext.request.contextPath}/travel/provincelist.do",
			data: {'loc' : '${loc}'},
			dataType: 'json',
			success: function (d) {
				//totalData(총 데이터 수) 구하기
				totalData = d.length;
		        //데이터 대입
		        dataList = d;
		        //글 목록 표시 호출 (테이블 생성)
				displayData(1, dataPerPage);
				
				//페이징 표시 호출
				paging(totalData, dataPerPage, pageCount, 1);
			}, error: function(request, status, error) {
		        alert("status : " + request.status + "\n" + "\n" + "error:" + error);
			}
		});
		
		$(".test").click(function() {
			$.ajax({
				method : 'get',
				url : '${pageContext.request.contextPath}/travel/provincelist.do',
				data: {'loc' : $(this).attr('loc')},
				dataType: 'json',
				success : function(data){
					totalData = data.length;
			        dataList = data;
					displayData(1, dataPerPage);
					paging(totalData, dataPerPage, pageCount, 1);
				}, error : function(request, status, error) {
			        alert("status : " + request.status + "\n" + "\n" + "error:" + error);
				} 				
			});
		});
		
		$(document).on("click", ".col-12", function(){
			$(location).attr('href', '${pageContext.request.contextPath}/travel/detail.do?num='+$(this).attr('num'));
		});
		
		$(document).on("click", "#last_page", function() {
			const lastPage = Math.floor(((totalData -1) / pageCount) * pageCount /10) + 1;
			displayData(lastPage, dataPerPage);
			paging(totalData, dataPerPage, pageCount, lastPage);
		});
		
		$(document).on("click", "#first_page", function() {
			displayData(1, dataPerPage);
			paging(totalData, dataPerPage, pageCount, 1);
		});
	});
	
	//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
	function displayData(currentPage, dataPerPage) {
		let textHtml = "";

		//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림
		currentPage = Number(currentPage);
		dataPerPage = Number(dataPerPage);
		for (let i = (currentPage-1)*dataPerPage; i < (currentPage - 1) * dataPerPage + dataPerPage; i++) {
			if(dataList[i] == null) break;
			textHtml += "<div class='col-12' num='"+dataList[i].id+"'><div class='card h-75'><div class='row no-gutters'>";
			/* textHtml += "<div class='col-4'><img src='https://mdbcdn.b-cdn.net/img/new/standard/nature/111.webp' class='card-img w-75 h-75'/></div><div class='col-8'>"; */
			textHtml += "<div class='col-4'><img src='"+dataList[i].pic1+"' class='card-img h-75 w-75'/></div><div class='col-8'>";
			textHtml +=	"<div class='card-body'><h4 class='card-title text-start'>"+dataList[i].name+"</h4><p class='card-text'></p>";
			textHtml += "</div></div></div></div></div>";
		}
		
		$("#divBody").html(textHtml);
	}
	
	function paging(totalData, dataPerPage, pageCount, currentPage) {
		totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
		
		if(totalPage<pageCount){
			pageCount=totalPage;
		}
		
		let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
		let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
		
		if (last > totalPage) {
			last = totalPage;
		}

/* 		let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호  */
		let first = parseInt((currentPage-1) / 10) * 10 +1;
		let next = last + 1;
		let prev = first - 1;
		let pageHtml = "";
		
		if (prev > 0) {
			pageHtml += "<li class='page-item'>";
			pageHtml += "<a class='page-link' href='#' tabindex='-1' aria-disabled='true' id='first_page'> << </a></li>";
			pageHtml += "<li class='page-item'>";
			pageHtml += "<a class='page-link' href='#' tabindex='-1' aria-disabled='true' id='prev'> < </a></li>";
		}

		//페이징 번호 표시 
		for (var i = first; i <= last; i++) {
			if (currentPage == i) {
				pageHtml += "<li class='page-item'><a class='page-link' href='#' id='" + i + "'>" + i + "</a></li>";
			} else {
				pageHtml += "<li class='page-item'><a class='page-link' href='#' id='" + i + "'>" + i + "</a></li>";
			}
		}

		if (last < totalPage) {
			pageHtml += "<li class='page-item'><a class='page-link' href='#' id='next'> > </a></li>";
			pageHtml += "<li class='page-item'><a class='page-link' href='#' id='last_page'> >> </a></li>";
		}
		
		$("#pagingul").html(pageHtml);
		let displayCount = "";
		displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
		$("#displayCount").text(displayCount);
		
		//페이징 번호 클릭 이벤트 
		$("#pagingul li a").click(function () {
			let $id = $(this).attr("id");
			selectedPage = $(this).text();
			
			if ($id == "next") selectedPage = next;
			if ($id == "prev") selectedPage = prev;
			
			//전역변수에 선택한 페이지 번호를 담는다
			globalCurrentPage = selectedPage;
			//페이징 표시 재호출
			paging(totalData, dataPerPage, pageCount, selectedPage);
			//글 목록 표시 재호출
			displayData(selectedPage, dataPerPage);
		});
	}
	
	$("#dataPerPage").change(function () {
		dataPerPage = $("#dataPerPage").val();
		//전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
		paging(totalData, dataPerPage, pageCount, globalCurrentPage);
		displayData(globalCurrentPage, dataPerPage);
	});

</script>
<style type="text/css">
	.col-12 : {
		margin-top: 10px;
		margin-bottom: 10px; 	
	}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<!-- ***** Header Area Start ***** -->
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
	<div class="container mt-5">
		<div class="row">
          <div class="section-heading">
          <div class="test" loc="서울"><button type="button" class="lo_icons" ><img src="../assets/images/seoulicon.png">서울</button></div> 
          <div class="test" loc="인천"><button type="button" class="lo_icons"><img src="../assets/images/incheon.png">인천</button></div>
          <div class="test" loc="대전"><button type="button" class="lo_icons"><img src="../assets/images/dejeon.png">대전</button></div>
           <div class="test" loc="광주"><button type="button" class="lo_icons"><img src="../assets/images/guangju.png">광주</button></div>
           <div class="test" loc="대구"><button type="button" class="lo_icons"><img src="../assets/images/daegu.png">대구</button></div>
           <div class="test" loc="울산"><button type="button" class="lo_icons"><img src="../assets/images/ulsan.png">울산</button></div>
          <div class="test" loc="부산"><button type="button" class="lo_icons"><img src="../assets/images/busan.png">부산</button></div>
          <div class="test" loc="제주"><button type="button" class="lo_icons"><img src="../assets/images/jeju1.png">제주</button></div>
          </div>
      </div>
      <div class="row">
          <div class="section-heading">
          <div class="test" loc="경기"><button type="button" class="lo_icons"><img src="../assets/images/gyeonggi.png" >경기</button></div> 
          <div class="test" loc="강원"><button type="button" class="lo_icons"><img src="../assets/images/kang.png" >강원</button></div>
          <div class="test" loc="충청북도"><button type="button" class="lo_icons"><img src="../assets/images/choongbook.png" >충북</button></div>
          <div class="test" loc="충청남도"><button type="button" class="lo_icons"><img src="../assets/images/choongnam.png" >충남</button></div>
          <div class="test" loc="전라북도"><button type="button" class="lo_icons"><img src="../assets/images/bap.png" >전북</button></div>
		  <div class="test" loc="전라남도"><button type="button" class="lo_icons"><img src="../assets/images/junnam.png" >전남</button></div>
          <div class="test" loc="경상북도"><button type="button" class="lo_icons"><img src="../assets/images/crab.png">경북</button></div>
          <div class="test" loc="경상남도"><button type="button" class="lo_icons"><img src="../assets/images/green-tea.png" >경남</button></div>
          </div>
      </div>
		<!-- <div class="row justify-content-center">
			<div class="col-lg-1 col-md-4" id="all">전체</div>
			<div class="col-lg-1 col-md-4" id="seoul">서울</div>
			<div class="col-lg-1 col-md-4" id="kyung">경기도</div>
			<div class="col-lg-1 col-md-4" id="kang">강원도</div>
			<div class="col-lg-1 col-md-4" id="chungbuk">충청북도</div>
			<div class="col-lg-1 col-md-4" id="chungnam">충청남도</div>
			<div class="col-lg-1 col-md-4" id="jeonbuk">전라북도</div>
			<div class="col-lg-1 col-md-4" id="jeonnam">전라남도</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-1 col-md-3" id="kyungbuk">경상북도</div>
			<div class="col-lg-1 col-md-3" id="kyungnam">경상남도</div>
			<div class="col-lg-1 col-md-3" id="busan">부산</div>
			<div class="col-lg-1 col-md-3" id="daegu">대구</div>
			<div class="col-lg-1 col-md-3" id="inchun">인천</div>
			<div class="col-lg-1 col-md-3" id="kwangju">광주</div>
			<div class="col-lg-1 col-md-3" id="daejeon">대전</div>
			<div class="col-lg-1 col-md-3" id="ulsan">울산</div>
			<div class="col-lg-1 col-md-3" id="jeju">제주도</div>
		</div> -->
	</div> 
	<div class="container">
		<div class="row">
			<div class="col-10">
				<span id="displayCount"></span>
			</div>
			<div class="col-2">
				<select id="dataPerPage" style="text-align: right;">
					<option value="10">10개씩보기</option>
					<option value="15">15개씩보기</option>
					<option value="20">20개씩보기</option>
				</select>
			</div>
		</div>
		<div class="row gap-3 m-5" id=divBody>
			
		</div>
		<nav class='mt-5' aria-label="pagination">
			<ul class="pagination justify-content-center" id="pagingul">
<!-- 			<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li> -->
			</ul>
		</nav>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>