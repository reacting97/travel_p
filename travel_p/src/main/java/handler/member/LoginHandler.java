package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class LoginHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		String msg = "로그인 실패";
		if (request.getMethod().equals("GET")) {
			view = "/member/login.jsp";
		} else {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			MemberService service = new MemberService();
			MemberVo vo = service.getMember(id);

			if (vo.getId() != null && pwd.equals(vo.getPwd())) {
				HttpSession session = request.getSession();
				session.setAttribute("loginId", id);
				view = "redirect:/index.jsp";
			}
		}
		return view;
	}
}