package handler.recommandboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import recommand_board.RecommandBoardService;
import recommand_board.RecommandBoardVo;
import recommandrep.RecommandRepVo;

public class RecommandListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		RecommandBoardService service = new RecommandBoardService();
		RecommandBoardService serv = new RecommandBoardService();
		ArrayList<RecommandBoardVo> list = service.getAll();
		for(RecommandBoardVo vo:list) {
			ArrayList<RecommandRepVo> reps = serv.getReps(vo.getNum());
			vo.setReps(reps);
		}
		request.setAttribute("list", list);
		request.setAttribute("view", "/recommandboard/list.jsp");
		return "/index.jsp";
	}


	}


