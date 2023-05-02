package handler.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import comment.CommentService;
import handler.Handler;

public class DelHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		CommentService s = new CommentService();
		s.delComment(num);
		JSONObject obj = new JSONObject();
		obj.put("msg", "댓글이 삭제되었습니다~");
		String txt = obj.toJSONString();
		return "responsebody/"+txt;
	}

}
