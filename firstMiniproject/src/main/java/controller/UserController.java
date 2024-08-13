package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private UserDAO userDAO;

	public void init() {
		userDAO = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			if (request.getParameter("act") == null) {
				showList(request, response);
			} else {

				String act = request.getParameter("act");
				
				if (act.equals("join")) {
					insertUser(request, response);
					
				} else if (act.equals("checkUid")) {
					checkUid(request,response);
					
				}
				
			}

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}

	private void showList(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		// 모든 사용자 정보를 가져옴
		List<User> userList = userDAO.listAllUsers();

		// request 객체에 사용자 목록 저장
		request.setAttribute("userList", userList);

		// JSP 페이지로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/user-list.jsp");
		dispatcher.forward(request, response);
	}

	private void insertUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		String nickName = request.getParameter("nickName");
		String favor = request.getParameter("favor");
		String sql = "INSERT INTO tbl_user (uid, pwd, name, phone, addr, nickName, favor) " + " VALUES ('" + uid
				+ "', '" + pwd + "', '" + name + "', '" + phone + "', '" + addr + "', '" + nickName + "', '" + favor
				+ "')";
		userDAO.insertUser(sql);
		

		response.sendRedirect("/firstMiniproject/user");
	}
	
	private void checkUid(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		String sql = "select * from tbl_user where uid = '"+request.getParameter("uid")+"'";
		
		
			request.setAttribute("checkUid", userDAO.checkUid(sql));
		// JSP 페이지로 포워딩
			System.out.println(request.getParameter("act"));
		RequestDispatcher dispatcher = request.getRequestDispatcher("first_mini_project/join.jsp");
		dispatcher.forward(request, response);
		
		System.out.println(request.getParameter("act"));

	}
	
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