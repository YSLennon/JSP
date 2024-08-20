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
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="categorySelect">
		<select id="boardSelect">
			<option value="A">모두보기</option>
			<option value="C">자전거</option>
			<option value="R">달리기</option>
		</select>
	</div>
	<section class="container closeMod">
		<jsp:include page="sideBar.jsp"></jsp:include>
	
		<div id="listContainer">
			 <%-- <div class="listBlock">
				<a id="title" class="listTitle" href="javascript:;">Title</a>
				<div id="datetime" class="listDatetime">2024.05.06 13:00 모임 날짜</div>
				<div id="tagZone">
					<div id="category" class="tagBlock">Ride</div>
					<div id="addr" class="tagBlock">Area</div>
					<div id="member" class="tagBlock">NowMember</div>
					<div id="boardStatus" class="tagBlock listStatus"> 모집중</div>
				</div>
			</div>
			<div id="searchZone">
				<select>
					<option>전체</option>
					<option>몰루</option>
					<option>몰러</option>
				</select> <input id="search" placeholder="검색"> 
				<img class="searchIcon" src="${pageContext.request.contextPath}/first_mini_project/src/icon/con_searh.png">
			</div>  --%>
			
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script>
	<%
	User userSession = (User) session.getAttribute("userSession");
	//TODO 리스트 출력 시 order by 를 통해서 모임 날짜가 최근인 것 부터 보여주면 좋을 듯?
			String favor ="'A'" ;
			String act = request.getParameter("act");
			System.out.println("pageName act = "+ act);

		if(act.equals("Schedule")){
			//TODO 개인 기록 Session값에 맞춰서 join된 테이블을 조회 후 보드를 출력
			if(userSession != null){
				String uidSession = userSession.getUid();
			 favor = "'"+userSession.getFavor()+"'";
			}
		} else if(act.equals("searchGroup")){
			//TODO Session에 있는 favor 정보만을 이용해서 기본 리스트 출력
			if(userSession != null){
				String uidSession = userSession.getUid();
			 favor = "'"+userSession.getFavor()+"'";
			}
		}
	%>
	// User 정보에 맞춰서 리스트 변경
	if (<%=userSession != null%>) {
		document.querySelector("#boardSelect").value = <%=favor%>; 
	}
	// showList();
	document.querySelector("#boardSelect").addEventListener("change", showList);
	function showList(){

        	$.ajax({
	 			url : "${pageContext.request.contextPath}/board",
	 			type : "POST",
	 			dataType : "json",
	 			data : {
	 				act : '<%=act%>',
	 				category : document.querySelector("#boardSelect").value
	 			},
	 			success : function(response) {
						appendList(response.list);	
	 				
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
		var container = document.getElementById("listContainer");
		container.innerHTML = '';

		if(data.length ==0){
			const listItem = document.createElement('div');
			listItem.className = 'listBlock';
			listItem.innerHTML = `
							<div style="display:inline-block ; margin: 20px auto;" >아무 기록이 없습니다.</span>
			`;
			container.appendChild(listItem);
		}

		
		
		data.forEach(item => {
			const isLogin = (item.uid != null);
			const category = getCategoryLabel(item.category);			
			const status = getStatusLabel(item.status, isLogin);
			const listItem = document.createElement('div');
			listItem.className = 'listBlock';
			listItem.innerHTML = `
	            <a id="title" class="listTitle" href="${pageContext.request.contextPath}/page?act=detailViewer&boardNo=`+item.boardNo+`">`+item.title+`</a>
	            <div id="datetime" class="listDatetime">`+item.datetime+`</div>
	            <div id="tagZone" style="margin-top:10%"">
	                <div id="category" class="tagBlock">`+category+`</div>
	                <div id="addr" class="tagBlock">`+item.addr+`</div>
	                <div id="boardStatus" class="tagBlock listStatus">`+status+`</div>
	            </div>
			`;
			container.appendChild(listItem);
		})
		
		/* 
		const searchItem = document.createElement('div');
		searchItem.id = 'searchZone';
		searchItem.innerHTML =`
			<select>
			<option>전체</option>
			<option>몰루</option>
			<option>몰러</option>
		</select> <input id="search" placeholder="검색"> <img
			class="searchIcon" src="${pageContext.request.contextPath}/first_mini_project/src/icon/con_searh.png">
		`
		container.appendChild(searchItem);
		 */
		
	}
	function getStatusLabel(status, isLogin){
		if(isLogin){
			if(status ==='recruitment') return '참여중'; 
		}
		if(status ==='recruitment') return '모집중';
		else if(status === 'hidden') return 'hidden';
		else if(status === 'completed') return '완료됨';
		
		
	}
	function getCategoryLabel(category){
		if(category ==='R') return '달리기';
		else if(category ==='C') return '자전거';
	}
	
	</script>
</body>

</html>