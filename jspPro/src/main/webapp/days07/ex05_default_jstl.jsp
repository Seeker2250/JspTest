<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/inc/session_auth.jspf"%>
<%
/*
인증을 받았나 안 받았나, admin 권한이 있나 없나
session을 사용해서 인증처리
auth 세션이름 = 로그인ID만 저장하자
*/
/* String sname = "auth";
String logonId = null;
logonId = (String)session.getAttribute(sname); *///return이 Object여서 down casting 필요
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost/jspPro/images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">Seeker Home</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div>
		<xmp class="code"> ex02_default_jstl.jsp </xmp>


		<c:if test="${empty logonId }">
			<!-- null이냐 아니냐 -->
			<div id="logon">
				<form action="ex05_logon.jsp">
					아이디 : <input type="text" name="id" value="admin" /><br> 비밀번호
					: <input type="password" name="passwd" value="1234" /><br> <input
						type="submit" value="로그인" /> <input type="button" value="회원가입" />
					<span style="color: red; display: none">로그인 실패했습니다.</span>
				</form>
			</div>
		</c:if>
		<c:if test="${not empty logonId }">
			<!-- not 대신 !가능 -->
			<div id="logout">
				[<%=logonId%>]님 환영합니다<br> <a href="ex05_logout.jsp">로그아웃</a>
			</div>
		</c:if>

		<br>
		<!-- 로그인 X -->
		<a href="/jspPro/cstvsboard/list.htm">게시판</a><br>

		<c:if test="${not empty logonId }">
			<a href="#">자료실</a>
			<br>
			<a href="#">일정관리</a>
			<br>
		</c:if>
		<c:if test='${not empty logonId and logonId eq "admin"}'>
			<a href="#">급여관리</a>
			<br>
			<a href="#">인사관리</a>
			<br>
		</c:if>



		<script>
  	/* 로그인 실패 후 ex05_default.jsp?logon=fail */
  	if( ${ param.logon eq "fail"} ){
     $("#logon span")
        .fadeIn()
        .fadeOut(3000);
  		}           
  </script>
	</div>
</body>
</html>