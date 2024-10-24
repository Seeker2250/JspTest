package days07.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.persistence.BoardDAOImpl;

public class DeleteHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod(); //GET POST
		if(method.equals("GET")) {
			return "/days07/board/delete.jsp";
		}else {//POST
			  request.setCharacterEncoding("UTF-8");
		      System.out.println("DeleteHandler.doPost()");

		      long pseq = Long.parseLong( request.getParameter("seq") );
		      
		         String ppwd = request.getParameter("pwd");

		         Connection conn = ConnectionProvider.getConnection();
		         BoardDAOImpl dao = new BoardDAOImpl(conn);
		         int rowCount = 0;
		         String originalPwd;
		         String location = "/jspPro/board/";
		         
		         try {
		            originalPwd = dao.getOriginalPwd(pseq);
		            if(originalPwd.equals(ppwd)) {
		               rowCount = dao.delete(pseq);
		               location += "list.do";
		            }else {
						/*
						 * location += "delete.htm?seq="+pseq+"&delete=fail";//실패한 글 번호 + 실패 표시
						 */               //이제 모달창 삭제로 바뀌었어
		               location += "view.do?seq="+pseq+"&delete=fail";//실패한 글 번호 + 실패 표시
		            } // if
		         } catch (SQLException e) { 
		            System.out.println("이건 DeleteHandler.doPost() Exception...");
		            e.printStackTrace();
		         } // try
		         
		         conn.close();
		         
		         // 리다이렉트
		         response.sendRedirect(location);
		}
		return null;
	}
}