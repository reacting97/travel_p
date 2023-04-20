package handler.joinboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import join_board.JoinBoardService;
import join_board.JoinBoardVo;

public class JoinBoardEditlHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		JoinBoardService service = new JoinBoardService();
		service.editBoard(new JoinBoardVo(num,"",title,content,null));
		service.delBoard(num);
		
		
		
		return "/joinboard/edit.do";
	}

}
