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
    내장 객체 - request object
    		  jsp에서 가장 많이 사용되는 객체
    		  client와 요청과 관련.
    		  쿠키 읽기, 여러 속성 처리
    		  
    		  74p
    		  client IP   : <%= request.getRemoteAddr()%>
    		  전송 방식     : <%= request.getMethod()%>
    		  요청 URL     : <%= request.getRequestURI()%>
    		  요청 URL     : <%= request.getRequestURL()%>
    		  context 경로 : <%= request.getContextPath()%>
    		  
    		  
    		  
    		  요청 정보 길이 : <%= request.getContentLength() %> <br>
			  요청의 인코딩 : <%= request.getCharacterEncoding() %> <br>
			  요청 정보 컨텐츠 타입 : <%= request.getContentType() %> <br>
		      요청 정보 프로토콜 : <%= request.getProtocol() %> <br>
			  서버 이름 : <%= request.getServerName() %> <br>
    		  
    		  
  </xmp>
</div> 
</body>
</html>