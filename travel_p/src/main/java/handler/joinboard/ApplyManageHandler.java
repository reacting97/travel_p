package handler.joinboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import party.PartyService;
import party.PartyVo;

public class ApplyManageHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		if (request.getMethod().equals("GET")) {
			ArrayList<PartyVo> list = new ArrayList<>();
			int num = Integer.parseInt(request.getParameter("num"));
			PartyService s = new PartyService();
			list = s.selectByNum(num);
			request.setAttribute("list", list);
			view = "/joinboard/applymanage.jsp";
		}else {
			
		}
		return view;
	}

}
