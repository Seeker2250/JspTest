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
    [jsp 내장 기본 객체 : response]
		ㄴ web browser에 응답 정보를 담는 object
			ㄴ header 정보 다루기
			ㄴ redirect
			    
			redirect와 fowarding의 차이
				ㄴ 
				
		 특징	Redirect					Forwarding
	 동작 방식	클라이언트 측에서 새로운 요청		서버 내부에서 요청 전달
HTTP 상태 코드	302 (Found, Redirect)	    없음 (내부 요청으로 처리)
 	 URL 변경	클라이언트의 URL이 변경됨	    클라이언트의 URL이 변경되지 않음
	 요청 횟수	2개의 HTTP 요청	            1개의 HTTP 요청
    데이터 전달	request 데이터 유지되지 않음	    request 데이터 유지됨
  </xmp>
</div> 
</body>
</html>