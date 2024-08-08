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
	a:link{
	text-decoration : none;
	color: black;
	font-weight: bold;
	}
	
</style>

</head>
<body>
<div><button onclick="location.href='login.jsp'">로그아웃</button></div>
	<%@include file="db.jsp"%>	
	<%
	ResultSet rs = null;
	Statement stmt = null;
	System.out.println(session.getAttribute("userId"));
	
	try{
		stmt = conn.createStatement();
		String querytext = "SELECT * IFNULL(C.CNT,'') AS CCNT FROM TBL_BOARD B INNER JOIN TBL_USER U ON B.USERID = U.USERID"
				+" left JOIN ( SELECT COUNT(*) AS CNT, boardNo FROM TBL_COMMENT GROUP BY BOARDNO) C ON B.boardNo = C.boardNo";
		rs = stmt.executeQuery(querytext);
		System.out.println(querytext);
	%>
		<table>
		<tr>
			<th> 번호 </th>
			<th> 제목 </th>
			<th> 작성자 </th>
			<th> 조회수 </th>
			<th> 작성일 </th>
		</tr>			
	<%
	while (rs.next()) {
	%>
		<%
		String title = "";
		if(rs.getString("ccnt").equals("")){
			title = rs.getString("b.title");
		} else{
			title = rs.getString("b.title") +" (" + rs.getString("CCNT")+ ")";
		}
		 %>
		
		<tr>
			<td> <%= rs.getString("b.boardNo") %></td>
			<%--<td><a href='board-view.jsp?boardNo=<%=rs.getString("boardNo")%>'>--%>			 
			<td><a href='#' onclick='goToView(<%=rs.getString("b.boardNo")%>)'>
			
			<%= title %>
			 </a>
			 </td>
			<td> <%= rs.getString("u.name") %></td>
			<td> <%= rs.getString("b.cnt") %></td>
			<td> <%= rs.getString("b.cdatetime") %></td>
		</tr>
	<%
	}
	%>
	
	</table>
	<button onclick="location.href = 'insert.jsp'" > 글쓰기 </button>
	<%
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	%>

</body>

<script>
	function goToView(p1){
		location.href='board-view.jsp?boardNo='+p1 ;
	}
</script>
</html>
