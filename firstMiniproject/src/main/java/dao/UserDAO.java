package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import model.User;

public class UserDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/stridecycle?&useSSL=false";
//	private String jdbcURL = "jdbc:mysql://localhost:3306/stridecycle?&useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "test1234";
    private Connection jdbcConnection;

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
            	System.out.println("DB 연결 실패");
            	throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    public List<User> listAllUsers() throws SQLException {
        List<User> userList = new ArrayList<>();

        String sql = "SELECT * FROM tbl_user";
        System.out.println(sql);
        connect();

        Statement statement = jdbcConnection.createStatement();	
        ResultSet rs = statement.executeQuery(sql);
        while (rs.next()) {

            String uid = rs.getString("uid");
            int cnt = rs.getInt("cnt");
            String name = rs.getString("name");
            String phone = rs.getString("phone");
            String addr = rs.getString("addr");
            String nickName = rs.getString("nickName");
            String favor = rs.getString("favor");
            String cdatetime = rs.getString("cdatetime");
            String udatetime = rs.getString("udatetime");
            User user = new User(uid, cnt, name, phone, addr, nickName, favor, cdatetime, udatetime);
            userList.add(user);
        }

        rs.close();
        statement.close();
        
        disconnect();

        return userList;
    }
    
    public void insertUser(String sql) throws SQLException {
    	
    	connect();
    	
    	Statement statement = jdbcConnection.createStatement();
    	statement.executeUpdate(sql);

        statement.close();
        
    	disconnect();
    	
    }
    
    public boolean checkUid(String sql) throws SQLException{

    	connect();
    	
    	Statement statement = jdbcConnection.createStatement();
    	ResultSet rs = statement.executeQuery(sql);
    	boolean returnValue = rs.next();
    	rs.close();
        statement.close();
        
    	disconnect();
    	
    	return returnValue;
    }
}







