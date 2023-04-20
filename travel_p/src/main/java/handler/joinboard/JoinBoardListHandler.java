package handler.joinboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import join_board.JoinBoardService;
import join_board.JoinBoardVo;

public class JoinBoardListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		JoinBoardService service = new JoinBoardService();
		ArrayList<JoinBoardVo> list = service.getAll();
		request.setAttribute("list", list);
		
		return "/index.jsp";
	}

}
