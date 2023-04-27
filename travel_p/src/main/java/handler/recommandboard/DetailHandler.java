package handler.recommandboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import like.LikeService;
import recommand_board.RecommandBoardService;
import recommand_board.RecommandBoardVo;

public class DetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		RecommandBoardService service = new RecommandBoardService();
		RecommandBoardVo vo = service.getBoard(num);
		LikeService service2 = new LikeService();
		int cnt = service2.getLike(num);
		request.setAttribute("vo", vo);
		request.setAttribute("cnt", cnt);

		return "/recommandboard/detail.jsp";
	}

}
