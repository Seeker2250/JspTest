<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    ex01_03으로 도착했당 하하~!
  </xmp>
  p name : <%= pageContext.getAttribute("name") %><br><!-- 그냥 띄우면 null, 02에서 오면 값 X -->
  r age : <%= request.getAttribute("age") %><br><!-- 그냥 띄우면 null, 02에서 오면 값 X, 새로운 요청이고 forwarding 안해서 null -->
  s addr : <%= session.getAttribute("addr") %><br><!-- 그냥 띄우면 null, 02에서 오면 값 O, 껐다 키면 사라져-->
  a tel : <%= application.getAttribute("tel") %><br><!-- 그냥 띄우면 null, 02에서 오면 값 O, 껐다 켜도 남아있어 -->
</div> 
</body>
</html>