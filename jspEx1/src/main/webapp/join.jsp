<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JoinIn</title>
</head>
<body>
	<!-- method default는 get방식이다 -->
	<form action="join_result.jsp" method="get">
		<div><label>아이디 : <input type="text" name="uid"></label></div>
		<div><label>비밀번호 : <input type="password" name="pwd"></label></div>
		<div><label>이름 : <input type="text" name="name"></label></div>
		<div>
			<label><input type="radio" value="M" name=gender>"남자"</label>
			<label><input type="radio" value="F" name=gender>"여자"</label>
		</div>
		<!-- <button type="submit">회원 가입</button> -->
		<input type="submit" value="회원 가입">
	</form>
</body>
</html>