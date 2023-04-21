package handler.recommandboard;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import recommand_board.RecommandBoardService;
import recommand_board.RecommandBoardVo;

public class DelHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String path = "";
		int num = Integer.parseInt(request.getParameter("num"));
		RecommandBoardService service = new RecommandBoardService();
		RecommandBoardVo vo = service.getImg(num);
		String delf = path + vo.getPath();
		File f = new File(delf);
		f.delete();//파일 삭제
		service.delImg(num);
		return "/recommandboard/list.jsp";
	}
}