<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost/jspPro/images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">Seeker Home</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div>
		<xmp class="code"> </xmp>
		<form><!-- action 속성 지워서 자기 자신 호출 -->
		정수 : <input type="number" name="num" autofocus><br>
			  <input type="submit" value="확인">
		</form>
		<%
		String numStr = request.getParameter("num");
		int sum = 0;
		if (numStr != null && !numStr.isEmpty()) {
			try {
				int num = Integer.parseInt(numStr);
				for (int i = 1; i <= num; i++) {
					sum += i;
				}//for
				out.write("결과 : " + sum);
			} catch (NumberFormatException e) {//try끝, 
				System.out.println("유효한 정수를 입력하세요.");
			}//catch1
		} else {
			System.out.println("유효한 정수를 입력하세요.");
		}//else
		%>
		<p id="demo">



	</div>
</body>
</html>