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
    jsp exception handling
    	1) try-catch-finally
  </xmp>
  	<%
  	String name = null;
    try{
    	name = request.getParameter("name");
        name = name.toUpperCase();//X		
    %>
    	name= <%= name %>
    <%
    }catch(Exception e){
    	System.out.println("뭐하다가 여기로 왔냐? name parameter 없었나보네?");
    }finally{
    	
    }
  	%>
  	<!-- 404 error-> 내가 지정한 예외 처리 페이지로 response -->
  	<br>
  	<a href="ex1000.jsp">ex1000.jsp</a>
  	<br>
  	<a href="ex1000.jsp">ex1001.jsp</a>
</div> 
</body>
</html>