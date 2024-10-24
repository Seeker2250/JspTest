package days07.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

public class EditHandler implements CommandHandler{
	//WriteHandler 복붙, 원리가 비슷해 get일 땐 수정할 페이지, post일땐 수정된 페이지 뿌려
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod(); //GET POST
		if(method.equals("GET")) {
			System.out.println("Edit.doGet()");
		      // referer : 참조자 라는 뜻 / 이전 페이지에 url 을 확인할 때 쓴다.
		      String referer = request.getHeader("referer");
		      // System.out.println("> referer : " + referer);
		      
		      long pseq = Long.parseLong( request.getParameter("seq") );
		      
		      Connection conn = ConnectionProvider.getConnection();
		       BoardDAOImpl dao = new BoardDAOImpl(conn);
		       int rowCount = 0;
		       BoardDTO dto = null;
		      
		       // 트랜잭션 처리 필요한 부분
		       try {
		         dto = dao.view(pseq);
		      } catch (SQLException e) {
		         System.out.println("EditHandler.doGet() Exception");
		         e.printStackTrace();
		      } // try
		       conn.close();
		
		      
		
			// view jsp 포워딩
		    request.setAttribute("dto", dto);   
		       
			String path = "/days07/board/edit.jsp";
		}else {//POST
			/* doGet(request, response); */
			long pseq = Long.parseLong( request.getParameter("seq") );//수정하고자 하는 파라미터 받아, write.java
			request.setCharacterEncoding("UTF-8");
			
		      String pwd = request.getParameter("pwd");
		      String email = request.getParameter("email");
		      String title = request.getParameter("title");
		      String content = request.getParameter("content");
		      int tag = Integer.parseInt( request.getParameter("tag") );
		      
		      Connection conn = ConnectionProvider.getConnection();
		      BoardDAOImpl dao = new BoardDAOImpl(conn);
		      int rowCount = 0;
		      BoardDTO dto = BoardDTO.builder().seq(pseq).pwd(pwd).email(email).title(title).content(content).tag(tag).build();
		      
		      
		      try {
		         rowCount = dao.update(dto);
		      } catch (SQLException e) { 
		         System.out.println("이거는 EdltHandler Exception...");
		         e.printStackTrace();
		      }
		      
		      conn.close();
		      
		      // 포워딩, [ 리다이렉트 ]
		      String location = "/jspPro/board/view.do?seq="+pseq;
		      location += rowCount == 1 ? "&edit=success":"&edit=fail";
		      response.sendRedirect(location);
		}
		return null;
	}
}
