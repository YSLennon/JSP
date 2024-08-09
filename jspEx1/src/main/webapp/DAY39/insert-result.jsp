<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>
	<%
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String userId = "user1"; // 이건 그냥 하드코딩으로 이대로 쓰세요.
	System.out.println(title);
	System.out.println(contents);
	ResultSet rs = null;
	Statement stmt = null;
	try {
		stmt = conn.createStatement();
		String query = "INSERT INTO TBL_BOARD " + "VALUES (" + "NULL, '" + title + "', '" + contents + "', 0, '" + userId
		+ "', 'number', now(), now()" + ")";
		System.out.println(query);
		stmt.executeUpdate(query);
		out.println("저장되었다!");
	} catch (SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	%>
</body>
</html>