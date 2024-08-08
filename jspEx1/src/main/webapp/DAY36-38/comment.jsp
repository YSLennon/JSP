<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
}
}
</style>

</head>
<body>
	<%@include file="db.jsp"%>
	<%
	ResultSet rs = null;
	Statement stmt = null;
	String boardNo = request.getParameter("boardNo");
	String comment = request.getParameter("comment");
	String userId = request.getParameter("userId");

	try {
		stmt = conn.createStatement();
		String querytext = "insert into tbl_comment(boardNo, comment, userId) values(" + boardNo + ", '" + comment + "','"
		+ userId + "')";
		System.out.println(querytext);
		stmt.executeUpdate(querytext);

	} catch (SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	%>

</body>
</html>
<script>
	alert("댓글이 달렸당");
	window.close();
	window.opener.fnReload();
</script>