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

.comment {
	width: 330px;
	height: 30px;
	margin: 5px;
}
</style>

</head>
<body>
	<form action="insert.jsp" method="get" name='board'>
		<%@include file="db.jsp"%>
		<%
		ResultSet rs = null;
		Statement stmt = null;
		String boardNo = request.getParameter("boardNo");
		try {
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
			rs = stmt.executeQuery(querytext);
			if (rs.next()) {
		%>
		<input type='hidden' value='<%=rs.getString("boardNo")%>'
			name='boardNo'> <input type='hidden'
			value='<%=rs.getString("title")%>' name='title'> <input
			type='hidden' value='<%=rs.getString("contents")%>' name='content'>
		<input type='hidden' value='<%=session.getAttribute("userId")%>'
			name='userId'>

		<div>
			제목 :
			<%=rs.getString("title")%></div>
		<div>
			내용 :
			<%=rs.getString("contents")%></div>


		<%
		if (session.getAttribute("userId").equals(rs.getString("userId")) || session.getAttribute("status").equals("A")) {
		%>
		<button type='submit'>수정</button>
		<input type='button' onclick='modify()' value='삭제'>

		<%
		}
		}
		%>
		<hr>

		<!-- 댓글 달리는 위치 -->

		<div>
			댓글 : <input class="comment" type="text" name="comment"
				placeholder="댓글쓰셈"> <input type="button" value="등록"
				onclick="fnComment()">
		</div>
		<%
		querytext = "select * from tbl_comment where boardNo = " + boardNo;
		rs = stmt.executeQuery(querytext);
		while (rs.next()) {
		%>
		<div>
			<%=rs.getString("userId") + " : " + rs.getString("comment")%>
		</div>
		<%
		}
		%>


		<%
		} catch (SQLException ex) {
		out.println("삭제된 게시글입니다.");
		out.println(ex);
		}
		%>
	</form>
</body>
</html>
<script>
	function modify() {
		var form = document.board;
		if (confirm("삭제하시겠습니까?")) {

			form.action = "board-delete.jsp";
			form.submit();
		}

	}

	function fnComment() {
		var form = document.board;
		window.open("", "comment", "width=500, height=500");

		form.action = "comment.jsp";
		s
		form.target = "comment";
		form.submit();
	}

	function fnReload() {
		location.reload();
	}
</script>