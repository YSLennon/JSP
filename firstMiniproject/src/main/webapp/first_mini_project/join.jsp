<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- 미디어로 사이즈 조절해두기! 데스크탑만 제한하면 될듯? -->
<link rel="stylesheet" href="src/layout/layout.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="joinContainer">
		<div id="joinTitle">StrideCycle 회원가입</div>
		<form action="../user" name="formId" method="get">
		
			<input type="hidden" name="act" value="join"> <span
				class="inputName">아이디 </span> <label class="joinLine"> <input
				class="inputBlock" type="text" name="uid" placeholder="id">
				<button type="button" onclick="checkUid()">중복체크</button>
			</label> <span class="inputName">닉네임</span> <label class="joinLine">
				<input class="inputBlock" type="text" name="nickName"
				placeholder="nick name">
				<button type="button" onclick="checkNick()">중복체크</button>
			</label> <span class="inputName">패스워드 </span> <label class="joinLine">
				<input class="inputBlock" type="password" name="pwd"
				placeholder="password">
			</label> <span class="inputName">패스워드 확인 </span> <label class="joinLine">
				<input class="inputBlock" type="password" name="confirmPwd"
				placeholder="confirm password">
			</label> <span class="inputName">이름 </span> <label class="joinLine">
				<input class="inputBlock" type="text" name="name" placeholder="name">
			</label> <span class="inputName">핸드폰 </span> <label class="joinLine">
				<input class="inputBlock" type="text" name="phone"
				placeholder="phone">
			</label> <span class="inputName">주소 </span> <label class="joinLine">
				<input class="inputBlock" type="text" name="addr"
				placeholder="addr존이긴한데 동적으로 처리할거임 select및 DB 활용">
			</label> <span class="inputName">달리기/사이클</span> <label class="joinLine">
				<input class="inputBlock" type="text" name="favor"
				placeholder="checkbox로 두개 넣을거임">
			</label>
			
			<button type="button" onclick="join()" id="signInBtn">회원가입</button>
			
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<script>
	
<%String checkUid = (request.getParameter("checkUid") != null) ? request.getParameter("checkUid") : "";
if (checkUid.equals(true)) {%>
	alert("사용 가능한 아이디입니다.");
<%} else if (checkUid.equals(false)) {%>
	alert("이미 사용중인 아이디입니다.")
<%}%>

function checkUid(){

	var form = document.formId;
	form.action = "../user"
	form.act.value = "checkUid"
	console.log(form.act.value);
	form.submit();
}
function checkNick(){
	var form = document.formId;
	form.action = "../user"
	form.act.value = "join"
	form.submit();
	
}
function join(){
	var form = document.formId;
	form.action = "../user"
	form.act.value = "join"
	form.submit();
}

	
</script>