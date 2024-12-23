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
        1. [Ajax] 에이작스,  아작스    
    [A]synchronous  [J]avascript   [A]nd  [X]ML 
    비동기적인          자바스크립트   +     XML
    
    => XML 데이터(요즘은 JSON)를   자바스크립트언어 
       비동기적으로 처리하는 기술.
       
    2. 비동기적([A]synchronous) ?  
	    페이지 로드 된 후에도  웹 서버에서 데이터를
	    읽어와서 사용 가능.
	    페이지 전체가 새로 고침되지 않고 
	    웹 페이지 일부분만 업데이트 가능.
	    현재 페이지는 유지된 채로 백그라운드에서
	    웹 서버와 통신하는 것.
      
    3. 네이버 메인 페이지의 환율, 증시, 날씨 정보..
       
    4. ajax 장점 
       성능 향상
       개발 향상       
       각각 서버로 부터 분산 처리 가능
       
    5. ajax 단점
       js  보안적인측면이 취약하다. 
       차별화 X
       브라우저 호환성 체크
        
    6. js ajax 처리 순서(과정)
       1) 웹 페이지에서 이벤트 발생.
       2) XMLHttpRequest 객체 생성, 브라우저가 기본적으로 제공하는 객체(BOM, 서버에 다녀와)
       3) XMLHttpRequest 객체 설정.
           ㄱ. 요청 설정
              open() 메서드 - 요청 필요한 설정
              send() 메서드 - 실제 서버에 요청감.
              
              A) get 방식
              XMLHttpRequest객체.open("GET", "/test.jsp?id=admin", true);
              XMLHttpRequest객체.send();
              B) post 방식
              XMLHttpRequest객체.open("POST", "/test.jsp", true);
              							true가 비동기, false가 비동기
              XMLHttpRequest객체.send("id=admin");
              
              
           ㄴ. XMLHttpRequest 객체 - on readystatechange 이벤트 속성
             
            if( state = 200 + readState == 4 ) 
                // 응답 데이터
                1) 텍스트(JSON) - responseText 속성 JSON도 문자열이니까
                2) xml          - responseXML 속성
                
                0 (UNSENT): XMLHttpRequest 객체가 생성되었지만, open() 메서드가 호출되지 않은 상태.
				1 (OPENED): open() 메서드가 호출되었지만, send() 메서드가 아직 호출되지 않은 상태.
				2 (HEADERS_RECEIVED): send() 메서드가 호출되어, 서버로부터 응답 헤더를 수신한 상태.
				3 (LOADING): 서버로부터 응답 데이터를 일부 수신한 상태.
				4 (DONE): 요청이 완료되고, 응답 데이터를 모두 수신한 상태.
				
			실습)
				ex03.jsp에서 js 이용한 AJAX
				ex03_02.jsp에서 jQuery 이용한 AJAX
				
				ex03_ajax_info.txt추가 
  </xmp>
</div> 
</body>
</html>