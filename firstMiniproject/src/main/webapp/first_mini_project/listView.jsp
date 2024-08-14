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

	<section id="listContainer">
		<div class="listBlock">
			<a class="listTitle" href="javascript:;">Title</a>
			<div class="listDatetime">2024.05.06 13:00 모임 날짜</div>
			<div id="tagZone">
				<div class="tagBlock">Ride</div>
				<div class="tagBlock">Area</div>
				<div class="tagBlock">NowMember</div>
				<div class="tagBlock listStatus"> 모집중</div>
			</div>
		</div>
		<div class="listBlock">
			<a class="listTitle" href="javascript:;">Title</a>
			<div class="listDatetime">2024.05.06 13:00 모임 날짜</div>
			<div id="tagZone">
				<div class="tagBlock">Ride</div>
				<div class="tagBlock">Area</div>
				<div class="tagBlock">NowMember</div>
				<div class="tagBlock listStatus"> 모집중</div>
			</div>
		</div>
		<div class="listBlock">
			<a class="listTitle" href="javascript:;">Title</a>
			<div class="listDatetime">2024.05.06 13:00 모임 날짜</div>
			<div id="tagZone">
				<div class="tagBlock">Ride</div>
				<div class="tagBlock">Area</div>
				<div class="tagBlock">NowMember</div>
				<div class="tagBlock listStatus"> 모집중</div>
			</div>
		</div>
		<div class="listBlock">
			<a class="listTitle" href="javascript:;">Title</a>
			<div class="listDatetime">2024.05.06 13:00 모임 날짜</div>
			<div id="tagZone">
				<div class="tagBlock">Ride</div>
				<div class="tagBlock">Area</div>
				<div class="tagBlock">NowMember</div>
				<div class="tagBlock listStatus"> 모집중</div>
			</div>
		</div>
		<div class="listBlock">
			<a class="listTitle" href="javascript:;">Title</a>
			<div class="listDatetime">2024.05.06 13:00 모임 날짜</div>
			<div id="tagZone">
				<div class="tagBlock">Ride</div>
				<div class="tagBlock">Area</div>
				<div class="tagBlock">NowMember</div>
				<div class="tagBlock listStatus"> 모집중</div>
			</div>
		</div>

		<div id="searchZone">
			<select>
				<option>전체</option>
				<option>몰루</option>
				<option>몰러</option>
			</select> <input id="search" placeholder="검색"> <img
				class="searchIcon" src="src/icon/con_searh.png">

		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>