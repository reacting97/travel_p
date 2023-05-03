package handler.joinboard;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import msg.MsgService;

public class DelMsgHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String msg = "";
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		MsgService s = new MsgService();
		if(id != null) {
			msg = "1.메세지 삭제가 정상적으로 처리되었습니다";
			s.delMsg(num);
		}else {
			msg = "2.메세지 삭제가 처리되지 않았습니다";
		}
		return "responsebody/"+msg;
	}

}
