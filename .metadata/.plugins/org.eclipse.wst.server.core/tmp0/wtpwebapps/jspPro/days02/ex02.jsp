<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    상대경로 		   X
    http:// 절대경로 X
    
    /jspPro/days02/ex01_emp_02.jsp?deptno=10&deptno=30
    /jspPro 오면 webapp까지 온 것
    context path로 같은 포트의 같은 서버여도 여러 프로젝트를 구분하는 것
  </xmp>
  
  <%
  	String contextPath = request.getContextPath();
  %>
  context path = <%= contextPath %>
 <img alt="" src='<%= contextPath %>/images/어쩌구'>
</div> 
</body>
</html>