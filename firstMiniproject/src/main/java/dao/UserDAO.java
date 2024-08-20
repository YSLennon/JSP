package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDAO extends MainDAO {

	public List<User> searchUser(String sql) throws SQLException {
		List<User> userList = new ArrayList<>();

		System.out.println(sql);
		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		while (rs.next()) {

			String uid = rs.getString("uid");
			int cnt = rs.getInt("cnt");
			String pwd = rs.getString("pwd");
			String name = rs.getString("name");
			String phone = rs.getString("phone");
			String addr = rs.getString("addr");
			String nickName = rs.getString("nickName");
			String favor = rs.getString("favor");
			String authority = rs.getString("authority");
			String cdatetime = rs.getString("cdatetime");
			String udatetime = rs.getString("udatetime");
			User user = new User(uid, pwd, cnt, name, phone, addr, nickName, favor, authority, cdatetime, udatetime);
			
			userList.add(user);
		}

		rs.close();
		statement.close();

		disconnect();

		return userList;
	}

	public void insertUser(User user) throws SQLException {

		String sql = "insert into tbl_user (uid, pwd, name, phone, addr, nickName, favor) values (?, ?, ?, ?, ?, ?, ?)";
		
		connect();
		try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {

			statement.setString(1, user.getUid());
			statement.setString(2, user.getPwd());
			statement.setString(3, user.getName());
			statement.setString(4, user.getPhone());
			statement.setString(5, user.getAddr());
			statement.setString(6, user.getNickName());
			statement.setString(7, user.getFavor());

			statement.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("insertUser Error: "+ e);
		}
		finally {
			disconnect();
		}
		;

	}

	public boolean isExist(String sql) throws SQLException {

		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		boolean returnValue = rs.next();
		rs.close();
		statement.close();

		disconnect();

		return returnValue;
	}

	public User login(String uid, String pwd) throws SQLException {
		connect();
		User user = null;
		try (Statement statement = jdbcConnection.createStatement()) {
			String sql = "SELECT uid, nickName, addr, favor, authority, udatetime FROM tbl_user WHERE uid = " + uid + " and pwd = "
					+ pwd;
			ResultSet rs = statement.executeQuery(sql);

			if (rs.next()) {
				String userId = rs.getString("uid");
				String nickName = rs.getString("nickName");
				String addr = rs.getString("addr");
				String favor = rs.getString("favor");
				String authority = rs.getString("authority");
				String udatetime = rs.getString("udatetime");
				user = new User(userId,nickName,addr, favor, authority, udatetime);
			}
		} catch (Exception e) {
			System.out.println("login Error: " + e);
		} finally {
			disconnect();
		}
		return user;
	}

	public int checkCNT(String uid) throws SQLException {
		// 로그인 시도 횟수를 리턴(없는 아이디의 경우 -1을 리턴한다)
		connect();
		int number = -1;
		String sql = "SELECT cnt FROM tbl_user WHERE uid = " + uid;
//		System.out.println("checkCNT SQL: " + sql);
		try (Statement statement = jdbcConnection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			if (rs.next()) {
				number = rs.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println("checkCNT Error: " + e);
		} finally {
			disconnect();
		}
		return number;
	}

	public void initCNT(String uid) throws SQLException {
		connect();
		String sql = "update tbl_user set cnt = 0 where uid = " + uid;
		try (Statement statement = jdbcConnection.createStatement()) {
			statement.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("initCNT Error: " + e);
		} finally {
			disconnect();
		}
	}
	public void addCNT(String uid) throws SQLException {
		connect();
		String sql = "update tbl_user set cnt = cnt + 1 where uid = " + uid;
		try (Statement statement = jdbcConnection.createStatement()) {
			statement.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("initCNT Error: " + e);
		} finally {
			disconnect();
		}
	}
	
	public void changeUser(User user) throws SQLException {

		String sql = "update tbl_user set pwd = ?, NAME = ? , phone = ? , addr = ? , nickName = ? , favor = ? where uid = ? ";
		
		connect();
		try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
			statement.setString(1, user.getPwd());
			statement.setString(2, user.getName());
			statement.setString(3, user.getPhone());
			statement.setString(4, user.getAddr());
			statement.setString(5, user.getNickName());
			statement.setString(6, user.getFavor());
			statement.setString(7, user.getUid()); 

			statement.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("insertUser Error: "+ e);
		}
		finally {
			disconnect();
		}
		;

	}
	
	public int updateQuery(String sql) throws SQLException {
		// 업데이트 실행 후 영향받은 행 갯수 리턴
		connect();
		int number = 0;
		try (Statement statement = jdbcConnection.createStatement()) {
			number = statement.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println("checkCNT Error: " + e);
		} finally {
			disconnect();
		}
		return number;
	}
}
