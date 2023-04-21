package handler.recommandboard;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.Handler;
import join_board.JoinBoardService;
import join_board.JoinBoardVo;
import recommand_board.RecommandBoardService;
import recommand_board.RecommandBoardVo;

public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String view = "";
		if (request.getMethod().equals("GET")) {
			view = "/recommandboard/add.jsp";
		} else {
			int size = 100 * 1024 * 1024;
			String path = "C:\\Users\\wnsgk\\Desktop\\web_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";
			MultipartRequest multipart;
			try {
				multipart = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
				String writer = multipart.getParameter("writer");
				String title = multipart.getParameter("title");
				String content = multipart.getParameter("content");
				File f1 = multipart.getFile("file1");
				File f2 = multipart.getFile("file2");

				String fname1 = "\\img\\" + f1.getName();
				String fname2 = "\\img\\" + f2.getName();

				RecommandBoardService s = new RecommandBoardService();
				s.addBoard(new RecommandBoardVo(0,writer,title,content,null,fname1,fname2));

				view = "redirect:/recommandboard/list.do";
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return view;
	}

}
