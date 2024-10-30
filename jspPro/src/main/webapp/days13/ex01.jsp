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
    ex01.jsp
    답변형(계층형) 게시판
		
	days13.replyboard.command 패키지
		CommandHandler.java interface
		LIstHandler.java    
    days13.replyboard.controllor 패키지
    	DispatcherServlet.java 컨트롤러 web.xml 등록    
    days13.replyboard.domain      패키지    
    	ReplyBoardDTO.java
    days13.replyboard.persistence 패키지 
    	IReplyBoard.java   인터페이스
	    ReplyBoardDAO.java  클래스 
    days13.replyboard.service 패키지
    	ListService.java
    days13
    	ㄴreplyboard
    		ㄴlist.jsp  
  </xmp>
  <a href="/jspPro/days13/replyboard/list.do">목록보기</a><br>
</div> 
</body>
</html>