<%@page import="com.util.Cookies"%>
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
    EL3.0에서 cookie 사용
  </xmp>
  <%
  	/* js document.cookie 속성
  	   jsp Cookie 클래스 response.addCookie()
  	   request.getCookies()
  	   */
  	   Cookie c = Cookies.createCookie("user", "admin");
  	   response.addCookie(c);
  	   
  	 c = Cookies.createCookie("age", "20");
  	response.addCookie(c);
  	 c = Cookies.createCookie("addr", "Seoul");
  	response.addCookie(c);
  %>
  <a href="ex01_03_ok.jsp">ex01_03_ok.jsp로~</a>
  
</div> 
</body>
</html>