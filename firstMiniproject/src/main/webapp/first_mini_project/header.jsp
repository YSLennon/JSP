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
<%@ page import="model.User" %>
<% 
	User userSession = (User) session.getAttribute("userSession");
	String loginTxt = (userSession != null)?"logout":"login";
	if(userSession != null){
		String uidSession = userSession.getUid();
		String favorSession = userSession.getFavor();
		String authoritySession = userSession.getAuthority();
		String udatetimeSession = userSession.getUdatetime();
	}
%>

	<div id="headLine">hi</div>
	<header >
		<div id="menuBar">
			<div id="webTitle"><a href="${pageContext.request.contextPath}/page?act=main">StrideCycle</a></div>
			<a class="menuBtnC" href="javascript:;">
			<img id="menuBtn" src="${pageContext.request.contextPath}/first_mini_project/src/icon/icon_menu_btn.png"></a>
				 <a id="loginBtn" class="menu" href="javascript:;">
				 	<%=loginTxt%> 
				 </a>
				 <a class="menu" href="javascript:;"> Schedule </a> 
				<a class="menu" href="javascript:;"> SearchGroup </a>

		</div>

	</header>
	<div class="empty"></div>
	
	
	<div class="modalPopup" id="modalPopup">
		<div id="loginTitle">StrideCycle</div>
		<form name="loginForm" action="${pageContext.request.contextPath}/user" method="post">
		<input type="hidden" name="act" value="login">
			<input class="loginInput" type="text" name="uid" placeholder="id">
			<input class="loginInput" type="password" name="pwd" placeholder="password">
		<div id="findAccount">
			<a class="find skyblue" href="javascript:;" id="findPwd">비밀번호 찾기 </a>
			<span class="find skyblue"> | </span> 
			<a class="find skyblue" href="javascript:;" id="findUid"> 아이디 찾기</a>
		</div>
		<button id="loginSignInBtn">로그인</button>
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
   $(function(){
     $("#confirm").click(function(){
         //모달 닫기 함수 호출
         modalClose();
         enableScroll();
         //컨펌 이벤트 처리
     });
     $("#loginBtn").click(function(){        
    	 if($("loginBtn").html() === "login"){

             $("#modalPopup").css('display','table').hide().fadeIn();
             disableScroll();
             //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과 
    	 } else{
				location.href="${pageContext.request.contextPath}/user?act=logout";
    	 }
     });
      $(".closeMod").click(function(){
         modalClose(); //모달 닫기 함수 호출
         enableScroll();
     }); 
     function modalClose(){
         $("#modalPopup").fadeOut(); //페이드아웃 효과
     }
   });
   
	</script>
</body>

</html>