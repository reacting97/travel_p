package handler.travel;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import handler.Handler;
import travel.TravelService;
import travel.TravelVO;

public class TravelAjaxList implements Handler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		TravelService service = new TravelService();
		ArrayList<TravelVO> list = service.selectAll();
		request.setAttribute("list", list);
		
		JSONArray arr = new JSONArray();
		for(TravelVO travel : list) {
			JSONObject obj = new JSONObject();
			obj.put("id", travel.getId());
			obj.put("name", travel.getName());
			obj.put("address", travel.getAddress());
			obj.put("phone", travel.getPhone());
			obj.put("pic1", travel.getPic1());
			arr.add(obj);
		}
		
		String txt = arr.toJSONString();
		return "rsps@"+txt;
	}
}