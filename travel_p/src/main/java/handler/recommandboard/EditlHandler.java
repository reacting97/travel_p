package handler.recommandboard;



import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import recommand_board.RecommandBoardService;
import recommand_board.RecommandBoardVo;

public class EditlHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		//System.out.println(num+":"+title+":"+content);
		RecommandBoardService service = new RecommandBoardService();
		service.editBoard(new RecommandBoardVo(0,null,title,content,null,null,null));

		RecommandBoardVo vo = service.getBoard(num);
		JSONObject obj = new JSONObject();
		obj.put("title", vo.getTitle());
		obj.put("content", vo.getContent());
		String txt = obj.toJSONString();
		//System.out.println(txt);
		return "responsebody/" + txt;
	}

}
