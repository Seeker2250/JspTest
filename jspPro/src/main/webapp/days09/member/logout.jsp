<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	//session.removeAttribute();
	session.invalidate();
	String location = "/jspPro/days09/ex01.jsp";
	response.sendRedirect(location);
%>