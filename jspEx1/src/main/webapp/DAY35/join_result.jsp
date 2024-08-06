<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<% 
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	String[] hobby = request.getParameterValues("hobby");
	for(String h : hobby){
		out.println(h + "<br>");
	}
	
	%>
	<% out.println(uid + "님 환영합니다.");%>
	
</body>
</html>