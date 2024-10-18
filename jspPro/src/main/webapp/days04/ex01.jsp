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
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
 <xmp class="code">
    redirect와 forwarding 차이
    forwarding - MVC패턴 개발
    1) /scott/dept URL-pattern 요청	GET 요청
    
    2) servlet이 요청을 받아 ScottDept.java doGet(){
       SELECT 부서정보
       ArrayList<DeptVO> list; 포워딩 하기 전에 list에 이미 담겨있어
       --forwarding--
       이거 redirect는 안돼
       ex01_dept.jsp
       }
       
    3) ex01_dept.jsp 부서정보를 출력하여
       client에 response
       
    4) //days02.ex01_emp.jsp 자료 사용
	     1) ex01_dept.jsp select 태그에서 부서 선택
	     2) /scott/emp ScottEmp.jsp 서블릿 요청 GET
	     			   doGet(){
							 파라미터 넘어오는 부서번호(deptno)
	 						  해당 부서원들을 list에 담하
	 						  forwarding ex01_emp.jsp
	 						  }
	     3) ex01_emp.jsp 사원 정보 출력
  </xmp>
  <%
  			/* "jspPro"  */
  	String contextPath = request.getContextPath();
  //이건 서버 내에서 어딜 가야할 지 모르니까 jspPro라는 contextPath 필요해
  //ScottDept.java 비교

  %>
  <a href="<%= contextPath %>/scott/dept">/scott/dept</a>
  <%-- <a href="<%= contextPath %>/scott/emp">/scott/emp</a> --%>
  <!-- <a href="/scott/dept">/scott/dept</a> -->
  <!-- 만약 404라면 두 가지 경우, servlet을 못 찾는 경우와 forwarding이 안된 경우 -->
</div> 
</body>
</html>