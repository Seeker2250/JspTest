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
<script src="httpRequest.js"></script>
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
 	ex08.jsp
    ex08_dept.xml
    ex08_dept.json
  </xmp>
  
  	<button type="button">ex08_dept.json -> js ajax -> 태그 출력</button>
  	<br>
  	<br>
  	<p id="demo"></p>
  	<script>
  	$("button").on("click", function(){
  		sendRequest("ex08_dept.json", null, callback, "GET" );	
  	});
  	
    function callback(){
       if (httpRequest.readyState == 4) {  // 서버 요청 완료
         if (httpRequest.status == 200) {  // 응답 성공
             
            let deptJSON =  httpRequest.responseText;
         // js 객체로 변환해서 사용하는 게 더 쉬워
         	const deptObj = JSON.parse(deptJSON);//그래서 js 객체로 바꿨어
         	const deptArr = deptObj.departments;
         	//alert(deptArr.length);//4 출력하나? 뜨넹
         	for(let dept of deptArr){
         		$("#demo").append(`<li>\${dept.deptno} / \${dept.dname} / \${dept.loc}</li>`);
         	}
            
         }else{
            alert("에이작스 실패 : " + httpRequest.status );
         }
     }
    }
  </script>
</div> 
</body>
</html>