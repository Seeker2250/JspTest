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
    
  </xmp>
  <p id="demo">
  	<ul>
  	
  		<%-- 1번 풀이에 사용
  		<%  // ex01_ok.jsp?empno=123/456/789 ... /로 나눠
  			String pempnos = request.getParameter("empnos");
  			String [] empnoArr = pempnos.split("/");
  			for(int i=0; i<empnoArr.length; i++){
  		%>
  			<li><%= empnoArr[i] %></li>
  		<%
  			}
  		%> 
  		--%>
  		
  		
  		<!-- 2번 풀이에 사용 -->
  		<%
  			String [] empnos = request.getParameterValues("xempno");
  		for(int i = 0; i < empnos.length; i++){
  		%>
  			<li><%= empnos[i] %></li>
  		<%
  			}
  		%>
  	</ul>
  </p>
  
</div> 
</body>
</html>