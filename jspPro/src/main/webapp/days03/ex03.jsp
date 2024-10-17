<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
 <xmp class="code">
    jsp 구성 요소
    jsp 스크립트
    	1)js 스크립트릿 - 자바 코딩
    	2) 표현식 - 출력 스트림(EL, 표현언어와는 다르다)
    	3) 선언문 - variable, method 선언
    	
    	

		metadata 확인
	    days03
		ex03.jsp->ex03_jsp.java->ex03_jsp.class
			  서블릿 클래스 생성
		
		<!-- <!@ @>(선언문)에서 선언된 건 field, method가 돼 -->
		ex03_jsp.java 확인할 것 p65 확인
		
		out.write으로 자동으로 변해있어
		scriptlet은 아무리 많이 끊어도 자동으로 service 함수 내에 다 들어가있어
		표현식으로 스트림으로 출력하더라도 내부적으로는 out.print로 되어있는거야
		
		결국 jsp는 servlet을 편리하게 사용하기 쉽게 하려고 html 코딩 안에 java코딩을 넣겠다
		java 코딩 안에 html을 넣으려는 게 servlet
		html가 점점 다양하고 커지면서 html 안에 java 넣는 게 더 편해짐.
	
	    final javax.servlet.jsp.PageContext pageContext;
	    javax.servlet.http.HttpSession session = null;
	    final javax.servlet.ServletContext application;
	    final javax.servlet.ServletConfig config;
	    javax.servlet.jsp.JspWriter out = null;
	    final java.lang.Object page = this;
	    javax.servlet.jsp.JspWriter _jspx_out = null;
	    javax.servlet.jsp.PageContext _jspx_page_context = null;
	
	jsp는 Jasper component에 의해 Java Servlet code로 변환 돼
  </xmp>
  <%
  	//scriptlet
  	String name = "홍길동";
  %>
  <%
  for(int i = 1; i <= 10; i++){
  %>
  	i=<%= i %><br>
  <% 
  	}
  %>
  <br>
  
  이름 : <%= name %><br>
  나이 : <%= age %><br>
  method 호출 : <%= getMessage("메소드 호출 테스트") %><br>
  
  <%!
  	/* Declaration : variable, function*/
  	int age = 20;
  
  public String getMessage(String message){
	  return "안녕 ~~~ " + message;		 
  }
  %>
</div> 
</body>
</html>