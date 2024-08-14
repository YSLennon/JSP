package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Region;
import model.User;

public class RegionDAO extends MainDAO {


	public List<String> searchRegion(String sql) throws SQLException {
		
		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		List<String> regionList = new ArrayList<>();
		
		while(rs.next()) {
			regionList.add(rs.getString(1));
		}
		
		rs.close();
		statement.close();

		disconnect();

		return regionList;
	}

}
