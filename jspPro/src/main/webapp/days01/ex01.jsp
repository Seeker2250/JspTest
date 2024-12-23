<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//scriptlet
	//java 코딩.
	
	String pattern = "yyyy-MM-dd hh:mm:ss";
	DateFormat dateFormat = new SimpleDateFormat(pattern);
	Date now = new Date();
	String strNow = dateFormat.format(now);
    //System.out.println("Date is " + strNow);
%>
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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">seeker Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
 <xmp class="code">
    
  </xmp>
  <h3>ex01.jsp 동적 페이지 <%= strNow %></h3><!-- 이건 expression이야. 내부적으론 scriptlet으로 바뀌어, 서버 실행 -->
  <h3>ex01.jsp 동적 페이지 <% out.println(strNow); %></h3><!-- 이건 scriptlet, 서버 실행 -->
  <!-- out이 출력 담당하는 내부 객체야 출력 스트림 객체 -->
  
  <h3>ex01.jsp 동적 페이지 : <span id="now"></span></h3><!-- 이건 client에서 실행 -->
  <script>
  	let now = '<%= strNow %>';//''로 감싸주어야 해
  	$("#now").html(now);
  </script>
</div> 
</body>
</html>