package days07.mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListHandler implements CommandHandler{//Logic 담당하는 Model
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ListHandler.process() 호출");
		return "/days07/board/list.jsp";//view로 return해서 출력
	}
}
