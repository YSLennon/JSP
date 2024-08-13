package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.AsyncContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

// 비동기 처리를 위한 어노테이션
@WebServlet(value = "/user", asyncSupported = true)
public class UserController extends HttpServlet {
	private UserDAO userDAO;

	public void init() {
		userDAO = new UserDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		System.out.println(request.getParameter("act"));
		//비동기 실행
		final AsyncContext asyncContext = request.startAsync();
		asyncContext.start(()->{
			try {
				String act = request.getParameter("act");
				if(act.equals("checkUid")) {
					String sql = "select * from tbl_user where uid = '"+request.getParameter("uid")+"'";
					System.out.println(userDAO.checkUid(sql));
					response.setContentType("application/json");
					PrintWriter out = response.getWriter();
					out.print("{\"isAvailable\": "+userDAO.checkUid(sql)+"}");
					out.flush();
				}
					
			}	catch(Exception e) {
				e.printStackTrace();
			} finally {
				// 비동기 완료처리 -> 컴플릿되면서 클라이언트에서도 이후 데이터 처리를 한다
				asyncContext.complete();
			}
		});
		
	}
	
	
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		try {
//			if (request.getParameter("act") == null) {
//				showList(request, response);
//			} else {
//
//				String act = request.getParameter("act");
//				
//				if (act.equals("join")) {
//					insertUser(request, response);
//					
//				} else if (act.equals("checkUid")) {
//					checkUid(request,response);
//					
//				}
//				
//			}
//
//		} catch (SQLException e) {
//			throw new ServletException(e);
//		}
//	}
//
//	private void showList(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, ServletException, IOException {
//
//		// 모든 사용자 정보를 가져옴
//		List<User> userList = userDAO.listAllUsers();
//
//		// request 객체에 사용자 목록 저장
//		request.setAttribute("userList", userList);
//
//		// JSP 페이지로 포워딩
//		RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/user-list.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void insertUser(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, ServletException, IOException {
//
//		String uid = request.getParameter("uid");
//		String pwd = request.getParameter("pwd");
//		String name = request.getParameter("name");
//		String phone = request.getParameter("phone");
//		String addr = request.getParameter("addr");
//		String nickName = request.getParameter("nickName");
//		String favor = request.getParameter("favor");
//		String sql = "INSERT INTO tbl_user (uid, pwd, name, phone, addr, nickName, favor) " + " VALUES ('" + uid
//				+ "', '" + pwd + "', '" + name + "', '" + phone + "', '" + addr + "', '" + nickName + "', '" + favor
//				+ "')";
//		userDAO.insertUser(sql);
//		
//
//		response.sendRedirect("/firstMiniproject/user");
//	}
//	
	//Session 사용하고싶어지면 보셈

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