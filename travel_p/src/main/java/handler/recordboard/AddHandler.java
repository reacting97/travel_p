package handler.recordboard;

import java.io.File;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.Handler;
import record_board.RecordBoardService;
import record_board.RecordBoardVo;

public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		
		if(request.getMethod().equals("GET")) {
			view = "/recordboard/add.jsp";
		} else {
			int size = 100 * 1024 * 1024;
			String path = "C:\\Users\\wnsgk\\Desktop\\web_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";
			MultipartRequest multipart;
			try {
				multipart = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
				String writer = multipart.getParameter("writer");
				String title = multipart.getParameter("title");
				String content = multipart.getParameter("content");
				String price = multipart.getParameter("price");
				File f1 = multipart.getFile("file1");
				File f2 = multipart.getFile("file2");
				File f3 = multipart.getFile("file3");
				String fname1 = "\\img\\"+f1.getName();
				String fname2 = "\\img\\"+f2.getName();
				String fname3 = "\\img\\"+f3.getName();
				
				
				RecordBoardService s = new RecordBoardService();
		        s.addBoard(new RecordBoardVo(0,writer,title,content,price,null,fname1,fname2,fname3,0));
				
				view = "redirect:/recordboard/list.do";
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return view;
	}

}
