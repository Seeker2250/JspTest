<%@page import="java.net.URLDecoder"%>
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
    ex01_03.jsp
    모든 쿠키 정보를 얻어와서 체크박스로 만들어 출력
  </xmp>
  <form>
  	<%
  		Cookie[] cookieArr = request.getCookies();
  		//서버 요청하러 올 때 가지고 오는 모든 cookie를 받을거야
  		if (cookieArr != null && cookieArr.length > 0) {
  			for(Cookie c :cookieArr){
  				String cname = c.getName();
  				String cvalue = URLDecoder.decode(c.getValue(), "UTF-8");//주의사항 : 한글이면 URLDecoder.decode()
	%>
  				<input type="checkbox" name="ckbCookie" value="<%= cname %>">
  				<%= cname%> :  <%= cvalue %> 
  				<br>
  	<%
  			}//for
  		}//if
  	%>
  	<br>
  	
  	
  </form>
  <a href="ex01.jsp">쿠키</a><br>
  	<a href="ex01_02.jsp">쿠키 생성</a><br><br>
  	
  	수정, 삭제할 쿠키를 체크한 후 쿠키 수정, 삭제<br><br>
  	
  	<a href="ex01_04.jsp">쿠키 삭제</a><br>
  	<a href="ex01_05.jsp">쿠키 수정</a><br>
  	
  	
  	<script type="text/javascript">
  	/* 쿠키 삭제 링크 태그
  	
  	$("div a").eq(2).on("click", function(e){
  		e.preventDefault();
  		alert("test");
  		$("form").attr("action", "ex01_04.jsp");
  	}) */
  	$("div a").eq(2).on("click", function(e){
  		e.preventDefault();
  		let url = $(this).attr("href");
  		/* $(":checkbox:checked").each(); */
  		// ?ckbCookie=id&ckbCookie=color
  		//alert($("form").serialize());//queryString 만들어줘
  		let queryString = $("form").serialize();
  		location.href = `\${url}?\${queryString}`;
  	});
  	</script>
  	<script>
	  	$("div a").last().on("click", function(e){
	  		e.preventDefault();
	  		let url = $(this).attr("href");//ex01_05.jsp
	  		let queryString = $("form").serialize();
	  		location.href = `\${url}?\${queryString}`;
	  	})
  	</script>
</div> 
</body>
</html>