package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.doit.domain.DeptVO;

import com.util.DBConn;

@WebServlet("/days04/empsearch.htm")
public class EmpSearch extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public EmpSearch() {
      super();

   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      System.out.println("doGet()");

      // 1. 부서 정보를 리스트에 담는다.
      Connection conn = DBConn.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = " SELECT deptno, dname, loc "
            +" FROM dept ";
      int deptno;
      String dname, loc;

      DeptVO vo = null;
      ArrayList<DeptVO> dlist = null;

      try{
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         if( rs.next() ){
            dlist = new ArrayList<>();
            do{
               deptno = rs.getInt("deptno");
               dname = rs.getString("dname");
               loc = rs.getString("loc");           
               vo = new DeptVO(deptno, dname, loc);
               dlist.add(vo);
            }while(rs.next());
         } // if
      }catch(Exception e){
         e.printStackTrace();
      }finally{
         try{
            rs.close();
            pstmt.close();
            // DBConn.close();
         }catch(SQLException e){
            e.printStackTrace();
         } //try     
      } // try  

      // 2. 잡 정보를 리스트에 담는다.
      sql = " SELECT DISTINCT job "
            +" FROM emp "
            +" ORDER BY job ASC";      
      String job;      
      ArrayList<String> jlist = null;
      try{
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         if( rs.next() ){
            jlist = new ArrayList<>();
            do{ 
               job = rs.getString("job"); 
               jlist.add(job);
            }while(rs.next());
         } // if
      }catch(Exception e){
         e.printStackTrace();
      }finally{
         try{
            rs.close();
            pstmt.close();
            // DBConn.close();
         }catch(SQLException e){
            e.printStackTrace();
         } //try     
      } // try  

      // 3. 선택한 부서+잡 으로 검색된 사원 정보
      
      
      // 4. 포워딩 한다.
      request.setAttribute("dlist", dlist);
      request.setAttribute("jlist", jlist);
      
      String path = "/days04/ex02_empsearch_jstl.jsp";
      RequestDispatcher dispatcher = request.getRequestDispatcher(path);
      dispatcher.forward(request, response);

   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      doGet(request, response);
   }

} // class
