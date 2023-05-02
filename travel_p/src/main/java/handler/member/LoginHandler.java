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
		String msg ="";
		if (request.getMethod().equals("GET")) {
			view = "/member/login.jsp";
		} else {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			MemberService service = new MemberService();
			MemberVo vo = service.getMember(id);
			
			if(vo != null) {
				if (vo.getId() != null && pwd.equals(vo.getPwd()) && vo.getManager().equals("0")) {
					HttpSession session = request.getSession();
					session.setAttribute("loginId", id);
					view = "redirect:/index.jsp";
				} else if(vo.getId() != null && pwd.equals(vo.getPwd()) && vo.getManager().equals("1")) {
					HttpSession session = request.getSession();
					session.setAttribute("loginIdManager", id);
					view = "redirect:/index.jsp";
				} else if(vo.getId() != null && !pwd.equals(vo.getPwd())) {
					msg = "비밀번호가 올바르지 않습니다. 다시 로그인해주십시오";
					request.setAttribute("msg", msg);
					view = "/member/login.jsp";
				}
			}else {
				msg = "없는 아이디입니다. 다시 로그인해주십시오";
				request.setAttribute("msg", msg);
				view = "/member/login.jsp";
			}
		}
		return view;
	}
}