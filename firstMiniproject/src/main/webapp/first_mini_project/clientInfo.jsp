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
	
		<div class="container closeMod">

			<jsp:include page="sideBar.jsp"></jsp:include>
			
			<div class="clientInfoContainer">
				<div id="joinTitle">회원 정보 변경</div>
		<form action="../user" name="formId" method="post">
		<input name="uid" type="hidden">		
		<input name="presentPwd" type="hidden">
			 <span class="inputName">닉네임</span> <label class="joinLine">
				<input class="inputBlock" type="text" name="nickName"
				placeholder="닉네임">
				<button type="button" onclick="checkNick()">중복체크</button>
			</label> <span class="inputName">현재 비밀번호</span> <label class="joinLine">
				<input class="inputBlock" type="password" name="pwd"
				placeholder="비밀번호">
			</label> <span class="inputName">새 비밀번호</span> <label class="joinLine">
				<input class="inputBlock" type="password" name="newPwd"
				placeholder="새 비밀번호(미변경 시 기존 비밀번호)">
			</label> <span class="inputName">이름 </span> <label class="joinLine">
				<input class="inputBlock" type="text" name="name" placeholder="이름">
			</label> <span class="inputName">핸드폰 </span> <label class="joinLine">
				<input class="inputBlock" type="text" name="phone"
				placeholder="휴대폰 번호">
			</label> <span class="inputName">즐기는 운동</span>
			 <label class="joinLine">
				<div class="inputBlock relatived">
					<label class="favor"><input type="radio" name="favor" value = "A" checked> 전부</label>
					<label class="favor"><input type="radio" name="favor" value = "R"> 달리기</label> 
					<label class="favor"><input type="radio" name="favor" value = "C"> 자전거</label>
				</div>
			</label> <span class="inputName">주소 </span> 
			<span class="joinLine">
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
				<button type="button" onclick="changeInfo()" id="signInBtn">회원 정보 변경</button>
		</form>
	</div>
	</div>
			
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
		var form = document.formId
		setSelect();
		var presentNick = '';
		var confirmNick = '';


		function checkNick() {
			var nickName = form.nickName.value;

			if (nickName.length < 1){
				alert("닉네임은 한글자 이상 입력해주세요");
				return;
			}
			if (form.nickName.value === presentNick){
				alert("사용 가능한 닉네임입니다.");
				confirmNick = form.nickName.value;
				return;
			}
			requestAjaxMessage(nickName,"checkNick", "닉네임");
}
		
		function requestAjaxMessage(checkValue, act, message){
			confirmFlg = false;
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
		
		
		function changeInfo() {

			var userData = {
				nickName : form.nickName,
				pwd : form.pwd,
				newPwd : form.newPwd,
				name : form.name,
				phone : form.phone,
				addr : form.dong,
				favor : form.favor
			};
			var requestData = {
					uid : form.uid.value,
					pwd : form.newPwd.value,
					name : form.name.value,
					phone : form.phone.value,
					addr : form.dong.value,
					nickName : form.nickName.value,
					favor : form.favor.value
				};
/* 
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

			 */
			// 중복체크 -> 해당 닉네임값이 변화했을 경우에도 체크해준다
			if (userData.nickName.value != confirmNick) {
				alert("닉네임을 확인해주세요");
				return;
			} 

			// pwd confirm
			if(userData.pwd.value != form.presentPwd.value){
				 alert("비밀번호가 일치하지 않습니다."); 
				return;
			} 
			
			// pwd자리수확인
			if (userData.newPwd.value.length < 8){
				alert("비밀번호는 8글자 이상 입력해주세요");
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
					act : "changeInfo"
				},
				success : function(response) {
					alert("회원 정보가 변경되었습니다.");

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
  
		//TODO ajax로 기본 정보 불러오기
	function showList(){

    	$.ajax({
 			url : "${pageContext.request.contextPath}/user",
 			type : "POST",
 			dataType : "json",
 			data : {
 				act : 'clientInfo'
 			},
 			success : function(response) {
 				var resData = response[0];
 				console.log(resData);
 				
 				form.presentPwd.value = resData.pwd;
 				presentNick = resData.nickName;
 				form.uid.value = resData.uid;
 				form.nickName.value = resData.nickName;
 				form.name.value = resData.name;
 				form.phone.value = resData.phone;
 				form.favor.value = resData.favor;
 				
			},
 			error : function(xhr, status, error) {
 				console.error("AJAX Error - Status: " + status
 						+ ", Error: " + error);
 				console.error("Response Text: " + xhr.responseText);
 				alert("lsitView Error.");
 			}
 		});     	
}
	</script>
</body>
</html>