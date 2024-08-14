<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/first_mini_project/src/layout/layout.css">

</head>
<body>
    
    <div class="modalPopup">
        <div id="loginTitle">StrideCycle</div>
        <input class="loginInput" type="text" name="uid" placeholder="id">
        <input class="loginInput" type="password" name="pwd" placeholder="password">
        <div id="findAccount">
            <a class="find" href="javascript:;" id="findPwd">비밀번호 찾기 </a>
            <span class="find"> | </span>
            <a class="find" href="javascript:;" id="findUid"> 아이디 찾기</a>
        </div>
        <button id="loginSignInBtn">로그인</button>
        <div id="joinZone">
            계정이 없으신가요? <a href="javascript:;" > 회원가입</a>
        </div>

    </div>
</body>
</html>