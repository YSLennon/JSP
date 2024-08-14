package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDAO extends MainDAO{

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
    
    public void insertUser(User user) throws SQLException {
    	
    	String sql = "insert into tbl_user (uid, pwd, name, phone, addr, nickName, favor) values (?, ?, ?, ?, ?, ?, ?)";
    	
    	connect();
    	try(PreparedStatement statement = jdbcConnection.prepareStatement(sql)){
        	statement.executeUpdate(sql);
        	statement.setString(1, user.getUid());
        	statement.setString(2, user.getPwd());
        	statement.setString(3, user.getName());
        	statement.setString(4, user.getPhone());
        	statement.setString(5, user.getAddr());
        	statement.setString(6, user.getNickName());
        	statement.setString(7, user.getFavor());
        	
        	statement.executeUpdate();
    	};
    	disconnect();
    	
    }
    
    public boolean isExist(String sql) throws SQLException{

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







