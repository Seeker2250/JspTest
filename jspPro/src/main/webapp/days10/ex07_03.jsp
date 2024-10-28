<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">Love</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
     쌍용 임의의 위치에 맛집 마커 표시.                        
  </xmp>
  
    <br>
  <div id="googleMap" style="width: 100%;height:400px"></div>
  <!-- 37.499308, 127.033191 -->
  
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
           center: mapCenter
             , zoom: 15
     };
     var map = new google.maps.Map( 
           mapCanvas
           , mapOptions
           );
     
     // 한독빌딩 주위 임의 10군데 마커표시 반복
     let mlat, mlng, markerPosition;
     for (var i = 0; i < 10; i++) {
        mlat = lat + getRndNumber( -0.006, 0.006);
        mlng = lng + getRndNumber(-0.006, 0.006);
        
        // marker 뿌려질 위치.
        markerPosition = new google.maps.LatLng(mlat,mlng);
        
        let marker = new google.maps.Marker({
           position:markerPosition
           /* animation: google.maps.Animation.BOUNCE,
           icon: "KakaoTalk_20241028_152916597.png" */
         });
         marker.setMap(map); // 지도에 마커 설정~
         // 정보창
         let message = `맛집-\${i+1}`;
        let infoWindow = new google.maps.InfoWindow({
           content:message
        });
        infoWindow.open( map, marker );
   } // for
     
     /*
     // Overlays - 마커, 폴리라인, 원, 정보창 등. 표시가능
     let marker = new google.maps.Marker({
          position:mapCenter,
          animation: google.maps.Animation.BOUNCE,
          icon: "KakaoTalk_20241028_152916597.png"
        });
        marker.setMap(map); // 지도에 마커 설정~
        
        // Overlays - 정보창(info window)
        // let message = "<a href='https://www.sist.co.kr/index.jsp'>쌍용~</a>";
        let message = "<a href='http://www.sist.co.kr'><img alt='lezhin.com 로고' src='//img-s-msn-com.akamaized.net/tenant/amp/entityid/BBFwET1.img'></a>";
        let infoWindow = new google.maps.InfoWindow({
           content:message
        });
        infoWindow.open( map, marker );
     
     */
     
  }
</script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA-TcBxG_s2_DmWIDPL9TePT9aXajPWxWA&callback=myMap"></script>
  
</div> 
</body>
</html>










