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
    ex06.jsp
    p 190 java beans과 jsp:useBean 액션 태그
    자바 빈과 자바 빈즈는 같은 말
    	웹 어플리케이션에서 정보(게시글, 회원 등)를 표현하는 객체
    	스프링 빈과 달라
    	ㄴDTO, VO
    	servlet class가 되려면 sevlet 규약을 따라야 해(public이어야 해, HttpServlet을 상속 받아야 해, doGet()&doPost&service Overwrite)
    	Java beans도 Java beans 규약을 따라야 해
    	
    	Java beans 규약
    		private field 선언
    		getter setter 선언
    		default constructor
    		serialization 가능한 클래스 선언
    		
    	Java beans는 속성, 변경 이벤트, 객체 직렬화를 위한 표준이다.
    	
    
  </xmp>
</div> 
</body>
</html>