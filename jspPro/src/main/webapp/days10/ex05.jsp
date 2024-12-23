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
    ex05.jsp
    servlet 3.0 또는 3.1에서 제공하는 library
    /jspPro/days10/upload에서 /UploadServlet.java + web.xml 설정
    						 여기에서 파일 업로드 처리
    web.xml -> web_days09.xml
  </xmp>
   <form action="/jspPro/days10/upload" method="post" enctype="multipart/form-data">
     메시지 : <input type="text" name="msg" value="Hello World~" /><br>
     <button type="button">첨부파일 추가</button>
     <div id="filebox">
     첨부파일1 : <input type="file" name="file1" /><br>
     </div>
     
     
     <input type="submit" />
  </form>
  
  <script>
     $(function(){
        $("button").on("click",function(){
           let no = $("#filebox :file").length + 1; // no = 2
           $("#filebox").append(
            `첨부파일 \${no} : <input type="file" name="file\${no}" /><br>`
         )//append
        })//click function
     })//function
  </script>
</div> 
</body>
</html>