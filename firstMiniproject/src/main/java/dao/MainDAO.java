package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MainDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/stridecycle?useSSL=false&allowPublicKeyRetrieval=true";	
    private String jdbcUsername = "root";
    private String jdbcPassword = "test1234";
    protected Connection jdbcConnection;

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
            	System.out.println("DB 연결 실패");
            	throw new SQLException(e);
            }
            jdbcConnection =  DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }
}
