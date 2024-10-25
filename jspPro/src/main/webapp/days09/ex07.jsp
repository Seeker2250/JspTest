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
    ex07.jsp
    xml -> JSON 형식을 AJAX에서 더 많이 사용.
    
    ex08_dept.xml
    ex08_dept.json
    
        [ JSON ]
     1. [J]ava[S]cript [O]bject  [N]otation   
     2. 가벼운 데이터 교환 형식  
     3. 인간 읽기 쉽고 쓰기 쉽기.    
     4. 기계가 구문분석 , 생성, 사용 쉽기.   
     
     로컬 저장소 읽기/쓰기
     
     
  </xmp>
  <button onclick="getPersonJson()">로컬 저장소의 personJson 사용</button>
  <p id="demo"></p>
  <script type="text/javascript">
  	//1. js Object
  	const person = {
  					name : "admin",
  					age : 20,
  					city : "seoul"
  					};
  	
  	//2. js Object -> JSON 변환 JSON.stringify()
  	let personJSON = JSON.stringify(person);
  	$("#demo").html(personJSON);
  	//"{"name":"admin", "age":20, "city":"city"}"이건 JSON 문자열
  	
  	//3. local 저장소에 저장
  	//	 cookie 말고 local 써보자
  	localStorage.setItem("personJSON", personJSON);//브라우저 안에 localStorage 저장
  	function getPersonJson() {
  		let pjText = localStorage.getItem("personJSON");
		// JSON 형태 문자열을 js object로 변환.
		const person2  = JSON.parse(pjText);
		$("#demo").html(person2.name + "/" + person2["age"]);
		localStorage.removeItem("personJSON");
		
	}
  	
  	
  </script>
</div> 
</body>
</html>