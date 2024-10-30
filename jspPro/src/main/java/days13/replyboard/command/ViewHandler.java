package days13.replyboard.command;

// 글번호가 num으로 넘어오니까 db를 dto로 가져와서 포워딩

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days13.replyboard.service.ViewService;
import days13.replyboard.domain.ReplyBoardDTO;

public class ViewHandler implements CommandHandler{

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // view.do?num=2&cp/sc/sw
      int num = Integer.parseInt( request.getParameter("num") );

      ViewService contentService = ViewService.getInstance();
      ReplyBoardDTO dto = contentService.selectOne(num);

      request.setAttribute("dto", dto);

      return "/days13/replyboard/view.jsp";

   } // process

} // class