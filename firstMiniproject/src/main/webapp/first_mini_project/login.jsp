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
        <input type="text" name="uid" placeholder="id">
        <input type="password" name="pwd" placeholder="password">
        <div id="findAccount">
            <a class="find" href="javascript:;" id="findPwd">ë¹ë°ë²í¸ ì°¾ê¸° </a>
            <span class="find"> | </span>
            <a class="find" href="javascript:;" id="findUid"> ìì´ë ì°¾ê¸°</a>
        </div>
        <button id="loginSignInBtn">ë¡ê·¸ì¸</button>
        <div id="joinZone">
            ê³ì ì´ ìì¼ì ê°ì? <a href="javascript:;" > íìê°ì</a>
        </div>


    </div>
</body>
</html>