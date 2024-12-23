<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
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
    
  </xmp>
  <%
  	Cookies cookies = new Cookies(request);
  	Set<Entry<String, Cookie>> set = cookies.cookieMap.entrySet();
  	Iterator<Entry<String, Cookie>> ir = set.iterator();
  	
  	while(ir.hasNext()){
  		Entry<String, Cookie> entry = ir.next();
  		String cname = entry.getKey();
  		Cookie c = entry.getValue();
  		String cvalue = c.getValue();
  		%>
  		<li><%= cname %> : <%= cvalue %></li>
  	<%
  	}

  	 %>
  	 <!-- 위에꺼를 EL로 -->
  	 <hr>
  	 <c:forEach items="${cookie}" var="entry">
  	 <li>${entry.key } : ${entry.value.value }</li><!-- entry.value는 쿠키 객체 그 자체니까 -->
  	 
  	 </c:forEach>
  	 <hr>
 		EL user : ${cookie.user.value }<br>
 		EL addr : ${cookie.addr.value }<br>
 		EL age : ${cookie.age.value }<br>
</div> 
</body>
</html>