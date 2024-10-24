<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
  <!-- c:out JspWriter 출력 stream object에 의해 출력 -->
  <%
  	String message = "<h3>Hello World</h3><br>홍길동<br>";
  	/* <는 &lt;로, >는 &gt;로 안 바꿔도 그대로 출력할 수 있어 */
  %>
  <p id="demo"><%= message %></p>
  <br>
  <c:out value="<%= message %>"></c:out>
  <hr>
  
  <c:set value="홍길동./,이시훈,김선우" var="names"></c:set>
  <c:forTokens items="${names }" delims=".,/" var="name">
  <li>${name }</li>
  </c:forTokens>
  
  
  
  
  
  <hr>
  <!-- Map + c:forEach -->
  <%
    Map<String, String> map = new HashMap<>();
    map.put("id","admin");  // entry
    map.put("name","관리자");
    map.put("age","20");
  %>
  <c:set var="map" value="<%= map %>"></c:set>
  <c:forEach items="${ map }" var="entry">
    <li>${ entry.key } - ${ entry.value }</li>
  </c:forEach>







  
  <%
  	/* 배열을 c:forEach tag를 사용하여 처리 */
  	int [] m = {3,5,2,4,1};

  %>
  <c:set value="<%= m %>" var="arr"></c:set>
  <c:forEach items="${arr}" var="i" varStatus="vs">
  	<li>m[${vs.index }] = ${i}</li>
  </c:forEach>
</div> 
</body>
</html>
