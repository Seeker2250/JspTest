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
    ex07_MVC
    p516 Chapter18 MVC 패턴 구현!@~!@#@!!@$@!$ 제일 중요해
    Model 2 Pattern
    출력   - view
    로직   - model, Business logic, Java Beans나 Service도 포함되는 경우가 있어
    서블릿  - controller, 입력 처리 & 흐름 제어 
    
    
    days04.board directory
    days04.board package
    
    ->MVC패턴으로 변환해보자
    days07.mvc.domain		: BoardDTO.java
    days07.mvc.persistence  : BoardDAO.java(Interface)
    						  BoardDAOImpl.java(implement class)
    						  
    days07.mvc.command	    : 로직 처리 담당 class들
    		   CommanHandler interface
    		   			public String process();
    		   	ListHandler.java(implement class)
    		   	WriteHandler.java(implement class)
    days07.mvc.service	    : service class(DB처리, 로그 기록 등 transaction 처리)
    days07.mvc.controller   : controller(servlet, 모든 요청을 받고 일 시키고 결과물 view에 forwarding...)
       commandHandler.properties 파일
       /jspPro/board/list.do=ListHandler
       
       controller servlet은 web.xml에 등록
       
       web.xml 복사해서 web_days07.xml로 보관
       tomcat 시작 -> web.xml을 읽어 들여서 설정들 실행
       -> Controller가 모든 요청을 받는 1개의 servlet이기 때문에 servlet이 web.xml에 등록되어있어.
       -> 
  </xmp>	
  
  <a href="/jspPro/board/list.do">/board/list.do</a>
  
  <!-- 
  
  board_commandHandler
  ->ListHandler
  ->/days07/board/list.jsp
  
  -->
  
</div> 
</body>
</html>