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
import javax.servlet.http.HttpSession;

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
				} else if(act.equals("detailViewer")) {
					String boardNo = request.getParameter("boardNo");
					HashMap<String, Object>map = boardDAO.getDetailBoard(boardNo);
						
					Gson gson = new Gson();
					String json = gson.toJson(map);	
					
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					
					PrintWriter out = response.getWriter();
					out.print(json);
					out.flush();	
				} else if(act.equals("removeBoard")) {
					String boardNo = request.getParameter("boardNo");
					String sql = "DELETE FROM tbl_board WHERE boardNo="+ boardNo;
					boardDAO.updateBoard(sql);
					sql = "DELETE FROM tbl_enroll WHERE boardNo="+ boardNo;
					boardDAO.updateBoard(sql);
					
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				
				PrintWriter out = response.getWriter();
				out.print("{\"message\": \"삭제되었습니다.\"}");
				out.flush();	
				} else if(act.equals("makeBoard")) {
					HttpSession session = request.getSession();
					User userSession = (User) session.getAttribute("userSession");
					String organizer = userSession.getUid();
					String title = request.getParameter("title");
					String contents = request.getParameter("contents");
					String boardCategory = request.getParameter("category");
					String distance = request.getParameter("distance");
					String addr = request.getParameter("addr");
					String map = request.getParameter("map");
					String datetime= request.getParameter("datetime");
					String sql = "INSERT INTO tbl_board (organizer, title, contents, category, distance, addr, map, datetime) VALUES ('"+organizer+"', '"+title+"', '"+contents+"', '"+boardCategory+"', "+distance+", '"+addr+"', '"+map+"', STR_TO_DATE('"+datetime+"', '%Y-%m%Y-%m-%d %H:%i%d %H:%i'))";
					

					boardDAO.updateBoard(sql);
					
					sql = "INSERT INTO tbl_enroll (boardNo, uid) SELECT b.boardNo, organizer AS uid FROM tbl_board b left JOIN tbl_enroll e  ON b.organizer = e.uid && b.boardNo = e.boardNo WHERE organizer = '"+organizer+"' AND uid IS null";
					
					boardDAO.updateBoard(sql);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					
					PrintWriter out = response.getWriter();
					out.print("{\"message\": \"작성되었습니다.\"}");
					out.flush();	
				} else if(act.equals("modifyBoard")){
					
					HttpSession session = request.getSession();
					User userSession = (User) session.getAttribute("userSession");
					String organizer = userSession.getUid();
					String title = request.getParameter("title");
					String contents = request.getParameter("contents");
					String boardCategory = request.getParameter("category");
					String distance = request.getParameter("distance");
					String addr = request.getParameter("addr");
					String map = request.getParameter("map");
					String datetime = request.getParameter("datetime");
					String boardNo = request.getParameter("boardNo");
					String sql = "UPDATE tbl_board SET organizer = '"+organizer+"', title = '"+title+"', contents = '"+contents+"', category = '"+boardCategory+"', DISTANCE = "+distance+", addr = '"+addr+"', map = '"+map+"', DATETIME = STR_TO_DATE('"+datetime+"', '%Y-%m-%d %H:%i') WHERE boardNo = "+boardNo;
					System.out.println(sql);

					boardDAO.updateBoard(sql);
					
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					
					PrintWriter out = response.getWriter();
					out.print("{\"message\": \"수정되었습니다.\"}");
					out.flush();	
				} else if (act.equals("changeStatus")) {
					String sql = "update tbl_board set status = 'completed' where boardNo = "+request.getParameter("boardNo");
					boardDAO.updateBoard(sql);

					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					
					PrintWriter out = response.getWriter();
					out.print("{\"message\": \"완료처리되었습니다.\"}");
					out.flush();	
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