<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
     ex01_02.jsp
  </xmp>
  
  요청 URI : <%= request.getRequestURI() %><br>
  요청 URL : <%= request.getRequestURL() %><br>
  <hr>
  
  <!-- EL의 jsp 기본 9가지 객체를 사용하고 싶다면 pageContext객체를 사용해서 얻어오면 된다 -->
  요청 URI : ${pageContext.request.requestURI};<br>
  <hr>
  <%
  	String name = "홍길동";
  	request.setAttribute("name", name);//이거 안하면 EL에서 못 써
  	int age = 20;
  	request.setAttribute("age", age);
  %>
  이름 : <%= request.getAttribute("name") %><br> <!-- 이거 대신 -->
  이름 : <%= name %><br><!-- 이렇게 쓰는 것처럼 -->
  
  이름 : ${ requestScope.name }<br> <!-- 이거 대신 -->
  이름 : ${ name }<br><!-- 이렇게 써 -->
  <hr>
  나이 : <%= request.getParameter("age") %><br>
  이름 : ${ age }<br>
</div>
</body>
</html>
