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
	<%!ResultSet rs = null;
	Statement stmt = null;%>

	<%
	String userId = (String) session.getAttribute("userId");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	stmt = conn.createStatement();
	String query = "insert into tbl_board values(null, '" + title + "', '" + content + "', 0, '" + userId
			+ "', 'number', NOW(), NOW())";

	try {
		stmt.executeUpdate(query);
		out.println("저장되었습니다.");
		response.sendRedirect("boardList2.jsp");

	} catch (SQLException e) {
		out.println("실패했습니다.");

	}
	%>
</body>
</html>