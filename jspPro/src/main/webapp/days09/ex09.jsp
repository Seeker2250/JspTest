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
    ex09.jsp
    ex09_idcheck.jsp
  </xmp>
  <h2>회원 가입 페이지</h2>
  <form action="" method="get">
    deptno : <input type="text" name="deptno" value="10" /><br>
    empno(id) : <input type="text" name="empno" value="7369" />
    <input type="button" id="btnEmpnoCheck" 
           value="empno 중복체크 - jquery ajax" />
   <p id="notice"></p>
   <br>
   ename : <input type="text" name="ename" value="" /><br>
   job : <input type="text" name="job" value="" /><br>   
   <input type="submit" value="회원(emp) 가입" />   
  </form>
  <script type="text/javascript">
  	$(function(){
  		$("#btnEmpnoCheck").on("click", function () {
			/* alert("클릭 테스트"); */
			//empno=7369&job=&ename=
			//이러면 귀찮으니까 파라미터 serialize()해
			let params = $("form").serialize();
			$.ajax({
				url:"ex09_idcheck.jsp",
				dataType:"json", //text, json, xml, jsonp 등등
				type:"GET",
				data:params,
				cache:false,
				success: function(data, textStatus, jqXHR){
						//{"count":0} -> js object로
						//JSON.parse() 했었는데 이건 그럴 필요없어 내부적으로 바꿔줘
						if(data.count==1){
							$("#notice").css("color", "red").text("사용중인 id 입니다.");
						}else{
							$("#notice").css("color", "black").text("사용 가능한 id 입니다.");
						}
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