package days13.replyboard.service;


import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days13.replyboard.domain.ReplyBoardDTO;
import days13.replyboard.persistence.ReplyBoardDAO;

public class WriteService {

	// 1. 싱글톤
	private WriteService() {}      
	private static WriteService instance = null;  
	public static WriteService getInstance() {   
		if(   instance == null  ) {
			instance = new WriteService();
		}
		return instance;
	}

	public int write( ReplyBoardDTO dto ){
		//
		Connection con = null;
		int rowCount = 0;
		try {
			con = ConnectionProvider.getConnection();
			ReplyBoardDAO dao = ReplyBoardDAO.getInstance();

			con.setAutoCommit(false);  // 트랜잭션 처리 

			// [답글] 동일 그룹 내에 부모step 보다 큰 게시글의 step을 1증가
			if (dto.getDepth() != 0) {
				dao.updateRefStep(con, dto.getRef(), dto.getStep()-1);
			} // if 

			rowCount = dao.insert(con, dto);

			con.commit();//다 되면 commit
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(con);//하나라도 실패하면 rollback
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		return rowCount;
	}

}

