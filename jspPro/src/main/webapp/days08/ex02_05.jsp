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
    ex02_05.jsp
    
    c:forEach문
	    	begin 
	    	end 
	    	step 
	    	var 
	    	items 
	    	varStatus 
  </xmp>
  <c:forEach begin="5" end="13" step="2" var="i" varStatus="vstatus">
  ${ i } / ${vstatus.index }<br>
  / ${vstatus.count }<br>
  / ${vstatus.first}<br>
  / ${vstatus.last }<br>
  <br>
  </c:forEach>
  


	<%-- 1부터 10까지 더하기 --%>
	<c:forEach begin="1" end="10" var="i" varStatus="vstatus">
   	 <%-- <c:if test="${i < 10}"> + </c:if> --%> 
   	 ${i += (vstatus.last?"":"+") }
   	 <c:set var="sum" value="${sum + i}" />
	</c:forEach>
	= ${sum}

</div> 
</body>
</html>