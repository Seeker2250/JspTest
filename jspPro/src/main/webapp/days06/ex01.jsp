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
    days06.ex01.jsp
    p132(pdf는 134) : jsp 기본 객체와 영역
    하나의 웹페이지에서 사용할 수 있는 영역(scope)						JSP에 내장된 9가지 객체
    	1) PAGE scope : 하나의 jsp 페이지 처리할 때 사용, 			pageContext객체        forwarding하면 다른 객체
    	2) REQUSET scope : 하나의 http요청을 처리할 때 사용, 		request 기본 객체       forwarding해도 똑같은 객체, request.setAttribute()가 여기에 저장하는거야, redirect는 새로운 요청이랑 유지 안되니까 forwarding으로 유지해야해
    	3) SESSION scope : 하나의 웹 브라우저와 관련, 				session 기본 객체       사람마다 하나
    	4) APPLICATION scope : 하나의 웹 어플리케이션과 관련, 		application 기본 객체   server가 시작하면 만들어져(모든 사용자가 공유)
    	
    method
    	setAttribute()		    void
    	getAttribute()			Object
    	removeAttribute()		void
    	getAttributes()			Enumeration
    	
    	ex01_02, ex01_03 확인
  </xmp>
</div> 
</body>
</html>