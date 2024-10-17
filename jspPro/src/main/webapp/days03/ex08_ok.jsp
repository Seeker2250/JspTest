<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	/* SELECT ~~ DB연동 처리는 생략하고 static으로 해보자 */
	String location;//이동할 경로
	if(id.equals("admin") && passwd.equals("1234")){
		//관리자 로그인 성공
		location = "ex08_main.jsp";
	}else if(id.equals("hong") && passwd.equals("1234")){
		//일반 로그인 성공
		location = "ex08_main.jsp";
	}else{
		//로그인 실패
		location = "ex08.jsp?error";
	}
	/* location.href = "ex08.jsp"; 이건 js 코딩이니까 안되지*/
	/* [1] redirect로 이동  */
	//response.sendRedirect(location);
	
	/* [2] forward */
	//		Dispatcher
	RequestDispatcher dispatcher = request.getRequestDispatcher(location);
	dispatcher.forward(request, response);
	//http://localhost/jspPro/days03/ex08_ok.jsp?id=admin&passwd=1234인데 main이 보여 ok가 나와야 하잖아

%>