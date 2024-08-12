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
	<form action="join_result.jsp" method="get" name="login">
		<div><label>아이디 : <input type="text" name="uid"></label></div>
		<div><label>비밀번호 : <input type="password" name="pwd"></label></div>
		<div><label>이름 : <input type="text" name="name"></label></div>
		<div>
			<label><input type="radio" value="M" name=gender>"남자"</label>
			<label><input type="radio" value="F" name=gender>"여자"</label>
		</div>
		<div>
			<label><input type="checkbox" value = "coding" name="hobby">코딩</label>
			<label><input type="checkbox" value = "game" name="hobby">게임</label>
			<label><input type="checkbox" value = "soccer" name="hobby">축구</label>
		</div>
	<!-- <button >회원 가입</button> -->
 		<input type="button" value="회원 가입" onclick="fnJoin()">
	</form>
	<script> /* JS 영역임.. equals 없다 */
		function fnJoin(){
			/* document.'formTagName'을 입력해서 접근할 수 있다. */
			var form = document.login; 
			console.log(document.uid);
			if(form.uid.value === ""|| form.uid.value.length == undefined){
				alert('ID를 입력해주세요')
				form.uid.focus();
				return;
			}
			console.log(form.uid);
			console.log(form.hobby);
			form.submit();

		}
	
	</script>
</body>
</html>