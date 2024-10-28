<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }  
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">Seeker Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
 <xmp class="code">
    ex07_04.jsp
    지도 위에서 마우스를 클릭하면 이벤트 처리
    (마커 표시, 정보창 표시)
  </xmp>
   <br>
  <div id="googleMap" style="width: 100%;height:400px"></div>
  
   <script>
   // 랜덤값 발생시키는 함수
   function getRndNumber(min, max) {
       return (Math.random() * (max - min) ) + min;
   }
   
   function myMap() {
     
    var lat = 37.499308;
    var lng = 127.033191;
    var mapCanvas =  document.getElementById("googleMap");
    var mapCenter = new google.maps.LatLng(lat, lng);
     var mapOptions = {
           center: mapCenter //지도 중앙 배치
             , zoom: 15 //지도 확대 축소 기준
     };
     var map = new google.maps.Map( 
           mapCanvas
           , mapOptions
     );
     
     // 지도 위에 클릭할 때
     map.addListener("click", (event)=>{
        // console.log(event.latLng);
        placeMarker(map, event.latLng);
     });
  } // myMap
  
  function placeMarker(map, mapCenter){
     // 1. 마커 표시
     let marker = new google.maps.Marker({
          position: mapCenter
      });
     marker.setMap(map);
     // 2. 정보창 표시
     let message = `lat=\${mapCenter.lat()}<br>
        lng=\${mapCenter.lng()}<br>
                       `
      let infoWindow = new google.maps.InfoWindow({
         content:message
      });
      infoWindow.open( map, marker );
      
  }
</script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCygZLFcQgVppMv9sxAQ4UStANJhRQUITg&callback=myMap"></script>
</div> 
</body>
</html>