/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.93
 * Generated at: 2024-10-17 00:36:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.days01;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ex03_005f06_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
 
// int num = Integer.parseInt(request.getParameter("num"));
// 그냥 parse했더니 null일 때도 parse해서 500에러 뜸


//int num = request.getParameter("num")==null?0:Integer.parseInt(request.getParameter("num"));
String pNum = request.getParameter("num");
int num = 0;
if(pNum != null && !pNum.equals("")){
	num = Integer.parseInt(pNum);
}
  
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"shortcut icon\" type=\"image/x-icon\"\r\n");
      out.write("	href=\"http://localhost/jspPro/images/SiSt.ico\">\r\n");
      out.write("<script\r\n");
      out.write("	src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js\"></script>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("	href=\"http://localhost/jspPro/resources/cdn-main/example.css\">\r\n");
      out.write("<script src=\"http://localhost/jspPro/resources/cdn-main/example.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write("span.material-symbols-outlined {\r\n");
      out.write("	vertical-align: text-bottom;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<header>\r\n");
      out.write("		<h1 class=\"main\">\r\n");
      out.write("			<a href=\"#\" style=\"position: absolute; top: 30px;\">Seeker Home</a>\r\n");
      out.write("		</h1>\r\n");
      out.write("		<ul>\r\n");
      out.write("			<li><a href=\"#\">로그인</a></li>\r\n");
      out.write("			<li><a href=\"#\">회원가입</a></li>\r\n");
      out.write("		</ul>\r\n");
      out.write("	</header>\r\n");
      out.write("	<div>\r\n");
      out.write("		<xmp class=\"code\"> </xmp>\r\n");
      out.write("		                    \r\n");
      out.write("  </xmp>\r\n");
      out.write("  <!-- <form> -->\r\n");
      out.write("  <!-- 정수 : <input type=\"text\" id=\"num\" name=\"num\" autofocus=\"autofocus\" value='");
      out.write("'>-->\r\n");
      out.write("  정수 : <input type=\"text\" id=\"num\" name=\"num\" autofocus=\"autofocus\"> \r\n");
      out.write("  <p id=\"demo\">\r\n");
      out.write("  ");
  
    if( pNum != null && !pNum.equals("") ){
          int sum = 0;
          for(int i=1; i<= num ; i++){
             sum += i;
        
      out.print( i );
      out.write('+');
        
          } // for
        
      out.write('=');
      out.print( sum );
      out.write("\r\n");
      out.write("        ");

    } // if
  
      out.write("\r\n");
      out.write("  </p>\r\n");
      out.write("  <!-- </form> -->\r\n");
      out.write("  <script>\r\n");
      out.write("    $(\"#num\")\r\n");
      out.write("      .css(\"text-align\",\"center\")\r\n");
      out.write("      ");
      out.write("\r\n");
      out.write("      .val(`");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.num}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("`)\r\n");
      out.write("      .on({\r\n");
      out.write("         \"keydown\":function (e){\r\n");
      out.write("            if ( !(e.which >= 48 && e.which <= 57                 \r\n");
      out.write("                     || e.which == 8\r\n");
      out.write("                     || e.which == 13\r\n");
      out.write("                     || e.which == 229\r\n");
      out.write("                 )){\r\n");
      out.write("               alert(\"숫자만 입력하세요.\");\r\n");
      out.write("               e.preventDefault();\r\n");
      out.write("            } // if\r\n");
      out.write("         },\r\n");
      out.write("         \"keyup\":function (event){\r\n");
      out.write("           //if( $(\"#num\").val().length != 0  && event.which == 13){\r\n");
      out.write("           if( event.which == 13){    \r\n");
      out.write("              // js BOM\r\n");
      out.write("              // $(\"form\").submit();\r\n");
      out.write("              let numValue = $(\"#num\").val();\r\n");
      out.write("              location.href = `ex03_06.jsp?num=${numValue}`;\r\n");
      out.write("           } // if\r\n");
      out.write("         }\r\n");
      out.write("      })\r\n");
      out.write("      .select();\r\n");
      out.write("  </script>\r\n");
      out.write("</div> \r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("		\r\n");
      out.write("		\r\n");
      out.write("		\r\n");
      out.write("		\r\n");
      out.write("<!--\r\n");
      out.write("정수 : <input type=\"number\" id=\"num\" autofocus value=\"");
      out.write("\"> <br>\r\n");
      out.write("<p id=\"demo\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" </p>\r\n");
      out.write("<script>\r\n");
      out.write("$(\"#num\")\r\n");
      out.write("  .css(\"text-align\",\"center\")\r\n");
      out.write("  .on({ \"keydown\":function (e){\r\n");
      out.write("        if ( !(e.which >= 48 && e.which <= 57\r\n");
      out.write("                 || e.which == 8\r\n");
      out.write("                 || e.which == 13\r\n");
      out.write("                 || e.which == 229\r\n");
      out.write("             )){\r\n");
      out.write("           alert(\"숫자만 입력하세요.\");\r\n");
      out.write("           e.preventDefault();\r\n");
      out.write("        } // if\r\n");
      out.write("     },\r\n");
      out.write("     \"keyup\":function (event){\r\n");
      out.write("       //if( event.which == 13 && $(\"$num\").val().length != 0){\r\n");
      out.write("    	 if( event.which == 13){\r\n");
      out.write("          // js BOM\r\n");
      out.write("          let numValue = $(\"#num\").val();\r\n");
      out.write("          // 페이지를 재요청할 때 입력한 값을 쿼리 파라미터로 전달\r\n");
      out.write("          location.href = `ex03_06.jsp?num=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${numValue}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("`;/* location으로 하면 무조건 GET방식 */\r\n");
      out.write("\r\n");
      out.write("          /* $(\"form\").submit(); */          \r\n");
      out.write("       } // if\r\n");
      out.write("     }\r\n");
      out.write("  });\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("	  </script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>-->");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
