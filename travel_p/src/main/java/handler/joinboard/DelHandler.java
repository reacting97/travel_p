package handler.joinboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import join_board.JoinBoardService;

public class DelHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		JoinBoardService service = new JoinBoardService();
		service.delBoard(num);
		return "/joinboard/list.do";
	}

}
