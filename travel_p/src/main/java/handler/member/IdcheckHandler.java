package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import member.MemberService;
import member.MemberVo;


public class IdcheckHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id"); // 중복체크 할 id
		MemberService service = new MemberService();
		MemberVo vo = service.getMember(id); // id로 검색
		boolean flag = (vo == null); // 중복되지 않으면 true 아니면 false
		JSONObject obj = new JSONObject(); // {} 객체 하나 생성
		obj.put("flag", flag);
		String txt = obj.toJSONString();
		return "responsebody/" + txt;
	}
}
