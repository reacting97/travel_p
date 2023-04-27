package handler.food;

import java.io.File;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import food.FoodService;
import food.FoodVO;
import handler.Handler;

public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		if (request.getMethod().equals("GET")) {
			view = "/food/add.jsp";
		} else {
			int size = 100 * 1024 * 1024;
			String path = "C:\\Users\\wnsgk\\Desktop\\web_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";
			MultipartRequest multipart;
			try {
				multipart = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
				String name = multipart.getParameter("name");
				String address = multipart.getParameter("address");
				String phone = multipart.getParameter("phone");
				String content = multipart.getParameter("content");
				File f1 = multipart.getFile("file1");
				File f2 = multipart.getFile("file2");

				String fname1 = "\\img\\" + f1.getName();
				String fname2 = "\\img\\" + f2.getName();

				FoodService s = new FoodService();
				s.insert(new FoodVO(0,name,address,phone,fname1,fname2,content));

				view = "redirect:/food/list.do";
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return view;
	}

}
