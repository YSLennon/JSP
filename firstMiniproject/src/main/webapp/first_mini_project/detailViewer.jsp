<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/first_mini_project/src/layout/layout.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb5f78025cfc4a949b7645cd535a0956"></script>
    
</head>
<body>
	<%@ page import="model.User"%>
	<jsp:include page="header.jsp"></jsp:include>
	
<div  class="container closeMod">
	<jsp:include page="sideBar.jsp"></jsp:include>
    <section id="detVwContainer">
      <!--   <div id="titleBlock">Title
        </div>
        <div class="boardInfo">
                <div id="organizer" style="margin-left: 150px;">organizer</div>
                <div id="cdatetime">작성일자: 2024.05.06 13:00 </div>
            </div>
        
        <div class="mainBlock">
            <div id="map">

            </div>
            <div class="boardInfo">
			<a href="javascript:;">현재 예정 인원 : 3명</a>
			</div>
            <div id="tagZone">
                <div class="detTagBlock">Ride</div>
                <div class="detTagBlock">NowMember</div>
                <div class="detTagBlock">2024.05.06 13:00 </div>
            </div>

            <div id="contentsBlock">
                이것은 컨텐츠입니다
            </div>
        </div>  -->
    </section>
    </div>
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script>
	<%
	User userSession = (User) session.getAttribute("userSession");
	%>
	
	// showList();
	function showList(){
	<%
		userSession = (User) session.getAttribute("userSession");
		String sessionUid = "";
		if(userSession != null){
			sessionUid = userSession.getUid();
		}
			
	%>
        	$.ajax({
	 			url : "${pageContext.request.contextPath}/board",
	 			type : "POST",
	 			dataType : "json",
	 			data : {
	 				act : 'detailViewer',
	 				boardNo : <%=request.getParameter("boardNo")%>
	 			},
	 			success : function(response) {
					appendList(response.boardList[0], response.boardList.length, response.uidList);
					makeMap();
					if(response.boardList[0].organizer === '<%=sessionUid%>' || '<%=sessionUid%>' ==='admin'){
						document.querySelectorAll(".clickable").forEach(obj => {
							obj.style.display = 'block';
						})
					}
				},
	 			error : function(xhr, status, error) {
	 				console.error("AJAX Error - Status: " + status
	 						+ ", Error: " + error);
	 				console.error("Response Text: " + xhr.responseText);
	 				alert("lsitView Error.");
	 			}
	 		});     	
	}

function appendList(item, cnt, memberList){
		var container = document.getElementById("detVwContainer");
		var members = '참여인원: ';
		memberList.forEach(member => {
			if(members != '참여인원: '){
				members =members + ', ' + member;
			}else {
				members = members + member;
			}
			
		})
		
		container.innerHTML = '';
			const category = getCategoryLabel(item.category);			
			const status = getStatusLabel(item.status);
			
			const listItem = document.createElement('div');
			listItem.innerHTML = `
			        <div id="titleBlock">
						`+item.title+`
						<span id="modifyBoard" class="clickable"><a onclick="fnModifyBoard(`+item.boardNo+`)" href="javascript:;">수정</a></span>
						<span id="removeBoard" class="clickable"><a onclick="fnRemoveBoard(`+item.boardNo+`)" href="javascript:;">삭제</a></span>
			        </div>
			        <div class="boardInfo">
			                <div id="organizer" style="margin-left: 150px;">`+item.organizer+`</div>
			                <div id="cdatetime">작성일자: `+item.cdatetime+` </div>
			            </div>
			        <div class="mainBlock">
			            <div id="map">
			            </div>
			            <div class="boardInfo">
						</div>
			            <div id="tagZone">
			                <div class="detTagBlock">` + category + `</div>
			                <div id="showMember" class="detTagBlock">
			                	참여인원: ` +cnt+ `
			                	<span id="memberList">`+ members +`</span>
			                </div>
			                <div class="detTagBlock">`+ item.datetime + `</div>
			            </div>
			            <div id="contentsBlock">
			                `+item.contents+`
			            </div>
			        </div> 
				`			
			container.appendChild(listItem);
		}

	function getStatusLabel(status){
		if(status ==='recruitment') return '모집중';
		else if(status === 'hidden') return 'hidden';
		else if(status === 'completed') return '완료됨';
	}
	function getCategoryLabel(category){
		if(category ==='R') return '달리기';
		else if(category ==='C') return '자전거';
	}
	function fnModifyBoard(boardNo){
		
	}
	function fnRemoveBoard(boardNo){
		if(confirm("정말로 삭제하시겠습니까?")){
			$.ajax({
	 			url : "${pageContext.request.contextPath}/board",
	 			type : "POST",
	 			dataType : "json",
	 			data : {
	 				act : 'removeBoard',
	 				boardNo : boardNo
	 			},
	 			success : function(response) {
					alert(response.message);
					location.href="${pageContext.request.contextPath}/page?act=searchGroup"
				},
	 			error : function(xhr, status, error) {
	 				console.error("AJAX Error - Status: " + status
	 						+ ", Error: " + error);
	 				console.error("Response Text: " + xhr.responseText);
	 				alert("lsitView Error.");
	 			}
	 		});	
		}     	
	}
	
	function makeMap(){
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	}
	</script>
</body>

</html>