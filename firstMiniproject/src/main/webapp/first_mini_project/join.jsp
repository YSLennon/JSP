<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- 미디어로 사이즈 조절해두기! 데스크탑만 제한하면 될듯? -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/first_mini_project/src/layout/layout.css">
<script
	src="${pageContext.request.contextPath}/first_mini_project/src/js/jquery-3.7.1.min.js?ts=<%=System.currentTimeMillis()%>"></script>


<%-- <script src="${pageContext.request.contextPath}/first_mini_project/src/js/jquery-3.7.1.min.js"></script> --%>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="joinContainer">
		<div id="joinTitle">StrideCycle 회원가입</div>
		<form action="../user" name="formId" method="get">
			<span class="inputName">아이디 </span> <label class="joinLine">
				<input class="inputBlock" type="text" name="uid" placeholder="id">
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
	<script>
		var confirmId = '';

		function checkUid() {
			var form = document.formId;
			var uid = form.uid.value;
			$.ajax({
				url : "${pageContext.request.contextPath}/user",
				type : "POST",
				dataType : "json",
				data : {
					uid : uid,
					act : "checkUid"
				},
				success : function(response) {
					if (!response.isAvailable) {
						confirmId = uid;
						alert("사용 가능한 아이디입니다.");
						alert(confirmId);
					} else {
						alert("이미 사용중인 아이디입니다. 다른 아이디를 사용해주세요")
					}

				},
				error : function(xhr, status, error) {
					console.error("AJAX Error - Status: " + status
							+ ", Error: " + error);
					console.error("Response Text: " + xhr.responseText);
					alert("There was an error processing the request.");
				}
			});
		}

		function checkNick() {
			var form = document.formId;

			form.action = "../user"
			form.act.value = "join"
			form.submit();

		}
		
		function join() {
			/* gson도 확인해보자 -> 테스트 코드도 올려뒀으니 처리할때 사용하기! */

			var form = document.formId;
			var userData = {
				uid : form.uid.value,
				nickName : form.nickName.value,
				pwd : form.pwd.value,
				confirmPwd : form.confirmPwd.value,
				name : form.name.value,
				phone : form.phone.value,
				addr : form.addr.value,
				favor : form.favor.value
			};

			if (userData.uid != confirmId) {
				alert("아이디를 확인해주세요");
			}

			// JSON 형태로 서버에 전송
			$.ajax({
				url : "${pageContext.request.contextPath}/user",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(userData),
				success : function(response) {
					console.log('Success:', response);
					alert("회원가입이 완료되었습니다.");
				},
				error : function(xhr, status, error) {
					console.error("AJAX Error - Status: " + status
							+ ", Error: " + error);
					console.error("Response Text: " + xhr.responseText);
					alert("회원가입 처리 중 오류가 발생했습니다.");
				}
			});
			/* var form = document.formId;
			form.action = "../user"
			form.act.value = "join"
			form.submit(); */
		}
	</script>
</body>
</html>