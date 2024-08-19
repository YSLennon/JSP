
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
}
</style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/first_mini_project/src/layout/layout.css">
</head>
<body>
	<%@ page import="model.User"%>
<% 
String act = "userList";
User userSession = (User)session.getAttribute("userSession");
String sessionNick = "";
boolean sessionAuth = false;
if(userSession != null){
	sessionNick = userSession.getNickName()+"님";
	if(userSession.getAuthority().equals("A")){
		sessionAuth = true;
	}
}

	
		
%>
	<jsp:include page="header.jsp"></jsp:include>
	<section id="userListContainer" class="container">
	<jsp:include page="sideBar.jsp"></jsp:include>
		<table id="tableContainer">
			
		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<script>
//showList();


function showList(){
    	$.ajax({
 			url : "${pageContext.request.contextPath}/user",
 			type : "POST",
 			dataType : "json",
 			data : {
 				act : '<%=act%>'
 			},
 			success : function(response) {
					console.log(response);
 				 appendList(response);	
			},
 			error : function(xhr, status, error) {
 				console.error("AJAX Error - Status: " + status
 						+ ", Error: " + error);
 				console.error("Response Text: " + xhr.responseText);
 				alert("lsitView Error.");
 			}
 		});     	
}

function appendList(data){
	var container = document.getElementById("tableContainer");
	
	container.innerHTML = '';
	var listHeader = document.createElement("tr");
	listHeader.innerHTML = `
		<th>아이디</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>닉네임</th>
		<th>선호도</th>
		<th>로그인제한</th>
	`
	container.appendChild(listHeader);
	
	data.forEach(user => {
		var item = document.createElement("tr");
		item.innerHTML = '';
		var checkCnt = (user.cnt >= 5)? "<button type='button' onclick='initCnt(`"+user.uid+"`)'>초기화</button>" : "";
		
		item.innerHTML =`
			<td>` + user.uid + `</td>
			<td>` + user.name + `</td>
			<td>` + user.phone + `</td>
			<td>` + user.addr + `</td>
			<td>` + user.nickName + `</td>
			<td>` + user.favor + `</td>
			<td>` + checkCnt + `</td>
			`
			container.appendChild(item);
	})
}
function initCnt(userId){
	console.log(userId);
	$.ajax({
			url : "${pageContext.request.contextPath}/user",
			type : "POST",
			dataType : "json",
			data : {
				act : 'initCnt',
				uid : userId
			},
			success : function(response) {
				alert(response.message);
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