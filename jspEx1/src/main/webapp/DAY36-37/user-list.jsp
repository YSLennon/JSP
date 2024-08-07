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
</style>

</head>
<body>
	<div>
		<button onclick="location.href = 'boardList2.jsp'">게시글보기</button>
		<button onclick="location.href='login.jsp'">로그아웃</button>

	</div>
	<br>
	<%@include file="db.jsp"%>
	<%
	ResultSet rs = null;
	Statement stmt = null;
	System.out.println(session.getAttribute("userId"));

	try {
		stmt = conn.createStatement();
		String querytext = "SELECT * FROM TBL_USER";
		rs = stmt.executeQuery(querytext);
	%>
	<table>
		<tr>
			<th>아이디</th>
			<!-- <th>비밀번호</th> -->
			<th>이름</th>
			<th>권한</th>

			<th>비밀번호</th>
			<!-- <th>밴 여부</th> -->
		</tr>
		<%
		while (rs.next()) {
			String status = (rs.getString("status").equals("A")) ? "관리자" : "일반회원";
		%>

		<tr>
			<td><%=rs.getString("userId")%></td>
			<%-- <td><%=rs.getString("pwd")%></td> --%>
			<td><%=rs.getString("name")%></td>
			<td><%=status%></td>
			<%
			if (rs.getInt("cnt") >= 5) {
			%>
			<td><button onclick="resetPW('<%= rs.getString("userId")%>')">초기화</button></td>
			<%
			} else {
			%>
			<td></td>
			<%
			}
			%>

			<%-- <td><%=rs.getString("banYN")%></td> --%>
			<%-- <td><%=rs.getString("status")%></td> --%>
		</tr>
		<%
		}
		%>

	</table>
	<%
	} catch (SQLException ex) {
	out.println("SQLException : " + ex.getMessage());
	}
	%>

</body>

<script>
	function resetPW(userId){
		window.open("resetPW.jsp?userId="+userId, "reset", "width=500, height=500, left=500");
	}
	
	function fnReload(){
		location.reload();
	}
</script>
</html>
