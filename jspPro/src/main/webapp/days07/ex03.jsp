<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
	ex03.jsp
	[connection pool] 417p
	
	메서드						    설명	                                                   기본값
	setMaxTotal(int)	            풀에 관리하는 커넥션의 최대 개수를 설정한다.                         8
									음수면 제한이 없다.
									
	setMaxIdle(int)                 커넥션 풀이 보관할 수 있는 최대 유휴 개수를 지정한다.                  8
								    음수면 제한이 없다.
								    
	setMinIdle(int)	                커넥션 풀이 유지할 최소 유휴 커넥션 개수를 지정한다.
									이 값이 maxIdle 보다 크면 maxIdle을 minIdle 값으로 사용한다.	    0
									
	setBlockWhenExhausted(boolean)	풀이 관리하는 커넥션이 모두 사용 중인 상태에서 커넥션을 요청할 때         true
	                                풀에 커넥션이 반환될 때까지 대기할지 여부를 지정.
	                                true면 대기하고, false면 NoSuchElementException을 발생.
	                                
	setMaxWaitMillis(long)	        blockWhenExhausted가 true일 때, 최대 대기 시간을 설정한다.      	-1L
	                                음수면 풀에서 커넥션을 구할 수 있을 때까지 대기한다. 단위는 밀리초이다.
	                                
	C:\Tools\apache-tomcat-9.0.93\lib\tomcat-dbcp.jar을 WEB-INF에서 lib에 넣어
	Servers에 있는 context.xml 복사해서 META-INF에 넣기
	context.xml에서
	https://tomcat.apache.org/tomcat-9.0-doc/jndi-datasource-examples-howto.html에 있는 설정 넣기
	
	
	com.util.ConnectionProvider.java
  </xmp>
</div> 
<%
Context initContext = new InitialContext();
Context envContext  = (Context)initContext.lookup("java:/comp/env");
DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
Connection conn = ds.getConnection();
%>
conn = <%= conn %>
<%
	conn.close();
%>

<br>
<%
Connection conn2 = ConnectionProvider.getConnection();
%>
conn2 = <%= conn2 %>
<%
	conn2.close();
%>
</body>
</html>