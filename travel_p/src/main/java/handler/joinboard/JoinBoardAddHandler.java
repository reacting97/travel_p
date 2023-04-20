package handler.joinboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import join_board.JoinBoardService;
import join_board.JoinBoardVo;

public class JoinBoardAddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String P = request.getParameter("parent");
		int parent = 0;
		if(P!=null) {
			parent = Integer.parseInt(P);
		}
		JoinBoardVo vo = new JoinBoardVo(0,writer,title,content,null);
		System.out.println(vo);
		JoinBoardService service = new JoinBoardService();
		service.addBoard(vo);
		// TODO Auto-generated method stub
		return "/join_board/add.do";
	}

}
