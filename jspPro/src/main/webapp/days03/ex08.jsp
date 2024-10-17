<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String error = request.getParameter("error");
/*  ex08.jsp가 처음이면 null*/
/*  				   "" 일 땐 로그인 실패 후 redirect에서 왔다.*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.goog leapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    ex08.jsp은 로그인을 위한 페이지라고 가정
    아이디
    비밀번호
    [로그인]
    
    
    ex08_ok.jsp 로그인 인증 처리
    	ㄴ 로그인 성공 -> ex08_main.jsp로 이동
    	ㄴ 로그인 실패 -> ex08.jsp로 이동
    	
    ex08_ok.jsp 아무것도 넘어가지 않는 경우     null
    ex08_ok.jsp?name= 파라미터만 넘어가는 경우  ""
    ex08_ok.jsp?name=admin		 		  "admin"
    
  </xmp>
  <form action="ex08_ok.jsp" method="get">
  	아이디 : <input type="text" name="id" value="admin"><br>
  	비밀번호 : <input type="password" name="passwd" value="1234">
  	<input type="submit">
  	<input type="reset">
  </form>
</div>

<%
	if(error != null && error.equals("")){
%>

<script>
	alert("로그인 실패 후 ex08.jsp로 redirect 됐어");
</script>
<%	
	}
%> 
</body>
</html>