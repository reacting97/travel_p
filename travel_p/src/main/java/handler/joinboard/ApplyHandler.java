package handler.joinboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import party.PartyService;
import party.PartyVo;

public class ApplyHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String master = request.getParameter("master");
		String party_member = request.getParameter("id");
		int num = Integer.parseInt(request.getParameter("num"));
		PartyVo vo = null;
		PartyService s = new PartyService();
		vo = s.select(new PartyVo(master, party_member, num));
		if(vo == null) {
			s.AddPartyMember(new PartyVo(master,party_member,num));
			String msg = "신청이 완료되었습니다";
			request.setAttribute("msg", msg);
		} else {
			String msg = "이미 신청하셨습니다";
			request.setAttribute("msg", msg);
		}
		return "/joinboard/detail.do?num="+num;
	}

}
