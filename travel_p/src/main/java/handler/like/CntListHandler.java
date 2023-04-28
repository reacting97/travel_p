package handler.like;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import handler.Handler;
import record_board.RecordBoardService;
import record_board.RecordBoardVo;

public class CntListHandler implements Handler {

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
		
		RecordBoardService service = new RecordBoardService();
		ArrayList<RecordBoardVo> list = service.selectRank();
		request.setAttribute("list", list);
		JSONArray arr = new JSONArray();
		for(RecordBoardVo vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("num", vo.getNum());
			obj.put("title", vo.getTitle());
			obj.put("pic1", vo.getPic1());
			arr.add(obj);
		}
		
		String txt = arr.toJSONString();
		return "rsps@"+txt;
	}

}
