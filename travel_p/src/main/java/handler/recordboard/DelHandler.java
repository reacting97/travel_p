package handler.recordboard;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import record_board.RecordBoardService;

public class DelHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		RecordBoardService service = new RecordBoardService();
		service.delBoard(num);
		return "/recordboard/list.do";
	}

}
