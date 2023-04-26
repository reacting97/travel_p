package req;

import java.io.FileNotFoundException;


import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("*.do") // 뷰 페이지 요청을 제외한 모든 요청이 여기로 온다
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// commands.properties 파일의 url과 명령어를 읽어서 저장할 map
	private Map<String, Handler> map = new HashMap<>();

	// 서블릿 생성시 딱 한번 실행되는 메서드.
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		Properties prop = new Properties();

		// 파람 경로를 웹에서 사용하는 실제 경로로 변환
		String path = this.getServletContext().getRealPath("/WEB-INF/commands.properties");
		try {
			// commands.properties 파일의 키, 값을 로드해서 prop에 저장
			prop.load(new FileReader(path));
			Iterator iter = prop.keySet().iterator();

			while (iter.hasNext()) {
				String url = (String) iter.next(); /// member/join.do
				String className = prop.getProperty(url); // handler.member.JoinHandler
				System.out.println(url + " / " + className);

				// Class: 클래스에 대한 정보 갖음. 클래스이름, 멤버변수이름/타입, 메서드 이름/프로토타입
				try {
					// 지정한 클래스 정보를 갖는 Class 객체 반환
					Class<?> handlerClass = Class.forName(className);
					// 지정한 클래스의 객체를 생성할 생성자 반환
					Constructor<?> cons = handlerClass.getConstructor(null);
					// handler 객체 생성
					Handler handler = (Handler) cons.newInstance();
					// 생성한 handler 객체를 url과 같이 map에 저장

					// 위 세줄은 다음 한줄과 동일 =>Handler handler = new JoinHandler();
					map.put(url, handler);

				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DispatcherServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 요청을 처리한 뒤 뷰페이지 이동
		String url = request.getServletPath();// 요청 url반환
		String view = null;
		Handler handler = map.get(url);// 업캐스팅

		if (handler != null) {
			view = handler.process(request, response);
			if (view != null) {

				if (view.startsWith("redirect")) {
					String[] path = view.split(":");
					response.sendRedirect(request.getContextPath() + path[1]);
				} else if (view.startsWith("responsebody")) {
					String[] path = view.split("/");
					response.getWriter().append(path[1]);//{flag:true}
				} else if (view.startsWith("rsps")) {
					String[] path = view.split("@");
					response.getWriter().append(path[1]);//{flag:true}
				} else {
					RequestDispatcher dis = request.getRequestDispatcher(view);
					dis.forward(request, response);
				}
			}
		} else {
			response.getWriter().append("404 not found url");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
