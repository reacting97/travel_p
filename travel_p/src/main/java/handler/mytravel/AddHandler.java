package handler.mytravel;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import mytravel.MyTravelService;
import mytravel.MyTravelVo;

public class AddHandler implements Handler {

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
		String msg = "";
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		MyTravelService s = new MyTravelService();
		MyTravelVo vo = s.getByIdNum(id, num);
		System.out.println("add handler");
		if(vo == null) {
			msg = "1 나의 찜리스트에 정상적으로 추가되었습니다.";
			s.addMyTravel(new MyTravelVo(0, id, num));
		}else {
			msg = "2 나의 찜리스트에 이미 추가되어 있는 여행지입니다.";
		}
		System.out.println("response");
		return "responsebody/"+msg;
		
	}

}
