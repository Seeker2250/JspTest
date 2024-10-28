package days10;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.text.Format;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

/**
 * Servlet implementation class FileTestServlet
 */
//@WebServlet("*.ss")
public class FileTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public FileTestServlet() {
		super();

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); // list.ss, write.ss, update.ss 등등 어떤 요청이 들어왔는지 URI 담기

		Connection conn = null;
		String saveDirectory = null;

		// MVC 패턴이라면
		// commandHandler.properties만들어서   list.ss 들어오면 ListHandler.java을 맵핑해야 하지만 안 만들거야
		// init()      commandHalderMap <url, Handler> 
		try {
			conn = ConnectionProvider.getConnection();
			FileTestDAO dao = FileTestDAO.getInstance(); // 싱글톤
			// ㄴ
			saveDirectory = request.getRealPath("/days10/upload");
			System.out.println(saveDirectory);

			if( uri.endsWith("list.ss") ) { // 자료실 목록 보기            
				ArrayList<FileTestDTO> list = dao.selectFileList(conn);
				request.setAttribute("list", list);
				String path = "/days10/ex06_list.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			}else if( uri.endsWith("write.ss") ) {   // 글쓰기 + write.jsp
				String path = "/days10/ex06_write.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			}else if( uri.endsWith("write_ok.ss") ) { // 글쓰기 저장
				//upload 폴더 없으면 생성
				File f = new File(saveDirectory);
				if(! f.exists())f.mkdirs();

				//ex04_ok 복사
				// ㄷ.
				int maxPostSize = 5 * 1024 * 1024; // 5MB
				// ㄹ.
				String encoding = "UTF-8";
				// ㅁ. a1.txt
				FileRenamePolicy policy = new DefaultFileRenamePolicy();



				// cos.jar 파일 MultipartRequest 클래스...
				MultipartRequest multiRequest = new MultipartRequest(
						request
						, saveDirectory
						, maxPostSize
						, encoding
						, policy
						); //이미 첨부파일은 서버의 upload폴더에 저장한 상태(오류가 없다면)
						FileTestDTO dto = new FileTestDTO();
						String subject = multiRequest.getParameter("subject");
						dto.setSubject(subject);
						//<input type="file" name="attachFile" />인 걸 기억
						File attachFile = multiRequest.getFile("attachFile");//첨부된 파일 객체
						if(attachFile != null) {//첨부파일이 있다면
							String fileName = attachFile.getName();
							long filelength = attachFile.length();

							String originalFileName = multiRequest.getOriginalFileName("attachFile");
							String fileSystemName = multiRequest.getFilesystemName("attachFile");

							dto.setFilelength(filelength);
							dto.setOriginalfilename(originalFileName);
							dto.setFilesystemname(fileSystemName);
							//이것들 dto 객체에 담아

						}else {//첨부파일이 없다면
							//없으면 할 일이 없으니 비워두거나 지워
						}//if-else
						int rowCount = dao.insert(conn, dto);
						response.sendRedirect("list.ss");


			}else if( uri.endsWith("delete.ss") ) { // 삭제 
				int num = Integer.parseInt(request.getParameter("num") );
				String filesystemname = request.getParameter("filesystemname");  // ""            
				int rowCount = dao.delete(conn, num);         
				String pathname = String.format("%s\\%s", saveDirectory, filesystemname);
				File deleteFile = new File(pathname);   
				if ( deleteFile.exists() ) {
					deleteFile.delete();
				} 
				response.sendRedirect("list.ss");
			}else if( uri.endsWith("update.ss") ) { // 수정 + update.jsp
				//update.ss?num=${dto.num}&filesystemname=${dto.
				int num = Integer.parseInt(request.getParameter("num"));
				FileTestDTO dto = dao.selectOne(conn, num);
				request.setAttribute("dto", dto);
				String path = "/days10/ex06_update.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			}else if( uri.endsWith("update_ok.ss") ) { // 수정 저장.
				//첨부파일이 없는 곳에 파일을 첨부해 그럼 파일+인덱스 해서 넣으면 돼
				/*
				 * int num = Integer.parseInt(request.getParameter("num")); FileTestDTO dto =
				 * dao.selectOne(conn, num); if(dto == null) {
				 * 
				 * }
				 */

				// ㄷ.
				int maxPostSize = 5 * 1024 * 1024; // 5MB
				// ㄹ.
				String encoding = "UTF-8";
				// ㅁ. a1.txt
				FileRenamePolicy policy = new DefaultFileRenamePolicy();



				// cos.jar 파일 MultipartRequest 클래스...
				MultipartRequest multiRequest = new MultipartRequest(
						request
						, saveDirectory
						, maxPostSize
						, encoding
						, policy
						); //이미 첨부파일은 서버의 upload폴더에 저장한 상태(오류가 없다면)
						// 수정하고자 하는 글 번호
				//update.jsp에 hidden tag로 num을 숨겨놔서 받을 수 있어
				//<input type="hidde" name="num" value="${dto.num}"> <a href="list.ss">Home</a>
				int num = Integer.parseInt(multiRequest.getParameter("num"));


				//<a href="update.ss?num=${dto.num }&filesystemname=${dto.filesystemname }">수정</a>
				//삭제할 파일명이 필요할 때 또 db를 select할 필요없게
				String delete_filesystemname = multiRequest.getParameter("filesystemname");
				//delete_filesystemname에는 파일명만 담겨있어
				FileTestDTO dto = new FileTestDTO();
				dto.setNum(num);
				String subject = multiRequest.getParameter("subject");
				dto.setSubject(subject);
				//<input type="file" name="attachFile" />인 걸 기억
				File attachFile = multiRequest.getFile("attachFile");//첨부된 파일 객체
				if(attachFile != null) {//첨부파일이 있다면
					String fileName = attachFile.getName();
					long filelength = attachFile.length();

					String originalFileName = multiRequest.getOriginalFileName("attachFile");
					String fileSystemName = multiRequest.getFilesystemName("attachFile");

					dto.setFilelength(filelength);
					dto.setOriginalfilename(originalFileName);
					dto.setFilesystemname(fileSystemName);
					//이것들 dto 객체에 담아
					//첨부파일이 있는데 새로운 거로 갈았으면 원래 있던 건 삭제되어야지
					//delete_filesystemname에는 파일명만 있으니까 경로를 따로 잡아주어야 해
					String deleteFilePath = String.format("%s\\%s", saveDirectory, delete_filesystemname);
					File deleteFile = new File(deleteFilePath);
					if(deleteFile.exists())deleteFile.delete();
					// update 전에 있던 첨부파일은 제거

				}else if(!delete_filesystemname.equals("")){//첨부파일이 없다면
					//새로 수정하기 위한 첨부파일은 없지만 이전 첨부파일은 존재하는 경우
					FileTestDTO dto2 = dao.selectOne(conn, num);
					dto.setFilelength(dto2.getFilelength());
					dto.setOriginalfilename(dto2.getOriginalfilename());
					dto.setFilesystemname(dto2.getFilesystemname());

				}//if-else
				int rowCount = dao.update(conn, dto);
				response.sendRedirect("list.ss");

				//첨부파일이 있는데 첨부파일은 안 건드렸어(제목만 수정했어)
				//그럼 원래 들어있는 첨부파일 상태는 DB에 그대로 유지해야지


			} // update_ok.ss if


		} catch (Exception e) {//do get try
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
		} // try
	}//do get()


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//이건 필요없을 수도
		response.setContentType("text/html; charset=UTF-8");//한글 깨지는 경우도 맞춰
		doGet(request, response);//post여도 get으로 보내~
	}

}
