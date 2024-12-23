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
        파일첨부 1개 +  게시글 -> 자료실
                    제목    
    1. 테이블 , 시퀀스 생성
    create table filetest(          
     num number not null primary key  
     , subject varchar2(50) not null     
     
     , filesystemname varchar2(100) -- 실제 저장되는 파일명       a1.txt
     , originalfilename varchar2(100) -- 저장할 때 파일명             a.txt
     , filelength number  -- 파일크기
    );
    
   create sequence seq_filetest;   
   
   MVC 비슷하게 개념... ~    
   
   실습)
      days09 패키지
         ㄴFileTestDTO.java                         
         ㄴFileTestDAO.java                        
         ㄴFileTestServlet.java          컨트롤러처럼 모든 요청처리(handler는 안 만들거야 요청 직접 처리)
      days09 폴더
         ㄴ ex06_list.jsp                  list.ss요청
         ㄴ ex06_write.jsp                 write.ss요청              
         ㄴ ex06_update.jsp                update.ss요청
  </xmp>
  
  <a href="/jspPro/days10/list.ss">자료실 목록보기</a>
</div> 
</body>
</html>