package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.AsyncContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.RegionDAO;

// 비동기 처리를 위한 어노테이션
@WebServlet(value = "/region", asyncSupported = true)
public class RegionController extends HttpServlet {
	private RegionDAO regionDAO;

	public void init() {
		regionDAO = new RegionDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		System.out.println(request.getParameter("act"));
		//비동기 실행
		final AsyncContext asyncContext = request.startAsync();
		asyncContext.start(()->{
			try {
				String act = request.getParameter("act");
				
				if(act.equals("si")) {
					//select si
					String sql = "SELECT si FROM tbl_region GROUP BY si";
					List<String> list = regionDAO.searchRegion(sql);
					
					Gson gson = new Gson();
					String json = gson.toJson(list);
					
					response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");

					PrintWriter out = response.getWriter();
					out.print(json);
					out.flush();
					
				} else if(act.equals("gu")) {
					//select gu
					String sql = "SELECT gu FROM tbl_region WHERE si = "+str(request.getParameter("si")) + " GROUP BY gu;";
					List<String> list = regionDAO.searchRegion(sql);
					
					Gson gson = new Gson();
					String json = gson.toJson(list);
					
					response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");

					PrintWriter out = response.getWriter();
					out.print(json);
					out.flush();
					
				} else if(act.equals("dong")) {
					//select dong
					String sql = "SELECT dong FROM tbl_region WHERE si = " + str(request.getParameter("si")) + " and gu = " + str(request.getParameter("gu")) + " GROUP BY dong;";
					List<String> list = regionDAO.searchRegion(sql);
					
					Gson gson = new Gson();
					String json = gson.toJson(list);
					
					response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");

					PrintWriter out = response.getWriter();
					out.print(json);
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

	private String str(String str) {
		return"'" +str+"'";
		
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