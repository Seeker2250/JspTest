<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%--
 <%
	모든 페이지에 공통적으로 선언할 변수가 있다고 가정한다면
	String contextPath = request.getContextPath();
%> 
--%>
<%@ include file="/WEB-INF/inc/include.jspf" %>
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
	<!-- TOP 공통 모듈 -->
	<%-- <jsp:include page="/layout/top.jsp" flush="false"></jsp:include> --%>
	<!-- 서버에서 실행된다. -->
	<%@ include file="/layout/top.jsp" %>
	<div>
		<xmp class="code">
		 페이징 모듈화 - include 지시자 사용 
		 					ㄴ 공통적으로 사용하는 변수 선언 가능
		 					  모든 페이지에서 contextPath가 필요하다면
		 					  WEB-INF
		 					  	  ㄴinc 폴더 추가(include)
		 					  	  		ㄴ include.jspf
		 					  	  		
		 					
		 					
		 이건 servlet이 하나야 ex04_template은 각각 servlet이 있지만 이건 내부 로직이 엄청 달라!
		 코드를 여기에 삽입하냐, 실행 흐름을 그쪽에 맡기냐의 차이
		 template02에선 scriptlet 하나 선언한 거 응용할 수 있는데 template에선 안돼
		 굳이 응용할 거라면, <%-- <jsp:param value="변수명" name="이름"> --%> 이러면 '이름'이란 parameter 쓸 수 있게 돼
		</xmp>

		<table>
			<tr>
				<td>
				<%-- <jsp:include page="/days06/layout/left.jsp" flush="false"></jsp:include> --%>
				<%@ include file="/days06/layout/left.jsp" %>
				</td>
				<td>
				회원 관리 Content 부분<br>
				회원 관리 Content 부분<br>
				회원 관리 Content 부분<br>
				회원 관리 Content 부분<br>
				회원 관리 Content 부분<br>
				</td>
				<td>
				<%-- <jsp:include page="/days06/layout/right.jsp" flush="false"></jsp:include> --%>
				<%@ include file="/days06/layout/right.jsp" %>
				</td>
			</tr>
		</table>

	</div>

	<!-- BOTTOM 공통 모듈 -->
	<%-- <jsp:include page="/layout/bottom.jsp" flush="false"></jsp:include> --%>
	<%@ include file="/layout/bottom.jsp" %>
	<!-- 서버에서 실행된다. -->
</body>
</html>