package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.AsyncContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.BoardDAO;
import model.Board;
import model.User;

// 비동기 처리를 위한 어노테이션
@WebServlet(value = "/board", asyncSupported = true)
public class BoardController extends HttpServlet {
	private BoardDAO boardDAO;

	public void init() {
		boardDAO = new BoardDAO();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("UserGetControllerOn");
		String act = request.getParameter("act");
		final AsyncContext asyncContext = request.startAsync();
		
		asyncContext.start(() ->{
			try {
//				HttpSession session = request.getSession();
				String category = str((request.getParameter("category") ==null || request.getParameter("category").equals("A"))?"%":request.getParameter("category"));
				if(act.equals("searchGroup")) {
					List<Board> list = boardDAO.listAllBoards(category);
					HashMap<String, Object> map = new HashMap<>();
					map.put("uid", null);
					map.put("list", list);
					Gson gson = new Gson();
					String json = gson.toJson(map);	
					
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					
					PrintWriter out = response.getWriter();
					out.print(json);
					out.flush();
				} else if(act.equals("userSchedule")) {
					User userSession = (User) request.getSession().getAttribute("userSession");
					String uid = str(userSession.getUid());
					List<Board> list = boardDAO.listAllBoards(category, uid);
					HashMap<String, Object> map = new HashMap<>();
					
					map.put("uid", uid);
					map.put("list", list);
					Gson gson = new Gson();
					String json = gson.toJson(map);	
					
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					
					PrintWriter out = response.getWriter();
					out.print(json);
					out.flush();
				} else if(act.equals("sideHistory")) {
					User userSession = (User) request.getSession().getAttribute("userSession");
					if(userSession == null) {
						//TODO 수정해야함 -> admin이아니라 다른 문구를 띄우는 방향으로 바꾸자
						String uid = str("admin");
						List<Board> historyList = boardDAO.listSideHistory(category, uid);
						int trip = boardDAO.historyTrip(uid);
						HashMap<String, Object> map = new HashMap<>();
						
						map.put("uid", uid);
						map.put("historyList", historyList);
						map.put("trip", trip);						
						Gson gson = new Gson();
						String json = gson.toJson(map);	
						
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");
						
						PrintWriter out = response.getWriter();
						out.print(json);
						out.flush();	
						
					} else {
						String uid = str(userSession.getUid());
						List<Board> historyList = boardDAO.listSideHistory(category, uid);
						int trip = boardDAO.historyTrip(uid);

						HashMap<String, Object> map = new HashMap<>();
						
						map.put("uid", uid);
						map.put("historyList", historyList);
						map.put("trip", trip);						
						Gson gson = new Gson();
						String json = gson.toJson(map);	
						
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");
						
						PrintWriter out = response.getWriter();
						out.print(json);
						out.flush();	
					}
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
//		out.print("{\"isAvailable\": " + userDAO.isExist(sql) + "}");
		out.flush();
	}

}