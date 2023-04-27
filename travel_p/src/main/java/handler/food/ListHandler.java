package handler.food;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.FoodService;
import food.FoodVO;
import handler.Handler;
import join_board.JoinBoardService;
import join_board.JoinBoardVo;

public class ListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		FoodService service = new FoodService();
		ArrayList<FoodVO> list = service.selectAll();
		request.setAttribute("list", list);
		
		return "/food/list.jsp";
	}

}
