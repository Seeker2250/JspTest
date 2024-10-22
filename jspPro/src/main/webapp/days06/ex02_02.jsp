<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="/WEB-INF/error/viewErrorMessage.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    ex02에서는 try catch finally로 예외처리 했어
    여기선 예외가 발생할 때 따로 설정한 예외 페이지를 response하는거야.
    
    WEB-INF(client는 접근 못하게)
    	ㄴ error
    	 	ㄴ viewErrorMessage.jsp
    	 	
   [응답 상태 코드]
          200 : 요청을 정상적으로 처리
          401 : 접근을 허용하지 않음( 권한 관련 )
          400 : 클라이언트의 요청이 잘못된 구문으로 구성.
          403 : PUT 요청 X
          404 : 요청URL을 처리하기 위한 자원이 존재하지 않음
          405 : 요청한 method를 허용하지 않아
          500 : server 내부 error(jsp exception 등)
          503 : 서버가 일시적으로 서비스 제공 불가(DDOS, 임시 보수 등)
          등등        	 	
    
    예외 타입별 예외 페이지를 설덩
   		[예외 타입]
    	NullPointException
    	SQLException 등
    	
    우선 순위
    	1. page지시자(directive) errorPage 속성 설정
    	2. web.xml	<exception-type>
    	3. web.xml <error-code>
    	4. tomcat(web container)에서 지정한 예외 페이지
  </xmp>
  name : <%= request.getParameter("name").toUpperCase() %>
  <!-- <%-- %><%@ page errorPage="/WEB-INF/error/viewErrorMessage.jsp" %>--%>랑 겹치면
					  가장 우선순위가 높은 건 page처리
					  그 다음엔 exception-type으로 지정한 거
					  그 다음에 error-code로 지정한 거
					  그 다음엔 기본 error페이지 -->
</div> 
</body>
</html>