<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
    <!-- head 부분 동일 -->
</head>
<body>
<header>
    <!-- header 부분 동일 -->
</header>
<div>
    <xmp class="code">ex07_02.jsp</xmp>
    <br>
    <br>
		<br>
		<div id="googleMap" style="width: 100%; height: 400px"></div>

		<script type="text/javascript">
			function myMap() {
				var lat = $
				{
					param.lat
				}
				; // request.getAttribute() 대신 param 사용
				var lng = $
				{
					param.lng
				}
				;

				var mapCanvas = document.getElementById("googleMap");
				var mapCenter = new google.maps.LatLng(lat, lng);

				var mapOptions = {
					center : mapCenter,
					zoom : 15
				};

				var map = new google.maps.Map(mapCanvas, mapOptions);

				// Overlays- [marker], 폴리라인, 폴리곤, 원/사각형, 정보창 등
				var marker = new google.maps.Marker({
					position : mapCenter,
					map : map,
					/* title: "선택한 위치" */
					animation : google.maps.Animation.BOUNCE,
					icon : "pong.png"

				});
				marker.setMap(map);
				//Overlays - 정보창(info window)
				/* let message = "<a href='http://www.naver.com'>네이버로 갑니다잇</a>"; */
				let message = "<a href='http://www.sist.co.kr'><img alt='lezhin.com 로고' src='//img-s-msn-com.akamaized.net/tenant/amp/entityid/BBFwET1.img'></a>";
				let infoWindow = new google.maps.InfoWindow({
					content : message
				});
				infoWindow.open(map, marker);
			}
		</script>
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA-TcBxG_s2_DmWIDPL9TePT9aXajPWxWA&callback=myMap"></script>
	</div> 
</body>
</html>