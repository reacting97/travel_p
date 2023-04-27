package handler.cntup;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import record_board.RecordBoardService;
import record_board.RecordBoardVo;

public class UpHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		RecordBoardService service = new RecordBoardService();
		int num = Integer.parseInt(request.getParameter("bnum"));
		String id = request.getParameter("writer");
		service.upCnt(num);
		RecordBoardVo vo =service.selectByNum(num);
		
		JSONObject obj = new JSONObject();
		obj.put("cnt", vo.getCnt());
		String txt = obj.toJSONString();
		return "responsebody/"+txt;
	}

}
