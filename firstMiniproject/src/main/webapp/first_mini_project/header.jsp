<%@page import="java.lang.classfile.attribute.ModuleTargetAttribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/first_mini_project/src/layout/layout.css">
<script
	src="${pageContext.request.contextPath}/first_mini_project/src/js/jquery-3.7.1.min.js?ts=<%=System.currentTimeMillis()%>"></script>

</head>

<body>
	<%@ page import="model.User"%>
	<%
	// TODO 여유되면 하기! cloc 이용해서 로그인 시 로케이션으로 이동
	// session.setAttribute("cLoc", "main");
	// String cLoc = (String) session.getAttribute("cLoc");
	User userSession = (User) session.getAttribute("userSession");
	String loginTXT = (userSession != null) ? "logout" : "login";
	if (userSession != null) {
		String uidSession = userSession.getUid();
		String favorSession = userSession.getFavor();
		String authoritySession = userSession.getAuthority();
		String udatetimeSession = userSession.getUdatetime();
		System.out.println("uidSession: " + uidSession);
	}
	%>

	<div id="headLine">hi</div>
	<header>
		<div id="menuBar">
			<div id="dropdown">
				<a href="${pageContext.request.contextPath}/page?act=clientInfo"><div>회원정보 수정</div></a>
			</div>
			<div id="webTitle">
				<a href="${pageContext.request.contextPath}/page?act=main">StrideCycle</a>
			</div>
			<a class="menuBtnC" onclick="openMenu()" href="javascript:;"> <img id="menuBtn"
				src="${pageContext.request.contextPath}/first_mini_project/src/icon/icon_menu_btn.png"></a>
			<a id="loginBtn" class="menu" href="javascript:;"> <%=loginTXT%> </a> 
			<a id="scheduleBtn" class="menu" href="javascript:;"> Schedule </a> 
			<a id="searchGroupBtn" class="menu" href="${pageContext.request.contextPath}/page?act=searchGroup"> SearchGroup </a>

		</div>

	</header>
	<div class="empty"></div>


	<div class="modalPopup" id="modalPopup">
		<div id="loginTitle">StrideCycle</div>
		<form name="loginForm">
			<input class="loginInput" type="text" name="uid" placeholder="id">
			<input class="loginInput" type="password" name="pwd"
				placeholder="password">
			<div class="find" id="findAccount">
				로그인 시도가 불가능하신가요? <br>
				<a class="find skyblue" href="javascript:;" id="findPwd"> 관리자에게 문의하기</a>
			</div>
			<button type="button" id="loginSignInBtn">로그인</button>
		</form>
		<div id="joinZone">
			계정이 없으신가요? <a class="skyblue" href="${pageContext.request.contextPath}/page?act=join"> 회원가입</a>
		</div>
	</div>


	<script>
	

    
	// loginModalPopup
    function disableScroll() {
   // body 요소의 overflow를 hidden으로 변경하여 스크롤 비활성화
   document.body.style.overflow = 'hidden';
   }

   function enableScroll() {
   // body 요소의 overflow를 다시 visible로 변경하여 스크롤 활성화
   document.body.style.overflow = 'visible';
   }
	function modalClose() {
		$("#modalPopup").fadeOut(); //페이드아웃 효과
	}
	$(function(){
		$("#loginSignInBtn").click(function(){
         //로그인 이벤트 처리
         	$.ajax({
	 			url : "${pageContext.request.contextPath}/user",
	 			type : "POST",
	 			dataType : "json",
	 			data : {
	 				uid : document.loginForm.uid.value,
	 				pwd : document.loginForm.pwd.value,
	 				act : "login"
	 			},
	 			success : function(response) {
	 				console.log(response);
	 				if(response.resultMessage != null){
	 					alert(response.resultMessage);
	 					
	 					if(response.success){
	 				        //모달 닫기 함수 호출
	 				        modalClose();
	 				        enableScroll();
 		                    setTimeout(function() {
 		                    location.href = "${pageContext.request.contextPath}/page";	
 		                    
 		                    }, 500); // 모달 닫힌 후 페이지 이동					
		                    }
	 				}
				},
	 			error : function(xhr, status, error) {
	 				console.error("AJAX Error - Status: " + status
	 						+ ", Error: " + error);
	 				console.error("Response Text: " + xhr.responseText);
	 				alert("로그인 처리 중 오류가 발생했습니다.");
	 			}
	 		}); 
     	});

		$("#scheduleBtn").click(function(){
	         //로그인 이벤트 처리
	         	$.ajax({
		 			url : "${pageContext.request.contextPath}/page",
		 			type : "POST",
		 			dataType : "json",
		 			data : {
		 				act : "schedule"
		 			},
		 			success : function(response) {
		 				if(response.success){
		 					//성공
		                        location.href = "${pageContext.request.contextPath}/page?act=userSchedule";
		 				}else {
		 					//실패
		 					alert("로그인 후 이용해주세요");
		 				}
					},
		 			error : function(xhr, status, error) {
		 				console.error("AJAX Error - Status: " + status
		 						+ ", Error: " + error);
		 				console.error("Response Text: " + xhr.responseText);
		 			}
		 		}); 
	     	});
		
		$("#loginBtn").click(function(){        
	    	 if('<%=loginTXT%>' === "login") {
				//팝업을 table속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
				$("#modalPopup").css('display', 'table').hide().fadeIn(function() {
					document.getElementsByName("uid")[0].focus();
				});
				disableScroll();
			} else {
				alert("로그아웃 되었습니다.");
				location.href = "${pageContext.request.contextPath}/user?act=logout";
			}
		});
		<% //TODO 관리자에게 문의해서 로그인 시도 횟수 초기화하기! DB정보에 넣어야할듯 관리자로 링크해서%>
		$("#findPwd").click(function(){
	         //로그인 이벤트 처리
	         	$.ajax({
		 			url : "${pageContext.request.contextPath}/page",
		 			type : "POST",
		 			dataType : "json",
		 			data : {
		 				act : "schedule"
		 			},
		 			success : function(response) {
		 				if(response.success){
		 					//성공
		                        location.href = "${pageContext.request.contextPath}/page?act=userSchedule";
		 				}else {
		 					//실패
		 					alert("로그인 후 이용해주세요");
		 				}
					},
		 			error : function(xhr, status, error) {
		 				console.error("AJAX Error - Status: " + status
		 						+ ", Error: " + error);
		 				console.error("Response Text: " + xhr.responseText);
		 			}
		 		}); 
	     	});
		
		$(".closeMod").click(function() {
			if(document.body.style.overflow == 'hidden'){
				modalClose(); //모달 닫기 함수 호출
				enableScroll();
				closeMenu();
			}

		});
		
		document.addEventListener("keydown", function(event){
			if(event.key === "Enter"){
				event.preventDefault();
				$("#loginSignInBtn").click();	
			}
			if(event.key === "Escape"){
				modalClose(); //모달 닫기 함수 호출
				enableScroll();
				closeMenu();
			}
		})
		
	});
	function closeMenu(){
		document.querySelector("#dropdown").style.display='none';
		document.querySelector('#menuBar').style.borderBottomRightRadius = '50px';
	}
	function openMenu(){
		if(document.querySelector('#dropdown').style.display==='none'){
			document.querySelector('#dropdown').style.display='inline-block';
			document.querySelector('#menuBar').style.borderBottomRightRadius = '0px';
		} else {
			document.querySelector("#dropdown").style.display='none';
			document.querySelector('#menuBar').style.borderBottomRightRadius = '50px';
		}
	}
	
	</script>
</body>

</html>