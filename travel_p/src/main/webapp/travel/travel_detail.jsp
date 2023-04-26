<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8); z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d2625792f1e6e1fac26d00f60d91116c&amp;libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<body>
	<div class="container">
		<div class="row">
			<table border="1">
				<tr>
					<th>번호</th>
					<td>${travel.id }</td>
				</tr>
				<tr>
					<th>관광지명</th>
					<td>${travel.name }</td>
				</tr>
				<tr>
					<th>도로명 주소</th>
					<td>${travel.address }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${travel.phone }</td>
				</tr>
				<tr>
					<th>관광지 설명</th>
					<td>${travel.content }</td>
				</tr>
				<tr>
					<th>위도 / 경도</th>
					<td>${latitude } / ${longtitude }</td>
				</tr>
			</table>
		</div>
		</div>
		<table border="1">
			<c:forEach var="food" items="${foodList }">
				<tr>
					<td>${food.name} </td>
					<td>${food.address} </td>
					<td>${food.phone} </td>
				</tr>
			</c:forEach>
		</table>
		
		<table border="1">
			<c:forEach var="tra" items="${travelList}">
				<tr>
					<td>${tra.name }</td>
					<td>${tra.address }</td>
					<td>${tra.phone }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="map_wrap">
		    <div id="map" style="width:350px;height:350px;position:relative;overflow:hidden;"></div>
		    <div class="hAddr">
		        <span class="title">지도중심기준 행정동 주소정보</span>
		        <span id="centerAddr"></span>
		    </div>
		</div>
		<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
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
			var content = '<div style="padding:5px;"><b>${travel.name}</b><br><a href="https://map.kakao.com/link/map/${travel.name},${latitude},${longtitude}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${travel.name},${latitude},${longtitude}" style="color:blue" target="_blank">길찾기</a></div>';
			infowindow.setContent(content);
        	infowindow.open(map, marker);
			
			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			
			// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
				searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
					if (status === kakao.maps.services.Status.OK) {
						var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
						detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
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