package handler.joinboard;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import party.PartyService;
import party.PartyVo;

public class ApplyHandler implements Handler {

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
		String txt = "";
		String master = request.getParameter("master");
		String party_member = request.getParameter("member");
		int num = Integer.parseInt(request.getParameter("joinnum"));
		PartyVo vo = null;
		PartyService s = new PartyService();
		vo = s.select(new PartyVo(master, party_member, num));
		if(vo == null) {
			s.AddPartyMember(new PartyVo(master,party_member,num));
			String msg = "신청이 완료되었습니다";
			JSONObject obj = new JSONObject();
			obj.put("msg", msg);
			txt = obj.toJSONString();
		} else {
			String msg = "이미 신청하셨습니다";
			JSONObject obj = new JSONObject();
			obj.put("msg", msg);
			txt = obj.toJSONString();
		}
		return "responsebody/"+txt;
	}

}
