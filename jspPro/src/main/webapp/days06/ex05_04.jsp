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
    ex05_04.jsp
    pageContext 객체
    	ㄴ jsp 기본 내장 객체 얻어올 수도 있다.
    	  (custom tag 만들 때 사용)
    	  지금이라면 request 객체를 그냥 쓰면 되지만 
    	  custom tag는 request = pageContext.getRequest()로 쓴다
    	  			response = pageContext.getResponse()
    	  			out = pageContext.getOut();
    	  			application = pageContext.getServletContext();
    	  			등등
    	  			
    	ㄴ 에러 데이터 구하기
    	ㄴ 페이지 흐름 제어
    	ㄴ 속성 처리
    		page 영역
    		pageContext.setAttribute();
    		pageContext.getAttribute();
  </xmp>
</div> 
</body>
</html>