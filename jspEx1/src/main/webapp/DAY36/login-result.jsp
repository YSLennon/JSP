<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="db.jsp" %>
	<%
		String id = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		
		Statement stmt = conn.createStatement();
		String query = "select * from tbl_user where userId = '" + id+ "' and pwd = '" + pwd + "'";
		ResultSet rs = stmt.executeQuery(query);
		if(rs.next()){
			out.println("로그인 성공");
			session.setAttribute("userId", rs.getString("userId"));
			response.sendRedirect("boardList2.jsp");
		} else{
			out.println("로그인 실패");
		}
		/* 
		if(id.equals("test")){
			out.println(id);	
		}
		if(pwd.equals("1234")){
			out.println(pwd);
		} */
		
	%>
</body>
</html>