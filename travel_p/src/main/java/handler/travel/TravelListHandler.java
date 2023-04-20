package handler.travel;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import travel.TravelService;
import travel.TravelVO;

public class TravelListHandler implements Handler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		TravelService service = new TravelService();
		ArrayList<TravelVO> list = service.selectAll();
		request.setAttribute("list", list);
		request.setAttribute("view", "/travel/list.jsp");
		return "/index.jsp";
	}
}
