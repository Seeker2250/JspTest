<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost/jspPro/images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">Seeker Home</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div>
		<xmp class="code"> </xmp>
		<a href="ex01_02.jsp?lat=37.499294&lng=127.0331883">(주)쌍용교육센터</a> <br>
		<div id="googleMap" style="width: 100%; height: 400px"></div>

	</div>

	<script>
		function myMap() {
			var mapOptions = {
				center : new google.maps.LatLng(51.508742, -0.120850),
				zoom : 5
			};
			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapOptions);
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=your map api key&callback=myMap"></script>

	<!-- Maps JavaScript API 검색
		구글 지도 API 키 발급 받는 방법 (Maps JavaScript API)
		https://blog.cosmosfarm.com/archives/389/%EA%B5%AC%EA%B8%80-%EC%A7%80%EB%8F%84-api-%ED%82%A4-%EB%B0%9C%EA%B8%89-%EB%B0%9B%EB%8A%94-%EB%B0%A9%EB%B2%95-maps-javascript-api/
 -->
	</div>
</body>
</html>