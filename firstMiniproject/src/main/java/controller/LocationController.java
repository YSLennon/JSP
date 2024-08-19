package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.AsyncContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.UserDAO;
import model.User;

// 비동기 처리를 위한 어노테이션
@WebServlet(value = "/page", asyncSupported = true)
public class LocationController extends HttpServlet {
	private UserDAO userDAO;

	public void init() {
		userDAO = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("LocationControllerOn");
		// 비동기 실행
		final AsyncContext asyncContext = request.startAsync();
		asyncContext.start(() -> {
			try {
				String act = request.getParameter("act");
				System.out.println("act: " + act);
				if(act == null || act == "") {
					RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/intro.jsp");
					dispatcher.forward(request, response);
					return;
				}
				System.out.println(request.getParameter("jsonData"));
				System.out.println(request.getParameter("act"));
				
 
				if (act.equals("main")) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/intro.jsp");
					dispatcher.forward(request, response);
				} else if (act.equals("join")) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/join.jsp");
					dispatcher.forward(request, response);
				} else if(act.equals("userSchedule")) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/listView.jsp");
					dispatcher.forward(request, response);
				} else if (act.equals("searchGroup")){
					RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/listView.jsp");
					dispatcher.forward(request, response);						
				} else if (act.equals("clientInfo")){
					RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/clientInfo.jsp");
					dispatcher.forward(request, response);						
				} else if (act.equals("userList")){
					RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/userList.jsp");
					dispatcher.forward(request, response);						
				} else if (act.equals("detailViewer")) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/detailViewer.jsp");
					dispatcher.forward(request, response);
				} else if (act.equals("detailViewer")) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/detailViewer.jsp");
					dispatcher.forward(request, response);
				}
						

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 비동기 완료처리 -> 컴플릿되면서 클라이언트에서도 이후 데이터 처리를 한다
				asyncContext.complete();
			}
		});

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("LocationControllerOn");
		final AsyncContext asyncContext = request.startAsync();
		asyncContext.start(()->{
			try {
				String act = request.getParameter("act");
				 if (act.equals("schedule")) {
						User userSession = (User) request.getSession().getAttribute("userSession");
						boolean successSession=!(userSession == null); 
						
							response.setContentType("application/json");
							response.setCharacterEncoding("UTF-8");
							
							PrintWriter out = response.getWriter();
							
							out.print("{\"success\": "+successSession+"}");
							out.flush();
					}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				asyncContext.complete();
			}
		});

	}

	private String str(String str) {
		return "'" + str + "'";

	}


	// Session 사용하고싶어지면 보셈

//	String uid = request.getParameter("uid");
//	String pwd = request.getParameter("pwd");
//	String confirmPwd = request.getParameter("confirmPwd");
//	String name = request.getParameter("name");
//	String phone = request.getParameter("phone");
//	String addr = request.getParameter("addr");
//	String nickName = request.getParameter("nickName");
//	String favor = request.getParameter("favor");
//
////	세션 데이터 생성하기
//    User user = new User(uid, pwd, name, phone, addr, nickName, favor);
//    HttpSession session = request.getSession();
//    session.setAttribute("user", user);
//    session.setAttribute("confirmPwd", confirmPwd);
}