package days03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//                                                                                       수정
@WebServlet(description = "서블릿에서 get/post 방식 요청 테스트", urlPatterns = { "/method/info.htm" })

public class Info extends HttpServlet {
   private static final long serialVersionUID = 1L;

    public Info() {
        super();

    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   response.setContentType("text/html; charset=UTF-8");
	  System.out.println(">> Info.doGet()");
      PrintWriter out = response.getWriter();
      
      String name = request.getParameter("name");
      int age = Integer.parseInt(request.getParameter("age"));
      
      out.print("이름 : " + name + "<br>");
      out.print("나이 : " + age + "<br>");
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   response.setContentType("text/html; charset=UTF-8");
	   request.setCharacterEncoding("UTF-8");
	   System.out.println("> Info.doPost()");
      PrintWriter out = response.getWriter();
      
      String name = request.getParameter("name");
      int age = Integer.parseInt(request.getParameter("age"));
      
      out.print("이름 : " + name + "<br>");
      out.print("나이 : " + age + "<br>");
   }

}
