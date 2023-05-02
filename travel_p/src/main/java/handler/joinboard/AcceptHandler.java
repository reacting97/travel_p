package handler.joinboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import msg.MsgService;
import msg.MsgVo;

public class AcceptHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MsgService s = new MsgService();
		String id = request.getParameter("id");
		String content = "참가신청이 승인되었습니다";
		s.addMsg(new MsgVo(0, id, content));
		request.setAttribute("msg2", id+"님에게 승인 메세지가 전달되었습니다~");
		return "/joinboard/apply2.do";
	}

}
