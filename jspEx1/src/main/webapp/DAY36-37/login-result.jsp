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
	String id = request.getParameter("uid");
	String pwd = request.getParameter("pwd");

	Statement stmt = conn.createStatement();
	/* String query = "select * from tbl_user where userId = '" + id+ "' and pwd = '" + pwd + "'"; */
	String query = "select * from tbl_user where userId = '" + id + "'";
	String cntSQL = "update tbl_user set cnt = cnt+1 where userId = '" + id + "'";
	ResultSet rs = stmt.executeQuery(query);
	if (rs.next()) {
		System.out.println(rs.getInt("cnt"));
		//cnt가 5 이상인 경우 5번 이상 실패했습니다. 관리자 문의하셈 ㄱ
		if (rs.getInt("cnt") >= 5) {
			out.println("5번 이상 로그인에 실패하였습니다. 관리자 문의 ㄱㄱ");
		} else if (rs.getString("pwd").equals(pwd)) {
			out.println("로그인 성공");
			session.setAttribute("userId", rs.getString("userId"));
			session.setAttribute("status", rs.getString("status"));
			//관리자 여부 확인
			if(rs.getString("status").equals("C")){
				response.sendRedirect("boardList2.jsp");
				// cnt 초기화
				cntSQL = "update tbl_user set cnt = 0 where userId = '" + id + "'";
				stmt.executeUpdate(cntSQL);
			} else if(rs.getString("status").equals("A")){
				response.sendRedirect("user-list.jsp");
				// cnt 초기화
				cntSQL = "update tbl_user set cnt = 0 where userId = '" + id + "'";
				stmt.executeUpdate(cntSQL);
			}
			
		} else {
			out.println("아이디 또는 비밀번호를 확인해주세요");
			// cnt 1 증가
			System.out.println(rs.getInt("cnt"));
			stmt.executeUpdate(cntSQL);
		}
	} else {
		out.println("아이디 또는 비밀번호를 확인해주세요");
	}
	%>

	<!-- add button -> login.jsp로 이동 -->
	<button onclick="location.href='login.jsp'" )>로그인 페이지로</button>
	
</body>
</html>