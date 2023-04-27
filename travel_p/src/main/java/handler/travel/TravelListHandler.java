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

public class TravelListHandler implements Handler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String loc = request.getParameter("loc");
//		TravelService service = new TravelService();
//		ArrayList<TravelVO> list = new ArrayList<>();
//		if(loc == null || loc.equals("")) {
//			list = service.selectAll();
//		} else {
//			list = service.selectByLoc(loc);
//		}
//		
//		request.setAttribute("list", list);
		request.setAttribute("loc", loc);
		return "/travel/travel_list.jsp";
	}
}
