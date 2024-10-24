<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
     EL 수치연산자
     EL 비교연산자
     EL 논리연산자 -     && ||   !
                    and or not
  </xmp>
  
  <!-- EL3.0 도입
  의미 ? n 변수를 생성하고 10값을 할당한 후에 출력 -->
  ${ n = 10 }<br>
  
  <!-- EL3.0 도입
  여러 개의 수식을 세미콜론으로 연결할 수 있다. 수식 마지막 값이 출력된다. 여기서는 6 -->
  ${ 1+1; 10+10; 3+3 }<br>
  <hr />
  ${ 100  ==  3 }<br>
  ${ 100  eq   3 }<br>
  ${ 100  !=  3 }<br>
  <%-- ${ 100  ne  3 }<br> --%>
  ${ 100  <  3 }<br>
  ${ 100  lt  3 }<br>
  ${ 100  >  3 }<br>
  ${ 100  gt  3 }<br>
  ${ 100  <=  3 }<br>
  ${ 100  le  3 }<br>
  ${ 100  >=  3 }<br>
  ${ 100  ge  3 }<br>
  <hr />
    ${null + 3 }<br><!-- null은 long type 0처리 -->
  ${"10" + 3 }<br><!-- 숫자로 덧셈 -->
  <%-- ${"한글" + 3 }<br> --%><!-- java.lang.NumberFormatException -->
  <hr />
  ${ 10+3 }<br>
  ${ 10-3 }<br>
  ${ 10*3 }<br>
  ${ 10/3 }<br>
  <%-- ${ 10 div 3 }<br> --%>
  ${ 10%3 }<br>
  ${ 10 mod 3 }<br>
  ${ -3 }<br>
  
</div>
</body>
</html>