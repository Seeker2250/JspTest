<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
  </xmp>
  
  정수 : <input type="text" id="num" autofocus><br>
  <p id="demo">
  <script>
  /*document.getElementById('num').addEventListener('keypress', function(e) {
    if (e.key == 'Enter') {
      let num = document.getElementById('num').value;
      if (!isNaN(num)) {
        let sum = 0;
        for (let i = 1; i <= num; i++) {
          sum += i;
        }
        document.getElementById('demo').innerHTML = sum;
      } else {
        alert('숫자만 입력하세요.');
      }
    }
  });*/
  
  /*
   $("#num").on("keypress",function(e){
	   if (e.key < '0' || e.key > '9') {
		    e.preventDefault();
		    alert('숫자만 입력할 수 있습니다.'); 
		  }
	  if (e.key == 'Enter') {
	      let num = $(this).val();
	      if (!isNaN(num)) {
	        let sum = 0;
	        for (let i = 1; i <= num; i++) {
	          sum += i;
	        }
	        $('#demo').html(sum);
	      } else {
	        alert('숫자만 입력하세요.');
	      }
	    }
  })*/
  
  
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
       if( event.which == 13){
          // alert("출력 처리...")
          $("#demo").empty();
          
          let n = $(this).val();
          let sum = 0;
          for (var i = 1; i <= n; i++) {
             sum += i;
            $("#demo").html(function (index, oldhtml) {
               return oldhtml + i + (i==n?"":"+");
            });
         }
          // =55
          $("#demo").html(function (index, oldhtml) {
            return oldhtml + "=" + sum ;
          })
         
          $(this).select();
          
       } // if
     }
  });

  
	  </script>
</div> 
</body>
</html>