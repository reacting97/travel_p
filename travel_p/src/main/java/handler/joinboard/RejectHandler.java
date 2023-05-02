package handler.joinboard;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import join_board.JoinBoardService;
import join_board.JoinBoardVo;
import msg.MsgService;
import msg.MsgVo;
import party.PartyService;

public class RejectHandler implements Handler {

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
		String id = request.getParameter("id");
		String master = request.getParameter("master");
		int num = Integer.parseInt(request.getParameter("num"));
		
		JoinBoardService js = new JoinBoardService();
		JoinBoardVo jvo = js.getBoard(num);
		PartyService s = new PartyService();
		MsgService s2 = new MsgService();
		s.delPartyMember(num, id);
		s2.addMsg(new MsgVo(0, id, master+"님이"+jvo.getTitle()+"게시판의 참가신청이 거절되었습니다"));
		JSONObject obj = new JSONObject();
		obj.put("msg2", id+"님에게 거절 메세지가 전달되었습니다~");
		String txt = obj.toJSONString();
		return "responsebody/"+txt;
	}

}
