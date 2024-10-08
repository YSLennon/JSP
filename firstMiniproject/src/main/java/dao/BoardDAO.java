package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import model.Board;
import model.User;

public class BoardDAO extends MainDAO {

	public List<Board> listAllBoards(String catRequest) throws SQLException {
		List<Board> boardList = new ArrayList<>();

		String sql = "SELECT boardNo, title, addr, status, category, substr(DATETIME, 1, LENGTH(DATETIME)-3) as datetime FROM tbl_board where category like "+ catRequest + " ORDER BY DATETIME desc";
		
		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		while (rs.next()) {

			int boardNo = rs.getInt("boardNo");
			String title = rs.getString("title");
			String addr = rs.getString("addr");
			String status = rs.getString("status");
			String category = rs.getString("category");
			String datetime = rs.getString("datetime");
			Board board = new Board(boardNo, title, addr, status, category, datetime);
			boardList.add(board);
		}

		rs.close();
		statement.close();

		disconnect();

		return boardList;
	}
	public List<Board> listAllBoards(String catRequest, String uid) throws SQLException {
		List<Board> boardList = new ArrayList<>();

		String sql = "SELECT uid, b.boardNo, title, addr, b.status, category, substr(DATETIME, 1, LENGTH(DATETIME)-3) AS datetime FROM tbl_board b INNER JOIN tbl_enroll e ON b.boardNo = e.boardNo where category LIKE "+catRequest+" and uid = "+uid+" ORDER BY DATETIME desc;";
		
		System.out.println(sql);
		
		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		while (rs.next()) {
			int boardNo = rs.getInt("boardNo");
			String userId = rs.getString("uid");
			String title = rs.getString("title");
			String addr = rs.getString("addr");
			String status = rs.getString("status");
			String category = rs.getString("category");
			String datetime = rs.getString("datetime");
			Board board = new Board(boardNo,userId, title, addr, status, category, datetime);
			boardList.add(board);
		}

		rs.close();
		statement.close();

		disconnect();

		return boardList;
	}

	public List<Board> listSideHistory(String catRequest, String uid) throws SQLException {
		List<Board> boardList = new ArrayList<>();

		String sql =  	"SELECT title, distance, substr(DATETIME, 1, LENGTH(DATETIME)-3) AS datetime FROM tbl_board b INNER JOIN tbl_enroll e ON b.boardNo = e.boardNo where category LIKE "+catRequest+" and uid = "+uid+" ORDER BY DATETIME desc";
				
		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		while (rs.next()) {
			String title = rs.getString("title");
			int distance = rs.getInt("distance");
			String datetime = rs.getString("datetime");
			Board board = new Board(title, distance, datetime);
			boardList.add(board);
		}

		rs.close();
		statement.close();

		disconnect();

		return boardList;
	}
	public int historyTrip(String uid) throws SQLException {

		String sql = "SELECT SUM(distance) as trip FROM tbl_board b INNER JOIN tbl_enroll e ON b.boardNo = e.boardNo where uid = "+uid+" GROUP BY uid ";  
		
		
		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		int trip ;
		if(rs.next()) {
			trip = rs.getInt("trip");
		} else {
			trip = 0;
		}

		rs.close();
		statement.close();

		disconnect();

		return trip;
	}
	public HashMap<String, Object> getDetailBoard(String boardNumb) throws SQLException {
		List<Board> boardList = new ArrayList<>();
		List<String> uidList = new ArrayList<>();
		String sql ="SELECT b.boardNo, organizer, title, contents, DISTANCE, b.addr, STATUS, map, mapCenter, category, SUBSTR(DATETIME,1,LENGTH(DATETIME)-3) AS DATETIME, SUBSTR(b.cdatetime,1,LENGTH(b.cdatetime)-3) AS cdatetime, nickName FROM tbl_board b INNER JOIN tbl_enroll e ON b.boardNo = e.boardNo INNER JOIN tbl_user u ON u.uid = e.uid WHERE b.boardNo = "+boardNumb;
				System.out.println(sql);
		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet rs = statement.executeQuery(sql);

		while (rs.next()) {
			 	int boardNo = rs.getInt("boardNo");
			    String organizer = rs.getString("organizer");
			    String title = rs.getString("title");
			    String contents = rs.getString("contents");
			    int distance = rs.getInt("distance");
			    String addr = rs.getString("addr");
			    String status = rs.getString("status");
			    String category = rs.getString("category");
			    String map = rs.getString("map");
			    String mapCenter = rs.getString("mapCenter");
			    String datetime = rs.getString("datetime");
			    String cdatetime = rs.getString("cdatetime");			    
			    Board board = new Board(boardNo, organizer, title, contents, distance, addr, status, category, map, mapCenter,  datetime, cdatetime);
			    boardList.add(board);
			    uidList.add(rs.getString("nickName"));
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("boardList", boardList);
		map.put("uidList", uidList);

		rs.close();
		statement.close();

		disconnect();

		return map;
	}
	public void updateBoard(String sql) throws SQLException {

		connect();

		Statement statement = jdbcConnection.createStatement();
		statement.executeUpdate(sql); 
		statement.close();

		disconnect();

	}
	public boolean isExist(String sql) throws SQLException{
		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet rs = statement.executeQuery(sql); 
		boolean answer = rs.next();
		
		statement.close();
		disconnect();
		
		return answer;
	}
	 	

}
