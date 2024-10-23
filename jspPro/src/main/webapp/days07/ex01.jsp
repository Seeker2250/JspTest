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
    쿠키(cookie)는 웹 브라우저가 보관하는 데이터(text file 형태)
    웹 브라우저는 웹 서버에 요청을 보낼 때 쿠키를 함께 전송
    웹 서버는 웹 브라우저가 전송한 쿠키를 사용해서 필요한 데이터를 읽을 수 있다.
    
    쿠키는 웹 서버와 웹 브라우저 양쪽에서 생성 가능
    JSP에서 생성하는 쿠키는 웹 서버에서 생성
    
    만료시점  -1  브라우저가 닫을 때 자동 쿠키 제거
            0  쿠키 제거
            
            별도로 만료시점을 지정하지 않으면
            브라우저가 닫힐 때 쿠키 제거(-1 주는 것과 동일)
    
    js에선 document.cookie인데 jsp에선 cookie 객체 만들어
    쿠키는 바로 생성하는 게 아니라 response.addCookie()로...
    
    request.getCookies()로 쿠키 array를 받아와
    같은 이름으로 새로운 cookie값 만들고 response.addCookie(cookie)하면 수정이야
    
  </xmp>
</div> 
</body>
</html>