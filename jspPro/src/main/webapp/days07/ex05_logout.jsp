<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/inc/session_auth.jspf" %>
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

<%
	//session 자동 종료
	/* session.setMaxInactiveInterval(10); */
	//session 세션 객체를 무효화(삭제)하는 method 해당 세션에 저장된 모든 데이터를 제거, 세션 자체를 종료
	session.invalidate();		
	/* 로그인 해야만 글을 쓸 수 있고, 글 쓴 사람만 삭제할 수 있게 해보자고 */
%>
<script>
	alert("<%=logonId%>님 로그아웃 완료~~");//client에서 실행되니까 경고를 띄운 후에 보낼 수 있어
	location.href = "ex05_default.jsp";
</script>