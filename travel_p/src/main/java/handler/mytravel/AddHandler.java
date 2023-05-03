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
		if(vo == null) {
			msg = "나의 찜리스트에 정상적으로 추가되었습니다.";
			s.addMyTravel(new MyTravelVo(0, id, num));
		}else {
			msg = "나의 찜리스트에서 삭제하였습니다.";
			s.delMyTravel(vo.getNum());
		}
		return "responsebody/"+msg;
		
	}

}
