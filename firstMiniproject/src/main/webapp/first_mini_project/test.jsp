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
	
	<style>
	.cont{
	}
	.innercont{
	float:left;
    box-sizing: border-box;
    margin: 5% 15%;
    width: 70%;
    height: 90%;
    border-radius: 20px;
    padding: 20px;
    box-shadow: 0px 0px 5px gray;
	background-color: #red;
	}
	</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="body">
		<div class="cont"
		style="
	background-color: #abcdef;
	width:100%;">

			<jsp:include page="sideBar.jsp"></jsp:include>
			<div class="innercont">


			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>