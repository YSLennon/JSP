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
	<jsp:include page="header.jsp"></jsp:include>
	<div class="introContainer">
		<div class="txtZone">
			<div class="introTxt">다양한 사람들과</div>
			<div class="introTxt">함께 달려보세요!</div>
			<div class="introTxt">새로운 친구를 만나고,</div>
			<div class="introTxt">더 큰 목표를 함께 이루어보세요.</div>
		</div>
		<img class="togetherImage" src="src/images/imageWithFriends.png">


	</div>
	<img id="cycleImage" src="src/images/trekbike.jpg">

	<div class="introContainer">
		<div class="txtZone">
			<div class="introTxt">나와 같은 관심사</div>
			<div class="introTxt">나와 같은 지역의 멤버들과</div>
			<div class="introTxt">함께 달려보세요</div>
		</div>
		대충 지역별 모임 이미지 <img class="togetherImage"
			src="src/images/imageWithFriends.png">

	</div>
	<img id="runImage" src="src/images/run_image_nike.jpg">

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>