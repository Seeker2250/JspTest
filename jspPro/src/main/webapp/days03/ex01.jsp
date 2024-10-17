<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.util.DBConn"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();// "/jspPro" return
%>    
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = " SELECT * "
			   + " FROM dept";
	ResultSet rs = null;
	int deptno;
	String dname, loc;
	DeptVO dvo = null;
	ArrayList<DeptVO> dlist = null;
	Iterator<DeptVO> dir = null;
	
	try{
		conn = DBConn.getConnection();
		System.out.println("conn은 " +conn);
		System.out.println("닫혀있나 " + conn.isClosed());
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if( rs.next() ){
			dlist = new ArrayList<>();
			do{
				
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				dvo = new DeptVO().builder().deptno(deptno).dname(dname).loc(loc).build();
				dlist.add(dvo);
			}while(rs.next());
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			rs.close();
			pstmt.close();
			/* DBConn.close(); */
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
%>





<!-- --------------------------------  -->
 <% 
	String pDeptno = request.getParameter("deptno");
	try{
		deptno = Integer.parseInt(pDeptno);
	}catch(Exception e){
		deptno = 10;//기본값 줘서 null 배제
	}

	sql = " SELECT empno, ename, job, mgr, "
	    + " TO_CHAR(hiredate, 'yyyy-mm-dd') hiredate, sal, comm, deptno "
	    + " FROM emp "
	    + " WHERE deptno = ?";
	
	int empno, mgr;
	String ename, job;
	Date hiredate;
	double sal, comm;
	
	EmpVO evo = null;
	ArrayList<EmpVO> elist = null;
	Iterator<EmpVO> eir = null;
	
	try{
		pstmt = conn.prepareStatement(sql);
		// 물음표 있는 거에 값 줘야지
		pstmt.setInt(1, deptno);
		rs = pstmt.executeQuery();
		if( rs.next() ){
			elist = new ArrayList<>();
			do{
				empno = rs.getInt("empno");
				ename = rs.getString("ename");
				job = rs.getString("job");
				mgr = rs.getInt("mgr");				
				hiredate = rs.getDate("hiredate");
				sal = rs.getDouble("sal");
				comm = rs.getDouble("comm");
				deptno = rs.getInt("deptno");
				
				evo = new EmpVO().builder().empno(empno).ename(ename).job(job).mgr(mgr).hiredate(hiredate).sal(sal).comm(comm).deptno(deptno).build();
				
				elist.add(evo);
			}while(rs.next());
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			pstmt.close();
			rs.close();
			DBConn.close();
		}catch(Exception e){
			e.printStackTrace();
		}		
	}%>

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
  <select id="deptno" name="deptno">
  	<!-- <option>부서를 선택하세요</option> -->
  	
  	<%
  		dir = dlist.iterator();
  		while(dir.hasNext()){
  			dvo = dir.next();
  			deptno = dvo.getDeptno();
  			dname = dvo.getDname();
  			
  			String selected = "";
  			if (String.valueOf(deptno).equals(pDeptno)) {
  				selected = "selected";
  			}
  	%>
  		<option value="<%= deptno %>" <%= selected %>><%= dname %></option>
  		<%-- <option value="<%= deptno %>" <%= selected %>><%= dname %></option> --%>
   <%		
  		}//while
   %>
  </select>
  
  <br>
  <br>
  <h2>emp list</h2>
  <table>
  	<thead>
  		<th><input type="checkbox" id="ckbAll" name="ckbAll"></th>
  		<th>empno</th>
  		<th>ename</th>
  		<th>job</th>
  		<th>mgr</th>
  		<th>hiredate</th>
  		<th>sal</th>
  		<th>comm</th>
  		<th>deptno</th>
  	</thead>
  	<tbody>
  		<%
  		if(elist == null){
  		%>
  		<tr>
  			<td colspan="9">사원이 존재하지 않습니다.</td>
  		</tr>
  		<%
  		}else{
  			eir = elist.iterator();
  			while(eir.hasNext()){
  				evo = eir.next();
  			
  		%>
  		<tr>
  			<td><input type="checkbox" id="ckb_" name="ckb_" data-empno="<%= evo.getEmpno() %>"></td>
	  		<td><%= evo.getEmpno() %></td>
	  		<td><%= evo.getEname() %></td>
	  		<td><%= evo.getJob() %></td>
	  		<td><%= evo.getMgr() %></td>
	  		<td><%= evo.getHiredate() %></td>
	  		<td><%= evo.getSal() %></td>
	  		<td><%= evo.getComm() %></td>
	  		<td><%= evo.getDeptno() %></td>
		</tr>
  	  			
  		<%
  			}//while
		}//else
  		%>
  		
  		<%-- <% 
  		if (list != null && !list.isEmpty()) {
  		ir = list.iterator();
  		while(ir.hasNext()){
  			vo = ir.next();
  			empno = vo.getEmpno();
  			ename = vo.getEname();
  			job = vo.getJob();
  			mgr = vo.getMgr();
  			hiredate = vo.getHiredate();
  			sal = vo.getSal();
  			comm = vo.getComm();
  			deptno = vo.getDeptno();
	  	%>
	  	<tr>
	  		<td><%= empno %></td>
	  		<td><%= ename %></td>
	  		<td><%= job %></td>
	  		<td><%= mgr %></td>
	  		<td><%= hiredate %></td>
	  		<td><%= sal %></td>
	  		<td><%= comm %></td>
	  		<td><%= deptno %></td>
  		</tr>
	   <%		
	  		}//while
  		  } else {
  	        %>
  	        <tr>
  	            <td colspan="8">해당 부서에 직원 정보가 없습니다.</td>
  	        </tr>
  	        <%
  	        }
  	        %> --%>
  	</tbody>
  	<tfoot>
  		<tr>
  			<td colspan="9">
  	 			<span class="badge left red"><%= elist==null?0:elist.size() %></span>명
  			 	<a href="javascript:history.back()">뒤로가기</a>
  			 	<button>선택한 empno 확인</button>
  			</td>
  		</tr>
  	</tfoot>
  </table>
   <script>
  	$("#deptno").on("change",function(e){
  		/* alert("test"); */
  		let deptno = $(this).val();
  		location.href=`<%= contextPath %>/days03/ex01.jsp?deptno=\${deptno}`;
  	});
  	
  	
  	
  /* 맨 위 체크하면 다 체크 */
  /*$("#ckbAll").on("click", function(e) {
    if ($(this).is(":checked")) {
      $("input[type='checkbox']").each(function() {
        $(this).prop("checked", true);
      });
    } else {
      $("input[type='checkbox']").each(function() {
        $(this).prop("checked", false);
      });
    }
  });*/
  $("#ckbAll").on("click", function(e) {
	  $("table tbody tr").find("td:first-child :checkbox")
	  					 .prop("checked", $(this).prop("checked"));
  });

  
  /* 각 사원 체크박스 클릭하면 맨 위도 체크 되게 */
  /*$("input[type='checkbox']").on("click", function(e) {
	    // 체크박스가 체크되지 않은 경우
	    if (!$(this).is(":checked")) {
	      $("#ckbAll").prop("checked", false); // 전체 체크박스 해제
	    } else {
	      // 모든 체크박스가 체크되어 있는지 확인
	      var allChecked = true;
	      $("input[type='checkbox']").not("#ckbAll").each(function() { // 전체 체크박스 중 전체 선택 체크박스 제외
	        if (!$(this).is(":checked")) {
	          allChecked = false;
	          return false; // 체크되지 않은 체크박스 발견 시 루프 종료
	        }
	      });
	      $("#ckbAll").prop("checked", allChecked); // 전체 체크박스 상태 업데이트
	    }
	  });*/
	 $("table tbody tr").find("td:first-child :checkbox").on("click", function(){
		 let ck = $("tbody :checkbox").length == $("tbody :checkbox:checked").length;
		 $("#ckbAll").prop("checked", ck)
	 });
	  
	  /* ?deptno=30 */
	  <%-- $("#deptno").val(<%= pDeptno %>); 이렇게 할거면 아랫줄처럼 하지--%>
	  $("#deptno").val(${param.deptno});
	  
	  
	  /* 선택된 empno(PK값) 넘기는법 */
	  /* 1. DOM 탐색으로 가져와 */
	  
	/*   $("tfoot button").on("click", function(e){
		 let empnos = [];
		 $("tbody :checkbox:checked").each(function(index, element){
			 // ck		td					td			내용물(empno)
			 let empno = element.parentElement.nextElementSibling.innerText;
			 empnos.push(empno);
		 });
		 location.href = `ex01_ok.jsp?empnos=\${empnos.join("/")}`;
	  }); */
	  
	  /* 2. checkbox안에 그 사원번호를 숨겨놔
	  value에 넣는 건 전부가 어려우니 id 뒤에 _뒤로 빼놓고 잘라오든지 data-로 가져오든지... data-로 해보자*/
	  $("tfoot button").on("click", function(e){
		  // ex01_ok.jsp?empno=123&456&789 ...
		  let empnos= [];
		  $("tbody :checkbox:checked").each(function(index, element){//element는 체크된 체크박스
			  	/* jQuery method : data()  data-이름 
			  	let empno = $(element).data("이름");하면 이 속성값을 얻어 와*/
				 let empno = $(element).data("empno");
				 empnos.push(empno);
			 });
			 location.href = `ex01_ok.jsp?empnos=\${empnos.join("&empno=")}`;
		  });
	  
  </script>
</div> 
</body>
</html>