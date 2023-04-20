package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//모든 요청 처리 클래스의 부모
public interface Handler {
	String process(HttpServletRequest request, HttpServletResponse response);
}
