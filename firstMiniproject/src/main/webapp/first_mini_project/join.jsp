<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- 미디어로 사이즈 조절해두기! 데스크탑만 제한하면 될듯? -->

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container closeMod">
	<section class="joinContainer">
		<div id="joinTitle">StrideCycle 회원가입</div>
		<form action="../user" name="formId" method="post">
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
			</label> <span class="inputName">즐기는 운동</span> <label class="joinLine">
				<div class="inputBlock relatived">
					<label class="favor"><input type="radio" name="favor" value = "A" checked> 전부</label>
					 <label class="favor"><input type="radio" name="favor" value = "R"> 달리기</label> 
						<label class="favor"><input type="radio" name="favor" value = "C"> 자전거</label>
				</div>
			</label> <span class="inputName">주소 </span> <span class="joinLine">
				<div class="addrBlock relatived">
					<select name="si" class="addrSelect">
						<option name="op">시/도</option>

					</select> <select name="gu" class="addrSelect">
						<option>시/군/구</option>
					</select> <select name="dong" class="addrSelect">
						<option>읍/면/동</option>
					</select>
				</div>
			</span>

			<button type="button" onclick="join()" id="signInBtn">회원가입</button>

		</form>
	</section>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
		var form = document.formId
		setSelect();
		
		var confirmId = '';
		var confirmNick = '';
		

		function checkUid() {
			var uid = form.uid.value;
			
			if (uid.length < 5){
				alert("아이디는 5자리 이상 입력해주세요");
				return;
			}
			requestAjaxMessage(uid,"checkUid", "아이디");
		}
		

		function checkNick() {
			var nickName = form.nickName.value;

			if (nickName.length < 1){
				alert("닉네임은 한글자 이상 입력해주세요");
				return;
			}
			requestAjaxMessage(nickName,"checkNick", "닉네임");
}
		
		function requestAjaxMessage(checkValue, act, message){

			$.ajax({
				url : "${pageContext.request.contextPath}/user",
				type : "POST",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType : "json",
				data : {
					checkValue : checkValue,
					act : act
				},
				success : function(response) {
					if (!response.isAvailable) {
						alert("사용 가능한 " + message + "입니다.");

						if(act === "checkUid"){
							confirmId = checkValue;
						}else {
							confirmNick = checkValue;
						}
						
					} else {
						alert("이미 사용중인 " + message + "입니다. 다른 " + message + "를 사용해주세요")
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
		
		function setSelect(){
			
			requestRegion(form.si, "si");
			
			form.si.addEventListener('change', ()=>{
				form.gu.options.length = 0;
				var option = document.createElement("option");
				option.innerHTML = '시/군/구';
				form.gu.appendChild(option);
				requestRegion(form.gu, "gu");
			})
			
			form.gu.addEventListener('change', ()=>{
				form.dong.options.length = 0;
				var option = document.createElement("option");
				option.innerHTML = '읍/면/동';
				form.dong.appendChild(option);
				requestRegion(form.dong, "dong");
			})
		} 
		 function requestRegion(target, area){
	
			$.ajax({
				url : "${pageContext.request.contextPath}/region",
				type : "POST",
				dataType : "json",
				data : {
					act : area,
					si : form.si.value,
					gu : form.gu.value,
					dong : form.dong.value
				},
				success : (response)=>{
					response.forEach((value)=>{
						var option = document.createElement("option");
						option.innerHTML = value;
						target.appendChild(option);
					})

				},
				error : function(xhr, status, error) {
					console.error("AJAX Error - Status: " + status
							+ ", Error: " + error);
					console.error("Response Text: " + xhr.responseText);
					alert("There was an error processing the request.");
				}
			});
		} 
		
		
		function join() {

			var userData = {
				uid : form.uid,
				nickName : form.nickName,
				pwd : form.pwd,
				confirmPwd : form.confirmPwd,
				name : form.name,
				phone : form.phone,
				addr : form.dong,
				favor : form.favor
			};
			var requestData = {
					uid : form.uid.value,
					pwd : form.pwd.value,
					name : form.name.value,
					phone : form.phone.value,
					addr : form.dong.value,
					nickName : form.nickName.value,
					favor : form.favor.value
				};

			// 빈칸 검색
			var isEmpty = Object.values(userData).some((udata)=>{
				if (udata.value === ''){
					udata.focus();
					alert("빈칸을 채워주세요");
					return true;
				} else return false;
			})
			if(isEmpty){
				return;
			}
			// id자리수확인
			if (userData.uid.value.length < 5){
				alert("아이디는 5글자 이상 입력해주세요");
				return;
			}
			// 중복체크 -> 해당 아이디값이 변화했을 경우에도 체크해준다
			if (userData.uid.value != confirmId) {
				alert("아이디를 확인해주세요");
				console.log(confirmId);
				console.log(userData.uid.value);
				
				return;
			}
			
			// 중복체크 -> 해당 닉네임값이 변화했을 경우에도 체크해준다
			if (userData.nickName.value != confirmNick) {
				alert("닉네임을 확인해주세요");
				return;
			} 

			// pwd자리수확인
			if (userData.pwd.value.length < 8){
				alert("비밀번호는 8글자 이상 입력해주세요");
				return;
			}
			
			// pwd confirm
			if(userData.pwd.value != userData.confirmPwd.value){
				 alert("비밀번호가 일치하지 않습니다."); 
				return;
			} 
			Object.values(userData)
			 
			if(userData.addr.value === "읍/면/동"){
				alert("주소를 지정해주세요.");
				return;
			}
			// JSON 형태로 서버에 전송
			 $.ajax({
				url : "${pageContext.request.contextPath}/user",
				type : "POST",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data : {
					jsonData : JSON.stringify(requestData),
					act : "join"
				},
				success : function(response) {
					alert("회원가입이 완료되었습니다.");

					form.action = "${pageContext.request.contextPath}/page?act=main";
					form.method = "get";
					form.submit(); 
				},
				error : function(xhr, status, error) {
					console.error("AJAX Error - Status: " + status
							+ ", Error: " + error);
					console.error("Response Text: " + xhr.responseText);
					alert("회원가입 처리 중 오류가 발생했습니다.");
				}
			}); 
			
		}
	</script>
</body>
</html>