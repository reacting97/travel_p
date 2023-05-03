package handler.joinboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.CommentService;
import comment.CommentVo;
import handler.Handler;
import join_board.JoinBoardService;
import join_board.JoinBoardVo;
import like.LikeService;
import party.PartyService;
import party.PartyVo;

public class DetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ArrayList<CommentVo> clist = new ArrayList<>();
		ArrayList<PartyVo> plist = new ArrayList<>();
		int num = Integer.parseInt(request.getParameter("num"));
		PartyService s2 = new PartyService();
		JoinBoardService service = new JoinBoardService();
		
		plist = s2.selectByNum(num);
		JoinBoardVo vo = service.getBoard(num);
		request.setAttribute("vo", vo);
		CommentService s = new CommentService();
		clist=s.selectByBoard(num);
		request.setAttribute("plist", plist);
		request.setAttribute("clist", clist);
		
		
		return "/joinboard/detail.jsp";
	}

}
