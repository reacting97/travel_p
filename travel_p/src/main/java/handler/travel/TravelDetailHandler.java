package handler.travel;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.FoodService;
import food.FoodVO;
import handler.Handler;
import travel.TravelService;
import travel.TravelVO;

public class TravelDetailHandler implements Handler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		TravelService service = new TravelService();
		FoodService foodService = new FoodService();
		TravelVO travel = service.selectByNum(num);
		String[] locs = travel.getAddress().split(" ");
		String loc = null;
		if(locs[0].endsWith("시")) {
			loc = locs[0];
		} else if(locs[0].endsWith("도")) {
			loc = locs[1];
		}
		
		ArrayList<FoodVO> list = foodService.selectByLoc(loc);
		request.setAttribute("travel", travel);
		request.setAttribute("foodList", list);
		return "/index.jsp";
	}
}
