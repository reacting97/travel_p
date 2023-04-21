package handler.joinboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import join_board.JoinBoardService;
import join_board.JoinBoardVo;

public class DetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		JoinBoardService service = new JoinBoardService();
		JoinBoardVo vo = service.getBoard(num);
		request.setAttribute("vo", vo);
		
		
		
		return "/joinboard/detail.do";
	}

}
