package handler.recordboard;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import record_board.RecordBoardService;
import record_board.RecordBoardVo;

public class DetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		RecordBoardVo vo = new RecordBoardVo();
		RecordBoardService s = new RecordBoardService();
		vo = s.selectByNum(num);
		request.setAttribute("vo", vo);
		return "/recordboard/detail.jsp";
	}

}
