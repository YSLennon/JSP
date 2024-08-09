<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="db2.jsp" %>
    <sql:query var="result" dataSource="${dataSource}">
    	select * from tbl_user where userId = ? and pwd = ?
    	<sql:param value="${param.uid}" />
    	<sql:param value="${param.pwd}" />
    </sql:query>
    <c:forEach var="row" items="${result.rows}">
	    <%-- <c:if test="${not empty row.userId}">로그인 성공</c:if>
	    <c:if test="${empty row.userId}"> 로그인 실패</c:if> --%>
	   <c:choose>
	    <c:when test="${row.userId != null}">
	    	로그인 성공
	    </c:when>
	    <c:otherwise> 
	    	로그인 실패
	    </c:otherwise>
	    </c:choose>
    </c:forEach>
	<!-- add button -> login.jsp로 이동 -->
	<button onclick="location.href='login.jsp'" )>로그인 페이지로</button>
	
</body>
</html>