<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, th,  tr,  td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	}

}
	
</style>

</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		Statement stmt = null;
		String boardNo = request.getParameter("boardNo");
		String title = request.getParameter("title");
		String content= request.getParameter("content");

		try{
			stmt = conn.createStatement();
			String querytext = "update tbl_board set title='"+title+"', contents ='"+content+"' where boardNo =" + boardNo;
			stmt.executeUpdate(querytext);
			out.println("변경되었습니다");
			/* response.sendRedirect("boardList2.jsp"); */
		} catch(SQLException ex) {
			out.println("변경안댐");

		}
	%>

</body>
</html>