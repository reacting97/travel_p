package handler.recommandboard;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import recommand_board.RecommandBoardService;
import recommand_board.RecommandBoardVo;


public class ListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		RecommandBoardService service = new RecommandBoardService();
		ArrayList<RecommandBoardVo> list = service.getAll();
		request.setAttribute("list", list);
		return "/recommandboard/list.jsp";
	}
}


