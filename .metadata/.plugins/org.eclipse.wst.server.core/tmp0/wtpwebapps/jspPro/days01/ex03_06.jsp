<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
// int num = Integer.parseInt(request.getParameter("num"));
// 그냥 parse했더니 null일 때도 parse해서 500에러 뜸


//int num = request.getParameter("num")==null?0:Integer.parseInt(request.getParameter("num"));
String pNum = request.getParameter("num");
int num = 0;
if(pNum != null && !pNum.equals("")){
	num = Integer.parseInt(pNum);
}
  %>
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
		                    
  </xmp>
  <!-- <form> -->
  <!-- 정수 : <input type="text" id="num" name="num" autofocus="autofocus" value='<%-- %><%= pNum != null ? pNum : "" %>--%>'>-->
  정수 : <input type="text" id="num" name="num" autofocus="autofocus"> 
  <p id="demo">
  <%  
    if( pNum != null && !pNum.equals("") ){
          int sum = 0;
          for(int i=1; i<= num ; i++){
             sum += i;
        %><%= i %>+<%        
          } // for
        %>=<%= sum %>
        <%
    } // if
  %>
  </p>
  <!-- </form> -->
  <script>
    $("#num")
      .css("text-align","center")
      <%-- .val('<%= pNum != null ? pNum : "" %>') --%>
      .val(`${param.num}`)
      .on({
         "keydown":function (e){
            if ( !(e.which >= 48 && e.which <= 57                 
                     || e.which == 8
                     || e.which == 13
                     || e.which == 229
                 )){
               alert("숫자만 입력하세요.");
               e.preventDefault();
            } // if
         },
         "keyup":function (event){
           //if( $("#num").val().length != 0  && event.which == 13){
           if( event.which == 13){    
              // js BOM
              // $("form").submit();
              let numValue = $("#num").val();
              location.href = `ex03_06.jsp?num=\${numValue}`;
           } // if
         }
      })
      .select();
  </script>
</div> 
</body>
</html>
		
		
		
		
<!--
정수 : <input type="number" id="num" autofocus value="<%--<%= pNum != null ? pNum : "" %>--%>"> <br>
<p id="demo">

<%-- <% 
if(pNum != null && !pNum.equals("")){
  int sum = 0;
  for(int i = 1; i <= num; i++){
  sum +=i;
  out.write(i+"+");
  }
  out.write("=" + sum);
}
 %> --%>
 </p>
<script>
$("#num")
  .css("text-align","center")
  .on({ "keydown":function (e){
        if ( !(e.which >= 48 && e.which <= 57
                 || e.which == 8
                 || e.which == 13
                 || e.which == 229
             )){
           alert("숫자만 입력하세요.");
           e.preventDefault();
        } // if
     },
     "keyup":function (event){
       //if( event.which == 13 && $("$num").val().length != 0){
    	 if( event.which == 13){
          // js BOM
          let numValue = $("#num").val();
          // 페이지를 재요청할 때 입력한 값을 쿼리 파라미터로 전달
          location.href = `ex03_06.jsp?num=${numValue}`;/* location으로 하면 무조건 GET방식 */

          /* $("form").submit(); */          
       } // if
     }
  });

  
	  </script>


	</div>
</body>
</html>-->