<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String [] delCookieNames = request.getParameterValues("ckbCookie");
	/* JSP쿠키 삭제 : 쿠키 생성 + setMaxAge(0) => -1 주면 브라우저 닫히면 삭제 */
	for(int i=0; i<delCookieNames.length;i++){
		String cookieName = delCookieNames[i];
		String cookieValue = "";
		
		Cookie c = new Cookie(cookieName, cookieValue);
		
		c.setMaxAge(0);//돌아가자마자 쿠키 삭제
		c.setPath("/");// path /로 설정
		response.addCookie(c); //지우고 response
		
		
	}//for
	 /* response.sendRedirect("ex01_03.jsp");
		이러면 경고를 못 띄워 파라미터에 싣어서 보내도 간 다음 경고가 떠*/
%>
<script>
	alert("쿠키 삭제 완료~~");//client에서 실행되니까 경고를 띄운 후에 보낼 수 있어
	location.href = "ex01_03.jsp";
</script>