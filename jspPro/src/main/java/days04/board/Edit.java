package days04.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

/**
 * Servlet implementation class Edit
 */
//@WebServlet("/cstvsboard/edit.htm")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Edit() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Edit.doGet()");
	      // referer : 참조자 라는 뜻 / 이전 페이지에 url 을 확인할 때 쓴다.
	      String referer = request.getHeader("referer");
	      // System.out.println("> referer : " + referer);
	      
	      long pseq = Long.parseLong( request.getParameter("seq") );
	      
	      Connection conn = DBConn.getConnection();
	       BoardDAOImpl dao = new BoardDAOImpl(conn);
	       int rowCount = 0;
	       BoardDTO dto = null;
	      
	       // 트랜잭션 처리 필요한 부분
	       try {
	         dto = dao.view(pseq);
	      } catch (SQLException e) {
	         System.out.println("Edit.doGet() Exception");
	         e.printStackTrace();
	      } // try
	       DBConn.close();
	
	      
	
		// view jsp 포워딩
	    request.setAttribute("dto", dto);   
	       
		String path = "/days04/board/edit.jsp";
     	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
     	dispatcher.forward(request, response);
	}

//	http://localhost/jspPro/cstvsboard/edit.htm?seq=1
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/* doGet(request, response); */
		long pseq = Long.parseLong( request.getParameter("seq") );//수정하고자 하는 파라미터 받아, write.java
		request.setCharacterEncoding("UTF-8");
		
	      String pwd = request.getParameter("pwd");
	      String email = request.getParameter("email");
	      String title = request.getParameter("title");
	      String content = request.getParameter("content");
	      int tag = Integer.parseInt( request.getParameter("tag") );
	      
	      Connection conn = DBConn.getConnection();
	      BoardDAOImpl dao = new BoardDAOImpl(conn);
	      int rowCount = 0;
	      BoardDTO dto = BoardDTO.builder().seq(pseq).pwd(pwd).email(email).title(title).content(content).tag(tag).build();
	      
	      
	      try {
	         rowCount = dao.update(dto);
	      } catch (SQLException e) { 
	         System.out.println("> edit.doPost() Exception...");
	         e.printStackTrace();
	      }
	      
	      DBConn.close();
	      
	      // 포워딩, [ 리다이렉트 ]
	      String location = "/jspPro/board/view.do?seq="+pseq;
	      location += rowCount == 1 ? "&edit=success":"&edit=fail";
	      response.sendRedirect(location);
	}

}
