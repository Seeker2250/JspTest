<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    ex02_07.jsp
    국제화 fmp 접두어
    	ㄴ 특정 지역에 따라 알맞은 메시지 출력할 때(단위 변경 등)
    	주로 사용되는 곳 : 숫자 / 날짜 formatting
    	
    	fmt : formatNumber
    	fmt : formatDate
    	fmt : parseNumber
    	fmt : parseDate
  </xmp>
  <%
  	String strPrice = "1,200.32";
  	//String 문자열을 1200.34 실수형으로 formatting
  	double dPrice = Double.parseDouble(strPrice.replaceAll(",", ""));
  %>
  double Price = <%= dPrice %><br>
  <hr>
  <fmt:parseNumber value="<%=strPrice %>" pattern="0,000.00" var="dPrice2"/>
  double Price2 = ${ dPrice2 }<br>	  
  
  <hr>
  <%
  	long price = 51759;
  	// 51,759.00로 바꾸고 싶다면?
  				
  %>
  <c:set value="<%= price %>" var="lprice"></c:set>
  	long price = ${lprice }<br>
  
  
  <fmt:formatNumber value="${lprice}" var="sPrice" type="number" pattern="##,###.00"/><!-- 0은 없더라도 자리를 메꾸잔 의미 -->
  String price = ${sPrice }<br>
  
</div> 
</body>
</html>