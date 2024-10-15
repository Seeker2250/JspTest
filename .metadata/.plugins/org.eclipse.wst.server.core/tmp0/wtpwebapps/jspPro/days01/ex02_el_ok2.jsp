<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	

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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">Seeker Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
 <xmp class="code">
    
  </xmp>
  jsp EL 형식 사용 <br>
  책 제목 : ${param.title} <br>
  책 저자 : ${param.author}<br>
  나이 : ${param.age} <br>
  <br>
  <a href="javascript:history.go(-1);">history로 이전 페이지 뿌리는 뒤로 가기</a><!-- history에서 쓴 거라 server 안들러도 뒤로가기 돼  -->
  <br>
  <a href="ex_02.jsp;">서버에 요청해서 응답받는 뒤로 가기</a>
  
</div> 
</body>
</html>