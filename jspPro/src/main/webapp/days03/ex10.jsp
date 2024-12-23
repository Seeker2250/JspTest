<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    forwarding, redirect 개념 이해
    ex10.jsp
    ex10_forward.jsp
    ex10_redirect.jsp
    ex10_finish.jsp
  </xmp>
  <%
  	String name = "admin";
  	int age = 20;
  %>
  <%-- 
  <a href="ex10_redirect.jsp?name=<%= name%>&age=<%= age%>">redirect</a>
  <a href="ex10_forward.jsp?name=<%= name%>&age=<%= age%>">forward</a> --%>
  <!-- anchor가 많다면 script로 붙여야지 -->
  <a href="ex10_redirect.jsp">redirect</a>
  <a href="ex10_forward.jsp">forward</a>
  <script>
  $("a").on("click", function(){
	  $(this).attr("href", function(index, oldHref){
		  return `\${oldHref}?name=<%= name%>&age=<%= age%>`;//GET 방식으로 달고 가
	  })
  })
  </script>
</div> 
</body>
</html>