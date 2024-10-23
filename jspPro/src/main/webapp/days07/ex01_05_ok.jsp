<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	/* ex01_05_ok.jsp?color=black&age=20 */
	Enumeration<String> cookies = request.getParameterNames();
	while(cookies.hasMoreElements()){
		String cookieName = cookies.nextElement();
		String cookieValue = request.getParameter(cookieName);
		Cookie c = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
		c.setMaxAge(-1); //브라우저 닫으면 쿠키 자동 제거
		c.setPath("/");
		response.addCookie(c);
	}
	String location = "ex01_03.jsp";
	response.sendRedirect(location);
%>