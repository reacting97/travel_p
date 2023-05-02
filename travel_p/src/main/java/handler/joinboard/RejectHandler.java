package handler.joinboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import msg.MsgService;
import msg.MsgVo;
import party.PartyService;

public class RejectHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		int num = Integer.parseInt(request.getParameter("num"));
		PartyService s = new PartyService();
		MsgService s2 = new MsgService();
		s.delPartyMember(num, id);
		s2.addMsg(new MsgVo(0, id, "참가신청이 거절되었습니다"));
		request.setAttribute("msg2", id+"님에게 거절 메세지가 전달되었습니다~");
		return "/joinboard/apply2.do";
	}

}
