package days07.mvc.domain;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.DBConn;

import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PagingDTO {

	public int currentPage;
	public int start;
	public int end;
	public boolean prev;
	public boolean next;
	public int numberOfPageBlock;  // 페이지 블록 수
	public int numberPerPage = 10;

	public PagingDTO(int currentPage, int numberPerPage, int numberOfPageBlock) {
		this.currentPage = currentPage;
		this.numberPerPage = numberPerPage;
		this.numberOfPageBlock = numberOfPageBlock;
		
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		try {
			int totalPages = dao.getTotalPages(numberPerPage);
			start = (currentPage-1)/numberOfPageBlock*numberOfPageBlock+1;
			end = start + numberOfPageBlock - 1;
			if(end>totalPages) {
				end = totalPages;
			}
			if(start!=1) this.prev = true;
			if(end!=totalPages)this.next = true;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		//method를 만들거면 DAO를 member로 injection 받든지 하자
	}

	public PagingDTO(int currentPage, int numberPerpage, int numberOfPageBlock,
			String searchCondition, String searchWord) {
		this.currentPage = currentPage;
		this.numberPerPage = numberPerPage;
		this.numberOfPageBlock = numberOfPageBlock;
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		//		위에 이거 main에서 어차피 있는데 또 만들어야 돼? main꺼 받아올 방법 없나
		try {
			int totalPages = dao.getTotalPages(numberPerpage, searchCondition, searchWord);
			start = (currentPage-1)/numberOfPageBlock*numberOfPageBlock+1;
			end = start + numberOfPageBlock - 1;
			if(end>totalPages) {
				end = totalPages;
			}
			if(start!=1) this.prev = true;
			if(end!=totalPages)this.next = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}