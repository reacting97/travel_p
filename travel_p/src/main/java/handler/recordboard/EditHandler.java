package handler.recordboard;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.Handler;
import recommand_board.RecommandBoardService;
import recommand_board.RecommandBoardVo;
import record_board.RecordBoardService;
import record_board.RecordBoardVo;

public class EditHandler implements Handler {

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
		response.setContentType("text/html; charset=utf-8");

		String view = "";
		if (request.getMethod().equals("GET")) {
			int num = Integer.parseInt(request.getParameter("num"));
			RecordBoardService service1 = new RecordBoardService();
			RecordBoardVo vo = service1.selectByNum(num);
			request.setAttribute("vo", vo);
			view = "/recordboard/edit.jsp";
		} else {
			int size = 100 * 1024 * 1024;
			String path = "C:\\Users\\wnsgk\\Desktop\\web_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";
			MultipartRequest multipart;
			try {
				multipart = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
				int num = Integer.parseInt(multipart.getParameter("num"));
				String title = multipart.getParameter("title");
				String content = multipart.getParameter("content");
				String price = multipart.getParameter("price");
				File f1 = multipart.getFile("file1");
				File f2 = multipart.getFile("file2");
				File f3 = multipart.getFile("file3");

				String fname1 = "\\img\\" + f1.getName();
				String fname2 = "\\img\\" + f2.getName();
				String fname3 = "\\img\\" + f3.getName();

				RecordBoardService s = new RecordBoardService();
				s.editBoard(new RecordBoardVo(num,null,title,content,price,null,fname1,fname2,fname3,0));

				view = "redirect:/recordboard/detail.do?num="+num;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return view;
	}

}
