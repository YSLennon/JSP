<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="db.jsp"%>
	<%
		String stuNo = request.getParameter("stuNo");
	%>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			stmt = conn.createStatement();
			String query = "select * from tbl_user";
			System.out.println("h1");

			rs = stmt.executeQuery(query);
			System.out.println("hi");

			if(rs.next()){
				out.println(rs.getString("uid"));
			} else out.println("해당 학생이 존재하지 않습니다.");
		} catch(SQLException e){
			out.println("SQLException: "+ e.getMessage());
			
		}
	%>

</body>
</html>