<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
	border-collapse: collapse;
	}
	tr, td, th{
	border: 1px solid black;
		padding: 5px 10px;
		/* text-align: center; */
	
	}
</style>
</head>
<body>
<%@include file="db.jsp" %>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			stmt = conn.createStatement();
			String query = "select *, round(cdatetime,0) as cdt from tbl_board";
			
			rs = stmt.executeQuery(query);
			out.println("<table>");
				
			out.println("<tr>");
			out.println("<th>번호</th>");
			out.println("<th>제목</th>");
			out.println("<th>작성자</th>");
			out.println("<th>조회수</th>");
			out.println("<th>작성일</th>");
			out.println("</tr>");
			while(rs.next()){

				String cdatetime = rs.getString("cdatetime");
				cdatetime = cdatetime.substring(0, cdatetime.length()-2);
				
				out.println("<tr>");
				out.println("<td>" + rs.getString("boardNo") + "</td>");
				out.println("<td> <a href='#' onclick='goToView("+ rs.getString("boardNo")+")'> " + rs.getString("title") + "<a></td>");
				out.println("<td>" + rs.getString("userId") + "</td>");
				out.println("<td>" + rs.getString("cnt") + "</td>");
				out.println("<td>" + cdatetime+ "</td>");
				out.println("</tr>");
			}
				
			out.println("</table>");
		}catch(SQLException e){
			
		}
	%>

</body>
</html>

<script>
	function goToView(p1){
		location.href='board-view.jsp?boardNo='+p1" ;
	}
</script>