package handler.recordboard;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import record_board.RecordBoardService;
import record_board.RecordBoardVo;

public class ListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ArrayList<RecordBoardVo> list = new ArrayList<RecordBoardVo>();
		RecordBoardService s = new RecordBoardService();
		list = s.selectAll();
		request.setAttribute("list", list);
		return "/recordboard/list.jsp";
	}

}
