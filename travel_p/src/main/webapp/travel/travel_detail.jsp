<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d2625792f1e6e1fac26d00f60d91116c&amp;libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>${travel.name }</title>
<style type="text/css">
	.container {
		padding: 0px !important;
		border: 1px solid rgb(214, 214, 214);
		border-radius: 15px;
		margin-top: 10px;
		overflow: hidden;
	}
	.head-container img {
	    object-fit: cover;                /* 사진의 가로세로 비율 맞추기 */
	}
	.head-container{
	    display: flex;
	    justify-content: space-between;
	}
	.main-img-container {
	    width: 815px;
	    height: 500px;
	}
	.main-img-container img {
	    width: 815px; 
	    height: 500px;
	}
	.sub-img-container{
	    width: 500px;
	    height: 500px;
	    display: flex;
	    flex-direction: column;
	    justify-content: space-between;
	}
	.sub1, .sub2 {
	    display: flex;
	    justify-content: space-between;
	}
	.sub-img-container img {
	    width: 500px;
	    height: 248px;
	}
	.body-container{
	    /* background-color: yellow; */
	    padding: 50px;
	}
	.location-name{
	    font-size: 28px;
	    font-weight: 900;
	}
	.location-eng-name{
	    margin-top: -15px;
	    color: gray;
	    font-size: 15px;
	}
	.location-info{
	    color: rgb(80, 80, 80);
	    line-height: 21px;
	    display: -webkit-box;
	    -webkit-line-clamp: 3;
	    -webkit-box-orient: vertical;
	    overflow: hidden;
	}
	
	.other-info{
	    margin-top: 50px;
	    padding-left: 20px;
	    border-left: 2px solid rgb(221, 221, 221);
	}
	.other-info div {
	    display: flex;
	}
	.other-info div p {
	    margin: 0px 10px;
	}
	.click {
	    cursor: pointer;
	}
	.click:hover {
	    text-decoration: underline;
	}
	.location-map {
	    margin-top: 8px;
	}
	.nearby-restaurant {
	    margin-top: 10px;
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: space-between;
	}
	.restaurant-card{
	    width: 200px;
	    height: 280px;
	    border: 2px solid rgb(221, 221, 221);
	    overflow: hidden;
	    cursor: pointer;
	    transition: 0.3s;
	}
	.restaurant-card:hover{
	    border: 2px solid rgb(145, 145, 145);
	}
	.restaurant-card img {
	    width: 100%;
	    height: 150px;
	    object-fit: cover;
	}
	.restaurant-card-content{
	    padding: 10px;
	}
	.restaurant-review{
	    font-size: 14px;
	    color: rgb(80, 80, 80);
	    font-weight: 700;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	    overflow: hidden;
	}
	.map_wrap {
		position:relative;
		width:500px;
		height:350px;
	}
	.title {
		font-weight:bold;
		display:block;
	}
	.hAddr {
		position:absolute;
		left:10px;top:10px;
		border-radius: 2px;
		background:#fff;
		background:rgba(255,255,255,0.8); 
		z-index:1;padding:5px;
	}
	#centerAddr {
		display:block;
		margin-top:2px;
		font-weight: normal;
	}
	.bAddr {
		padding:5px;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	a {
	  text-decoration: none;
	}
</style>
</head>
<body>
    <div class="container">
        <div class="head-container">
            <div class="main-img-container">
                <img src="${travel.pic1 }">
            </div>
            <div class="sub-img-container">
                <div class="sub1">
                    <img src="${travel.pic2 }">
                </div>
                <div class="sub2">
                    <img src="${travel.pic3 }">
                </div>
            </div>
        </div>
        <div class="body-container">
            <div class="location-title">
            	<c:set var="keywordArr" value="${fn:split(travel.address, ' ')}"></c:set>
                <p><b style="color: rgb(18, 126, 214);">
                	<c:forEach var="keyword" items="${keywordArr }">
                		<c:choose>
                			<c:when test="${status.index eq 0 }">
                				${keywordArr[status.index] } </b> >
                			</c:when>
                			<c:when test="${status.index eq 1 }">
                				${keywordArr[status.index] } </p>
                			</c:when>
                		</c:choose>
                	</c:forEach>
                <p class="location-name">${travel.name }</p>
<!--                 <p class="location-eng-name">Hwasun-gun</p> -->
            </div>
            <div class="location-info">
                <p>${travel.content } </p>
                <button>∨</button>
            </div>
            <div class="other-info">
                <div class="location-weather">
                    <p style="color: gray;">날씨</p>
                    <p>
                    	<c:choose>
                    		<c:when test="${weather.info eq '맑음' }">
                    			☀️
                    		</c:when>
                    		<c:when test="${weather.info eq '흐림' }">
                    			☁
                    		</c:when>
                    		<c:when test="${weather.info eq '비' }">
                    			🌧️
                    		</c:when>
                    	</c:choose>
                    ${weather.info}, 최저 : ${weather.tmn }℃ 
                    최고 : ${weather.tmx}℃</p> 
                </div>
                <div class="location-map">
                	<div class="row">
                	<div class="col-12">
                		<p style="color: gray;">위치</p>
						<p class="click" style="color: rgb(18, 126, 214);"><a href="https://map.kakao.com/link/to/${travel.name},${latitude},${longtitude}" target="_blank">길찾기정보</a> </p>
     	    	       	<p class="click" style="color: rgb(18, 126, 214);"><a href="https://map.kakao.com/link/map/${travel.name},${latitude},${longtitude}" target="_blank">📌지도</a></p>
               		</div>
                	<div class="map_wrap">
					    <div id="map" style="width:500px;height:350px;position:relative;overflow:hidden;"></div>
					    <div class="hAddr">
					        <p><span class="title"><b>주소 정보</b></span></p>
					        <p><span id="centerAddr"></span></p>
						</div>
					</div>
					</div>
                </div>
            </div>
            <div style="margin-top: 80px;">
                <p style="color: rgb(100, 100, 100); font-size: 20px; font-weight: 600;">주변 관광지</p>
            </div>
            <div class="nearby-restaurant">
            	<c:forEach items="${travelList }" var="travel" begin="1" end="5" varStatus="status">
            		<div class="restaurant-card" onclick="location.href='${pageContext.request.contextPath}/travel/detail.do?num=${travel.id }';">
	                    <div class="restaurant-card-img" style='width: 19rem; height: 15rem'>
	                        <img src="${travel.pic1 }">
	                    </div>
	                    <div class="restaurant-card-content">
	                        <p style="font-weight: 700; font-size: 18px;">${travel.name }</p>
	                        <p style="margin-top: -20px; font-size: 13px; color: rgb(160, 160, 160);">★★★★☆</p>
	                        <p class="restaurant-review"></p>
	                    </div>
	                </div>
            	</c:forEach>
<!--                 <div class="restaurant-card"> -->
<!--                     <div class="restaurant-card-img"> -->
<!--                         <img src="/img/img6.jpg"> -->
<!--                     </div> -->
<!--                     <div class="restaurant-card-content"> -->
<!--                         <p style="font-weight: 700; font-size: 18px;">관광지명</p> -->
<!--                         <p style="margin-top: -20px; font-size: 13px; color: rgb(160, 160, 160);">★★★★☆</p> -->
<!--                         <p class="restaurant-review"></p> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 <div class="restaurant-card"> -->
<!--                     <div class="restaurant-card-img"> -->
<!--                         <img src="/img/img6.jpg"> -->
<!--                     </div> -->
<!--                     <div class="restaurant-card-content"> -->
<!--                         <p style="font-weight: 700; font-size: 18px;">관광지명</p> -->
<!--                         <p style="margin-top: -20px; font-size: 13px; color: rgb(160, 160, 160);">★★★★☆</p> -->
<!--                         <p class="restaurant-review"></p> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 <div class="restaurant-card"> -->
<!--                     <div class="restaurant-card-img"> -->
<!--                         <img src="/img/img6.jpg"> -->
<!--                     </div> -->
<!--                     <div class="restaurant-card-content"> -->
<!--                         <p style="font-weight: 700; font-size: 18px;">관광지명</p> -->
<!--                         <p style="margin-top: -20px; font-size: 13px; color: rgb(160, 160, 160);">★★★★☆</p> -->
<!--                         <p class="restaurant-review"></p> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 <div class="restaurant-card"> -->
<!--                     <div class="restaurant-card-img"> -->
<!--                         <img src="/img/img6.jpg"> -->
<!--                     </div> -->
<!--                     <div class="restaurant-card-content"> -->
<!--                         <p style="font-weight: 700; font-size: 18px;">관광지명</p> -->
<!--                         <p style="margin-top: -20px; font-size: 13px; color: rgb(160, 160, 160);">★★★★☆</p> -->
<!--                         <p class="restaurant-review"></p> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 <div class="restaurant-card"> -->
<!--                     <div class="restaurant-card-img"> -->
<!--                         <img src="/img/img6.jpg"> -->
<!--                     </div> -->
<!--                     <div class="restaurant-card-content"> -->
<!--                         <p style="font-weight: 700; font-size: 18px;">관광지명</p> -->
<!--                         <p style="margin-top: -20px; font-size: 13px; color: rgb(160, 160, 160);">★★★★☆</p> -->
<!--                         <p class="restaurant-review"></p> -->
<!--                     </div> -->
<!--                 </div> -->
            </div>
        </div>
    </div>
    <script type="text/javascript">
		/* $.ajax({
			url: 'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=' + ${latitude} + '&y=' + ${longtitude},
			headers: { 'Authorization': 'KakaoAK b0db0bd9fab741fdabe06937163b912e' }, 
			type: 'GET'
		}).done(function(data) {
		    console.log(data);
		}); */
	
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(${latitude}, ${longtitude}), //지도의 중심좌표.
			level: 4 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);    
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var markerPosition  = new kakao.maps.LatLng(${latitude}, ${longtitude}); 
		var marker = new kakao.maps.Marker({
			map: map,
			position : markerPosition
		}); 

		var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		var content = '<div style="padding:5px;"><b>${travel.name}</b></div>';
//		<br><a href="https://map.kakao.com/link/map/${travel.name},${latitude},${longtitude}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${travel.name},${latitude},${longtitude}" style="color:blue" target="_blank">길찾기</a>
		infowindow.setContent(content);
       	infowindow.open(map, marker);
		
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
 		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
 			searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
 				if (status === kakao.maps.services.Status.OK) {
 					var detailAddr = !!result[0].road_address ? '\n<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
 					detailAddr += '\n<div>지번 주소 : ' + result[0].address.address_name + '</div>'; 
  					var content = '<div class="bAddr"><span class="title">법정동 주소정보</span>' + detailAddr + '</div>'; 
					
 					// 마커를 클릭한 위치에 표시합니다 
 					marker.setPosition(mouseEvent.latLng);
 					marker.setMap(map);

 					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
 					infowindow.setContent(content);
 					infowindow.open(map, marker);
				}   
			});
 		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		            	infoDiv.innerHTML = result[i].address_name;
		                break;
		            }
		        }
		    }    
		}
	</script>
</body>
</html>