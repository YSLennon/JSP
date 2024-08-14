<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/first_mini_project/src/layout/layout.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="body">
		<div class="container">

			<jsp:include page="sideBar.jsp"></jsp:include>
			<div class="clientInfoContainer">
				<div id="joinTitle">회원 정보 변경</div>
				<span class="inputName">닉네임</span> <label class="joinLine">
					<input class="inputBlock" type="text" name="uid"
					placeholder="nick name">
					<button type="button">중복체크</button>
				</label> <span class="inputName">패스워드 </span> <label class="joinLine">
					<input class="inputBlock" type="password" name="pwd"
					placeholder="password">
				</label> <span class="inputName">패스워드 확인 </span> <label class="joinLine">
					<input class="inputBlock" type="password" name="confirmPwd"
					placeholder="confirm password">
					<button type="button">변경확인</button>
				</label> <span class="inputName">이름 </span> <label class="joinLine">
					<input class="inputBlock" type="text" name="uid" placeholder="name">
				</label> <span class="inputName">핸드폰 </span> <label class="joinLine">
					<input class="inputBlock" type="text" name="uid"
					placeholder="phone">
				</label> <span class="inputName">주소 </span> <label class="joinLine">
					<input class="inputBlock" type="text" name="uid"
					placeholder="addr존이긴한데 동적으로 처리할거임 select및 DB 활용">
				</label>


				<button id="signInBtn">회원 정보 변경</button>

			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>