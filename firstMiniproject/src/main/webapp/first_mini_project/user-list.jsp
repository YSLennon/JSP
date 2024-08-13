
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/first_mini_project/src/layout/layout.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section id="userListContainer">
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>닉네임</th>
				<th>선호도</th>
				<th>로그인제한</th>

			</tr>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.uid}</td>
					<td>${user.name}</td>
					<td>${user.phone}</td>
					<td>${user.addr}</td>
					<td>${user.nickName}</td>
					<td>${user.favor}</td>
					<td><c:if test="${user.cnt >= 5}">
							<button type="button">초기화</button>
						</c:if></td>

				</tr>
			</c:forEach>
		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<script></script>