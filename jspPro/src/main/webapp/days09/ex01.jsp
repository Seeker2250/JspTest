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
     <c:choose>
        <c:when test="${ empty auth }">
        <!-- session에 ("auth", id)로 저장하기로 했잖아
  			 이거 null인지 아닌지 확인 
  			 이렇게 하면 모든 scope 돌고 null이나 0이면 true니까 이게 true면 id가 없단 거-->
           <li><a href="${ pageContext.request.contextPath }/days09/member/logon.jsp">로그인</a></li>
        </c:when>
        <c:otherwise>
           <li>[${ auth }] <a href="${ pageContext.request.contextPath }/days09/member/logout.jsp">로그아웃</a></li>
        </c:otherwise>
     </c:choose>
    <li><a href="${ pageContext.request.contextPath }/days09/member/addmember.jsp">회원가입</a></li>
  </ul>
</header>
<div>
 <xmp class="code">
    ex01.jsp
    	 ㄴ       admin 폴더 ( 관리자 계정으로 인증 )
                   ㄴ 회원관리페이지(membermanage.jsp)
                   ㄴ 급여관리페이지(paymanage.jsp)
                   
                   필터 : 관리자 + 인증/권한 체크    
                   ( LoginCheckFilter.java )               
                   
         ㄴ       board 폴더
                   ㄴ 글목록페이지 (list.jsp)  인증 필요X
                   ㄴ 글쓰기페이지 (write.jsp) 인증 필요
                   
         ㄴ       member 폴더  
                   ㄴ 회원가입페이지( addmember.jsp )
                   ㄴ 로그인 페이지( logon.jsp) + logon_ok.jsp
                   ㄴ 로그아웃 페이지 (logout.jsp)
  </xmp>
  <!-- 인증 X -->
  <!-- <a href="/jspPro/days09/board/list.jsp">게시판 글 목록</a> -->
  <a href="${pageContext.request.contextPath}/days09/board/list.jsp">게시판 글 목록</a>
  <br>
  
  <!-- 인증 O -->
  <a href="${pageContext.request.contextPath}/days09/board/write.jsp">게시판 글 쓰기</a>
  <br>
  
  <!-- 인증 O + 관리자 계정-->
  <a href="${pageContext.request.contextPath}/days09/admin/membermanage.jsp">회원 관리</a>
  <br>
  
</div> 
</body>
</html>