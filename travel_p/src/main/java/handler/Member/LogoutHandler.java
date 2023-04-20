package handler.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;

public class LogoutHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		session.invalidate(); // 로그아웃 처리. 세션무효화
		request.setAttribute("msg", "로그아웃 완료");
		return "/index.jsp";

	}
}