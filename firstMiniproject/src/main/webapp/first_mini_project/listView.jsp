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
<script
	src="${pageContext.request.contextPath}/first_mini_project/src/js/jquery-3.7.1.min.js?ts=<%=System.currentTimeMillis()%>"></script>
</head>

<body>
	<%@ page import="model.User"%>
	<%
		User userSession = (User) session.getAttribute("userSession");
	//TODO 사이드바 추가 및 
	//TODO 리스트 출력 시 order by 를 통해서 모임 날짜가 최근인 것 부터 보여주면 좋을 듯?
	if (userSession == null) {
		//null로 오는 경우는 무조건 searchGroup이다
		
	} else {
		String act = request.getParameter("act");
		if(act.equals("Schedule")){
			//TODO 개인 기록 Session값에 맞춰서 join된 테이블을 조회 후 보드를 출력
			String uidSession = userSession.getUid();
			System.out.println("uidSession: " + uidSession);	
		} else if(act.equals("searchGroup")){
			//TODO Session에 있는 favor 정보만을 이용해서 기본 리스트 출력
			String uidSession = userSession.getUid();
			System.out.println("uidSession: " + uidSession);			
		}
		
	}
	%>
<script>

</script>
	<jsp:include page="header.jsp"></jsp:include>

	<section id="listContainer closeMod">
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
				class="searchIcon" src="${pageContext.request.contextPath}/first_mini_project/src/icon/con_searh.png">

		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>

</html>