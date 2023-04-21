package handler.recommandboard;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import recommand_board.RecommandBoardService;


public class DelHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int num = Integer.parseInt(request.getParameter("num"));
		RecommandBoardService service = new RecommandBoardService();
		service.delBoard(num);
		return "/recommandboard/list.jsp";
	}
}