package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.AsyncContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.UserDAO;
import model.User;

// 비동기 처리를 위한 어노테이션
@WebServlet(value = "/user", asyncSupported = true)
public class UserController extends HttpServlet {
	private UserDAO userDAO;

	public void init() {
		userDAO = new UserDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();

		System.out.println("UserControllerOn");		
		// 비동기 실행
		final AsyncContext asyncContext = request.startAsync();
		asyncContext.start(() -> {
			try {
				String act = request.getParameter("act");
				System.out.println("act: " + act);

				if (act.equals("checkUid")) {
					// confirm Uid

					String sql = "select * from tbl_user where uid = " + str(request.getParameter("checkValue"));
					duplicateCheck(sql, response);
					
					
				} else if (act.equals("checkNick")) { 
					// confirm Nickname

					String sql = "select * from tbl_user where nickName = " + str(request.getParameter("checkValue"));
					duplicateCheck(sql, response);

					
				} else if (act.equals("join")) { 
					// join 
					String jsonData = request.getParameter("jsonData");
					Gson gson = new Gson();
					User user = gson.fromJson(jsonData, User.class);
					userDAO.insertUser(user);
					user = new User(user.getUid(),user.getNickName(),user.getAddr(), user.getFavor(), user.getAuthority(), user.getUdatetime());
					session.setAttribute("userSession", user);
					
					response.sendRedirect("/firstMiniproject/page?act=main");
					
				} else if (act.equals("login")) { 
					// login
					String uid = str(request.getParameter("uid"));
					String pwd = str(request.getParameter("pwd"));

					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					
					PrintWriter out = response.getWriter();
					String resultMessage = null;
					boolean successFlg = false;
					int cnt = userDAO.checkCNT(uid);
					if(cnt > 5) {
						//로그인 시도 횟수 5회 초과
						resultMessage = "5회 이상 로그인에 실패하였습니다. 관리자에게 문의해주세요.";
					} else if(cnt == -1) {
						//존재하지 않는 아이디
						resultMessage = "존재하지 않는 아이디입니다.";
					} else if(cnt == -5) {
						//존재하지 않는 아이디
						resultMessage = "현재 로그인 횟수 초기화 대기중입니다.";
					} else if(cnt == -2){
						User user = userDAO.login(uid,pwd);
						if(user == null) {
							resultMessage = "틀린 비밀번호입니다. 비밀번호를 확인해주세요.";	
						} else {
							//CNT 초기화 및 세션정보 저장
							userDAO.initCNT(uid);
							user = new User(user.getUid(),user.getNickName(),user.getAddr(), user.getFavor(), user.getAuthority(), user.getUdatetime());
							session.setAttribute("userSession", user);
							resultMessage = "로그인 시도횟수 초기화 신청이 있습니다. 회원 관리페이지를 확인해주세요.";
							successFlg = true;
							System.out.println(resultMessage + successFlg);
						}
					} else {
						//아이디 확인 비밀번호 체크 후 로그인 및 cnt 초기화
						User user = userDAO.login(uid,pwd);

						if(user == null) {
							userDAO.addCNT(uid);
							resultMessage = "틀린 비밀번호입니다. 비밀번호를 확인해주세요.";
							
						} else {
							//CNT 초기화 및 세션정보 저장
							userDAO.initCNT(uid);
							user = new User(user.getUid(),user.getNickName(),user.getAddr(), user.getFavor(), user.getAuthority(), user.getUdatetime());
							session.setAttribute("userSession", user);
							resultMessage = "로그인되었습니다.";
							successFlg = true;	
						}

					}
					String jsonResponse = "{\"success\": " + successFlg + ", \"resultMessage\": \"" + resultMessage + "\"}";
					out.print(jsonResponse);
					out.flush();
					
				} else if(act.equals("clientInfo")) {
					User userSession = (User) session.getAttribute("userSession");
					String userId = str(userSession.getUid());
					
					String sql = "select * from tbl_user where uid = " + userId;
					List<User> user = userDAO.searchUser(sql);
					Gson gson = new Gson();
					String json = gson.toJson(user);
					
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					
					PrintWriter out = response.getWriter();
					out.print(json);
					out.flush();
				} else if (act.equals("changeInfo")) { 
					// changeInfo 
					String jsonData = request.getParameter("jsonData");
					Gson gson = new Gson();
					User user = gson.fromJson(jsonData, User.class);
					userDAO.changeUser(user);
					String sql = "select * from tbl_user where uid = "+str(user.getUid());
					
					user = userDAO.searchUser(sql).get(0);
					user = new User(user.getUid(),user.getNickName(),user.getAddr(), user.getFavor(), user.getAuthority(), user.getUdatetime());
					session.setAttribute("userSession", user);
					
					response.sendRedirect("/firstMiniproject/page?act=main");
					
				} else if(act.equals("userList")) {
					String sql = "select * from tbl_user";
					System.out.println("sql : " + sql);
					List<User> list = userDAO.searchUser(sql);
					Gson gson = new Gson();
					String json = gson.toJson(list);
					
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					
					PrintWriter out = response.getWriter();
					out.print(json);
					out.flush();
				} else if(act.equals("initCnt")) {
					String uid = str(request.getParameter("uid"));
					userDAO.initCNT(uid);
					
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					String message = "{ \"message\" : \"접속 제한이 해제되었습니다.\"}";
					
					PrintWriter out = response.getWriter();
					out.print(message);
					out.flush();
				} else if(act.equals("initAcount")){
					String uid = str(request.getParameter("uid"));
					String phone = str(request.getParameter("phone"));
					String sql = "update tbl_user u INNER JOIN (SELECT uid FROM tbl_user WHERE uid = "+uid+" AND phone = "+phone+") AS subquery ON u.uid = subquery.uid SET cnt = -5";
					
					String message = "{ \"message\" : \"정보를 다시 확인해주세요.\"}";
					if(userDAO.updateQuery(sql) == 1) {
						sql = "update tbl_user set cnt = -2 where uid = 'admin'";
						if(userDAO.updateQuery(sql) == 1);{
							message = "{ \"message\" : \"로그인 시도횟수 초기화 신청이 완료되었습니다.\"}";
						}
					};
					
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					
					PrintWriter out = response.getWriter();
					out.print(message);
					out.flush();
				}

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("userDoPostError: "+ e);
			} finally {
				// 비동기 완료처리 -> 컴플릿되면서 클라이언트에서도 이후 데이터 처리를 한다
				asyncContext.complete();

			}
		});

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("UserGetControllerOn");
		String act = request.getParameter("act");
		final AsyncContext asyncContext = request.startAsync();
		
		asyncContext.start(() ->{
			try {
				HttpSession session = request.getSession();
				
				if(act.equals("logout")) {
					session.invalidate();
					response.sendRedirect("/firstMiniproject/page?act=main");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("userDoGetError: "+ e);
			} finally {
				asyncContext.complete();
			}
			
		});
		
	}
	
	private String str(String str) {
		return "'" + str + "'";

	}

	private void duplicateCheck(String sql, HttpServletResponse response) throws IOException, SQLException {
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print("{\"isAvailable\": " + userDAO.isExist(sql) + "}");
		out.flush();
	}

}