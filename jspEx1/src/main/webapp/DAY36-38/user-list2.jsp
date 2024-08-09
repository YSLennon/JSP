<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
	<%@ include file="db2.jsp"%>
	<sql:query var="result" dataSource="${dataSource}">
        SELECT * FROM TBL_USER
    </sql:query>
	
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>권한</th>
			<th>비밀번호</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td>${row.userId}</td>
				<td>${row.name}</td>
				<td><c:if test='${row.status.equals("A")}'>관리자</c:if> <c:if
						test='${row.status.equals("C")}'>일반회원</c:if></td>
				<td><c:if test="${row.cnt >= 5}"> + ${row.cnt}
						<button onclick="resetPW('${row.userId}')">초기화</button>
					</c:if> <c:if test="${row.cnt < 5}">
					</c:if></td>
				<td></td>
			</tr>
		</c:forEach>
	</table>

</body>

<script>
	function resetPW(userId) {
		window.open("resetPW.jsp?userId=" + userId, "reset",
				"width=500, height=500, left=500");
	}

	function fnReload() {
		location.reload();
	}
</script>
</html>
