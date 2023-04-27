package handler.comment;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.CommentService;
import comment.CommentVo;
import handler.Handler;

public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int num = Integer.parseInt(request.getParameter("num"));
		String writer = request.getParameter("name");
		String content = request.getParameter("content");
		
	
		CommentService s = new CommentService();
		s.addComment(new CommentVo(0,num,content,writer,null));
		
		return "/joinboard/detail.do?num="+num;
	}

}
