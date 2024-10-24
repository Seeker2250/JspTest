package days07.mvc.command;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;
import days04.board.vo.PagingVO;

public class ListHandler implements CommandHandler{//Logic 담당하는 Model
	int currentPage = 1;		// 현재 페이지 번호
	int numberPerPage = 10;     // 한 페이지에 출력할 게시글 수
	int numberOfPageBlock = 10; // [1] 2 3 4 5 6 7 8 9 10>
	int totalRecords = 0;	 	// 총 레코드 수
	int totalPages = 0;			// 총 페이지 수
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ListHandler.process() 호출");
		try {
			   this.currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}catch (Exception e) {//null이나 빈 문자열 등인 경우
				this.currentPage = 1;//걍 1번 page로 세팅할게
				
			}
			try {
			    this.numberPerPage = Integer.parseInt(request.getParameter("numberPerPage"));
			} catch (Exception e) {
			    this.numberPerPage = 10; // 기본 10개 단위
			}
			
			String searchCondition = null;
			try {
			    searchCondition = request.getParameter("searchCondition");
			} catch (Exception e) {
			    searchCondition = "title";
			}
			
//			검색어 없는 경우 null
			String searchWord = request.getParameter("searchWord");
			Connection conn = ConnectionProvider.getConnection();
			BoardDAO dao = new BoardDAOImpl(conn);
			ArrayList<BoardDTO> list = null;		
			
			PagingVO pvo = null;
			
			
//			PagingVO pvo = new PagingVO(this.currentPage, this.numberPerPage, this.numberOfPageBlock);
			
			
			
			
			try {
				//페이징 + 검색 안된 목록
				if(searchWord == null || searchWord.equals("")) {
					pvo = new PagingVO(this.currentPage, this.numberPerPage, this.numberOfPageBlock);
					list = dao.select(this.currentPage, this.numberPerPage);//paging처리가 안된 select함수
				}else {
					pvo = new PagingVO(currentPage, numberPerPage, numberOfPageBlock, searchCondition, searchWord);
					list = dao.search(searchCondition, searchWord, currentPage, numberPerPage);
				}
				
			} catch (Exception e) {
				System.out.println("> List.doGet() Exception");
				e.printStackTrace();
			} finally {
				conn.close();//connection pool에 return
			} // try
			
			// 2. 포워딩
			request.setAttribute("list", list);
			request.setAttribute("pvo", pvo);
		return "/days07/board/list.jsp";//view로 return해서 출력
	}
}
