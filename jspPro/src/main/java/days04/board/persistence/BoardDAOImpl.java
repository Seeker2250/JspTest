package days04.board.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import days04.board.domain.BoardDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@AllArgsConstructor
@NoArgsConstructor
public class BoardDAOImpl implements BoardDAO {

	private Connection conn = null; // = DBConn.getConnection(); x
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 생성자 DI : alt + shift + s
	public BoardDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public ArrayList<BoardDTO> select() throws SQLException {

		long seq;
		String title, writer, email;
		Date writedate;
		int readed;

		ArrayList<BoardDTO> list = null;

		String sql = " select seq, title, writer, email, writedate, readed "
				+ " from tbl_cstVSBoard "
				+ " order by seq desc ";

		// 부서조회() START
		BoardDTO dto = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				list = new ArrayList<BoardDTO>();
				do {

					seq = rs.getLong("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");
					dto = new BoardDTO().builder()
							.seq(seq)
							.title(title)
							.writer(writer)
							.email(email)
							.writedate(writedate)
							.readed(readed)
							.build();

					list.add(dto);

				} while (rs.next());

			} // if

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 부서조회() END

		return list;

	} // select

	@Override
	public int insert(BoardDTO dto) throws SQLException {
		// writedate  default  sysdate
		// readed     default  0
		int rowCount = 0;
		String sql = "INSERT INTO tbl_cstvsboard "
				+ " (seq, writer, pwd, email, title, tag, content ) "
				+ "VALUES "
				+ " (seq_tblcstvsboard.NEXTVAL, ?, ?, ?, ?, ?, ? ) ";

		this.pstmt = conn.prepareStatement(sql);      
		pstmt.setString(1,  dto.getWriter() );
		pstmt.setString(2,  dto.getPwd() );
		pstmt.setString(3,  dto.getEmail() );
		pstmt.setString(4,  dto.getTitle() );
		pstmt.setInt(5, dto.getTag());
		pstmt.setString(6,  dto.getContent() );
		rowCount = this.pstmt.executeUpdate();
		this.pstmt.close();

		return rowCount;

	} // insert

	// 조회수 증가
	@Override
	public int increaseReaded(long seq) throws SQLException {

		String sql = " update tbl_cstvsboard "
				+ " set readed = readed + 1 "
				+ " where seq = ? ";

		int rowCount = 0;
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setLong(1, seq);
		rowCount = this.pstmt.executeUpdate();

		return rowCount;

	} // increaseReaded

	// 부서 조회
	@Override
	public BoardDTO view(long seq) throws SQLException {

		String title, writer, email, content;
		Date writedate;
		int readed;

		ArrayList<BoardDTO> list = null;

		String sql = " select seq, title, writer, email, writedate, readed, content "
				+ " from tbl_cstVSBoard "
				+ " where seq = ? ";

		// 부서조회() START
		BoardDTO dto = null;

		try {
			pstmt = conn.prepareStatement(sql);
			this.pstmt.setLong(1, seq);
			rs = pstmt.executeQuery();

			if (rs.next()) {


				seq = rs.getLong("seq");
				title = rs.getString("title");
				writer = rs.getString("writer");
				email = rs.getString("email");
				writedate = rs.getDate("writedate");
				readed = rs.getInt("readed");
				content = rs.getString("content");
				dto = new BoardDTO().builder()
						.seq(seq)
						.title(title)
						.writer(writer)
						.email(email)
						.writedate(writedate)
						.readed(readed)
						.content(content)
						.build();

			} // if

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 부서조회() END

		return dto;

	} // view

	@Override
	public int update(BoardDTO dto) throws SQLException {

		String sql = " update tbl_cstvsboard "
				+ " set title = ?, content = ?, email = ?, tag = ? "
				+ " where seq = ? AND pwd = ?";

		int rowCount = 0;
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, dto.getTitle());
		this.pstmt.setString(2, dto.getContent());
		this.pstmt.setString(3, dto.getEmail());
		this.pstmt.setInt(4, dto.getTag());
		this.pstmt.setLong(5, dto.getSeq());
		this.pstmt.setString(6, dto.getPwd());
		rowCount = this.pstmt.executeUpdate();

		return rowCount;

	} // update

	@Override
	public String getOriginalPwd(long seq) throws SQLException {

		String originalPwd = null;


		String sql = " select pwd "
				+ " from tbl_cstVSBoard "
				+ " where seq = ? ";

		try {
			pstmt = conn.prepareStatement(sql);
			this.pstmt.setLong(1, seq);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				originalPwd = rs.getString("pwd");
			} // if

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 부서조회() END

		return originalPwd;

	} // getOriginalPwd

	@Override
	public int delete(long seq) throws SQLException {

		String sql = " delete "
				+ " from tbl_cstvsboard "
				+ " where seq = ? ";

		int rowCount = 0;
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setLong(1, seq);
		rowCount = this.pstmt.executeUpdate();

		return rowCount;

	}

	@Override
	public int getTotalRecords() throws SQLException {
		int totalRecords = 0;      
		String sql = "SELECT COUNT(*) FROM tbl_cstvsboard";
		this.pstmt = this.conn.prepareStatement(sql);
		this.rs =  this.pstmt.executeQuery();      
		if( this.rs.next() ) totalRecords = rs.getInt(1);      
		this.rs.close();
		this.pstmt.close();            
		return totalRecords;

	}

	@Override
	public int getTotalPages(int numberPerPage) throws SQLException {
		int totalPages = 0;      
		String sql = "SELECT CEIL(COUNT(*)/?) FROM tbl_cstvsboard";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, numberPerPage);
		this.rs =  this.pstmt.executeQuery();      
		if( this.rs.next() ) totalPages = rs.getInt(1);      
		this.rs.close();
		this.pstmt.close();            
		return totalPages;
	}

	@Override
	public int getTotalPages(int numberPerPage, String searchCondition, String searchWord) throws SQLException {

		int totalPages = 0;      
		String sql = "SELECT CEIL(COUNT(*)/?) "
				+ " FROM tbl_cstvsboard ";
		// 검색조건에 맞는 where절 추가.start
		switch (searchCondition) {
		case "t": 
			sql += " where regexp_like(title, ?, 'i') ";
			break;
		case "w": 
			sql += " where regexp_like(writer, ?, 'i') ";
			break;
		case "c": 
			sql += " where regexp_like(content, ?, 'i') ";
			break;
		case "tc": 
			sql += " where regexp_like(title, ?, 'i') or regexp_like(content, ?, 'i') ";
			break;
		}
		// 검색조건에 맞는 where절 추가.end

		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, numberPerPage);
		this.pstmt.setString(2, searchWord);
		if (searchWord.equals("tc")) {
			this.pstmt.setString(3, searchWord);
		}

		this.rs =  this.pstmt.executeQuery();      
		if( this.rs.next() ) totalPages = rs.getInt(1);      
		this.rs.close();
		this.pstmt.close();            
		return totalPages;

	}

	@Override
	public ArrayList<BoardDTO> select(int currentPage, int numberPerPage) throws SQLException {

		long seq;
		String title, writer, email;
		Date writedate;
		int readed;

		ArrayList<BoardDTO> list = null;

		String sql = " select * "
				+ "from ( "
				+ "select rownum no, t.* "
				+ "from ( "
				+ "    select seq, title, writer, email, writedate, readed "
				+ "    from tbl_cstVSBoard "
				+ "    order by seq desc "
				+ ") t "
				+ ") b "
				+ "where no between ? and ? ";

		// 부서조회() START
		BoardDTO dto = null;
		int start = (currentPage-1)*numberPerPage + 1;
		int end = start + numberPerPage - 1;
		int totalRecords = getTotalRecords();
		if ( end > totalRecords ) {
			end = totalRecords;
		}

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				list = new ArrayList<BoardDTO>();
				do {

					seq = rs.getLong("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");
					dto = new BoardDTO().builder()
							.seq(seq)
							.title(title)
							.writer(writer)
							.email(email)
							.writedate(writedate)
							.readed(readed)
							.build();

					list.add(dto);

				} while (rs.next());

			} // if

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 부서조회() END

		return list;
	}

	//검색된 총 검색어 수...인데 PagingVO에 이거 없이 구현함.
	@Override
	public int getTotalRecords(String searchCondition, String searchWord) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<BoardDTO> search(String searchCondition, String searchWord, int currentPage, int numberPerpage){
		long seq;
		String writer, email, title;
		int readed;
		Date writedate;

		ArrayList<BoardDTO> list = null;
		String sql = "SELECT * "
				+ "FROM ( "
				+ "    SELECT ROWNUM no, t.* "
				+ "    FROM( "
				+ "        SELECT seq, writer, email, title, readed, writedate "
				+ "        FROM tbl_cstVSBoard ";
		switch(searchCondition) {
		case "t"://제목
			sql += "WHERE REGEXP_LIKE(title, ?, 'i') ";
			break;
		case "w"://작성자
			sql += "WHERE REGEXP_LIKE(writer, ?, 'i') ";
			break;
		case "c"://
			sql += "WHERE REGEXP_LIKE(content, ?, 'i') ";
			break;
		case "tc":
			sql += "WHERE REGEXP_LIKE(title, ?, 'i') OR WHERE REGEXP_LIKE(content, ?, 'i') ";
			break;
		}



		sql+= "        ORDER BY seq DESC "
				+ "    ) t "
				+ ")b "
				+ "WHERE no BETWEEN ? AND ?";
		//		부서조회 시작


		BoardDTO dto = null;

		int start = (currentPage-1)*numberPerpage+1;
		int end = start+numberPerpage-1;;
		int totalRecords;
		try {
			totalRecords = getTotalRecords();
			if(end > totalRecords) {
				end = totalRecords;}//if
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}


		try {
			pstmt = conn.prepareStatement(sql);


			pstmt.setString(1, searchWord);
			if(searchWord.equals("tc")) {

				pstmt.setString(2, searchWord);
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);

			}else {
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);	
			}

			System.out.println(sql);


			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<BoardDTO>();
				do {
					seq = rs.getLong("seq");
					writer = rs.getString("writer");
					email = rs.getString("email");
					title = rs.getString("title");
					readed = rs.getInt("readed");
					writedate = rs.getDate("writedate");

					//					dto = new BoardDTO(seq, writer, null, email, title, writedate, readed,  0, null);
					dto = new BoardDTO().builder()
							.seq(seq)
							.writer(writer)
							.email(email)
							.title(title)
							.writedate(writedate)
							.readed(readed)
							.build();
					list.add(dto);
				} while (rs.next());
			}//if

			//		부서정보 출력

		}

		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		//		부서조회 끝



		return list;


	}
} // class
