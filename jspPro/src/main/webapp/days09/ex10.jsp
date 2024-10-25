<%@page import="java.util.Date"%>
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
    ex10.jsp
    ex10_emp_json.jsp
  </xmp>
  <h3><%= new Date().toLocaleString() %></h3>
  <input type="button" id="btn1" value="jquery ajax + json">
  <br>
  <select id="cmbEmp"></select>
  <p id="demo"></p>
  
  <script type="text/javascript">
  	$(function(){
  		$("#btn1").on("click", function () {
			//let params = null; 파라미터가 없어
			$.ajax({
				url:"ex10_emp_json_lib.jsp",
				dataType:"json", //text, json, xml, jsonp 등등
				type:"GET",
				//data:params,
				cache:false,
				success: function(data, textStatus, jqXHR){
					//const empArr = data.emp;//이름으로 받아서 해당 배열을 가져와
					$(data.emp).each(function(index, empElement){
						$("#cmbEmp").append(`<option value="\${empElement.empno}">\${empElement.ename}</option>`);
						$("#demo").append(`<li>\${empElement.empno} : \${empElement.ename} </li>`)
					});//jQuery 객체로 받아서 돌려, element 하나가 js 객체야
						
				
				},error: function(){
					alert("에러나따~");
				}
					
				
			});//ajax
		});//click function
  	});//ready
  </script>
</div> 
</body>
</html>