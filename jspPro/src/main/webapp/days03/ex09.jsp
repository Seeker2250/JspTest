<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/* ?ok&name=이시훈	인증성공  */
	/* ?error 			인증실패  */
	String ok = request.getParameter("ok"); // null ""구분하기
	String logonName = request.getParameter("name"); // 안 넘어오면 null, 넘어오면"테스터"
	String error = request.getParameter("error"); // null "" 
	
%>
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
<style>
  #logon, #logout{
    border:1px solid gray;
    width:300px;
    padding:20px;
    border-radius: 10px;
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
    ex09.jsp 메인 페이지
    [로그인 하라는 부분]
    여러 기능(게시판, 설문 등)
    만약 게시판은 로그인을 하지 않아도(인증을 받지 않아도) 사용할 수 있다면?
    
    설문조사  : 인증 O + 권한 O
    일정 관리 : 인증 O
    
    게시판    : 인증X
    
    ex09_ok.jsp
    [인증처리 페이지]
  </xmp>
  
    <div id="logon">  
     <form action="ex09_ok.jsp" method="get">
      아이디 : <input type="text"  name="id"  value="admin"><br>
      비밀번호 : <input type="password"  name="passwd"  value="1234"><br>
      <input type="submit"  value="logon"> 
     </form>
  </div>
  <div id="logout" style="display: none">
  
  	[<%= logonName %>]님 로그인 하셨습니다.<br>
  	<button>로그아웃</button>
  </div>
  <%
  //인증 성공
  	if(ok != null){
  		%>
  <a href="#">설문조사</a><br>
  <a href="#">일정관리</a><br>
  
  <script>
  	alert("로그인 성공");
  	$("#logon").hide();
  	$("#logout").show();
  </script>
  
    <%
  	}//if
 	 %>	

  
 
  <a href="#">게시판</a>
 <%
 	if(error!=null){
 %> 
 <script>
 	alert("로그인 실패!!");
 </script>
 <%
 	} //if
 %>
  
  
  <script>
  $("#logout button").on("click", function(){
	  alert("인증, 권한 삭제 후 메인 페이지로 이동")
	  location.href = "ex09.jsp";
  })
  </script>
</div> 
</body>
</html>