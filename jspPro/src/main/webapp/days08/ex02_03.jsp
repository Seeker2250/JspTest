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
     ex02_03.jsp
  </xmp>
  
  <!-- input 태그가 하나 있는데 form 태그로 묶어 놓으면 submit 된다. -->
  <form action="">
  국어 : <input type="text" name="kor">
  </form>
  
  <!-- ex02_03.jsp?kor=10 -->
  kor = ${ param.kor }<br>
  empty kor = ${ empty param.kor }<br>
  not empty kor = ${ not empty param.kor }<br>
  
  <c:if test="${ not empty param.kor }">
     <!--
     c:set 태그 사용한 변수 선언 + 초기화
     score : EL에서 사용할 이름 (변수명)
     value
     -->
     <c:set var="score" value="${ Math.floor( param.kor / 10 ) }" scope="page"></c:set>
     <c:choose>
        <c:when test="${ score eq 10 or score == 9 }">수</c:when>
        <c:when test="${ score eq 8 }">우</c:when>
        <c:when test="${ score eq 7 }">미</c:when>
        <c:when test="${ score eq 6 }">양</c:when>
        <c:otherwise>가</c:otherwise>
     </c:choose>
  </c:if>
</div>
</body>
</html>