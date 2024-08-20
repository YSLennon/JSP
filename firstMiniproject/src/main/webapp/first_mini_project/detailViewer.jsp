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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb5f78025cfc4a949b7645cd535a0956&libraries=services,clusterer,drawing"></script>


</head>
<body>
	<%@ page import="model.User"%>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container closeMod">
		<jsp:include page="sideBar.jsp"></jsp:include>
		<section id="detVwContainer"></section>
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
	 				
					 
	 				console.log(response);
	 				
					appendList(response.boardList[0], response.boardList.length, response.uidList);

					if(response.boardList[0].organizer === '<%=sessionUid%>' || '<%=sessionUid%>' ==='admin'){
						document.querySelectorAll(".clickable").forEach(obj => {
							obj.style.display = 'block';
						})
						if(document.querySelector("#boardStatus").innerHTML === '모집중'){
							document.querySelector("#boardStatus").classList.add("clickable2");
							document.querySelector("#boardStatus").addEventListener("click", () => {
								fnChangeStatus(<%=request.getParameter("boardNo")%>);
							})	
						}
					} else {
						if(document.querySelector("#boardStatus").innerHTML === '모집중'){
							document.querySelector("#boardStatus").innerHTML = '신청하기'
							document.querySelector("#boardStatus").classList.add("clickable2");
							document.querySelector("#boardStatus").addEventListener("click", () => {
								fnSubmit(<%=request.getParameter("boardNo")%>);
							})	
						}
					}
					
					//TODO map 데이터 로드해오기
					fnLoadMap(JSON.parse(response.boardList[0].map));
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
			console.log(item);
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
			            <div id="tagZone" style="position: relative">
			                <div class="detTagBlock">` + category + `</div>
			                <div id="showMember" class="detTagBlock">
			                	참여인원: ` +cnt+ `
			                	<span id="memberList">`+ members +`</span>
			                </div>
			                <div class="detTagBlock">`+ item.datetime + `</div>
			                <div id="boardStatus" class="tagBlock listStatus" style="margin-top: 10px">`+status+`</div>
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
		location.href="${pageContext.request.contextPath}/page?act=modify&boardNo="+boardNo;
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
	function fnChangeStatus(boardNo){
		if(confirm("확인을 누르시면 완료처리됩니다.")){
			$.ajax({
	 			url : "${pageContext.request.contextPath}/board",
	 			type : "POST",
	 			dataType : "json",
	 			data : {
	 				act : 'changeStatus',
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
	function fnSubmit(boardNo){
		if(confirm("확인을 누르시면 신청됩니다.")){
			$.ajax({
	 			url : "${pageContext.request.contextPath}/board",
	 			type : "POST",
	 			dataType : "json",
	 			data : {
	 				act : 'submitBoard',
	 				boardNo : boardNo
	 			},
	 			success : function(response) {
					alert(response.message);
					location.href="${pageContext.request.contextPath}/page?act=userSchedule"
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

	 // Drawing Manager에서 데이터를 가져와 도형을 표시할 아래쪽 지도 div
	
	var overlays = []; // 지도에 그려진 도형을 담을 배열
 	
	function fnLoadMap(data){
 		var mapContainer = document.getElementById('map'),
	    mapOptions = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

		// 지도 div와 지도 옵션으로 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOptions);
		getDataFromDrawingMap(data, map); 
	}
	
	// 가져오기 버튼을 클릭하면 호출되는 핸들러 함수입니다
	// Drawing Manager로 그려진 객체 데이터를 가져와 아래 지도에 표시합니다
	
	function getDataFromDrawingMap(data, map) {

	    // 아래 지도에 그려진 도형이 있다면 모두 지웁니다
	    removeOverlays();

	    // 지도에 가져온 데이터로 도형들을 그립니다
	    if (data[kakao.maps.drawing.OverlayType.MARKER]) {
	        drawMarker(data[kakao.maps.drawing.OverlayType.MARKER], map);
	    }

	    if (data[kakao.maps.drawing.OverlayType.POLYLINE]) {
	        drawPolyline(data[kakao.maps.drawing.OverlayType.POLYLINE], map);
	    }
	}

	// 아래 지도에 그려진 도형이 있다면 모두 지웁니다
	function removeOverlays() {
	    var len = overlays.length, i = 0;

	    for (; i < len; i++) {
	        overlays[i].setMap(null);
	    }

	    overlays = [];
	}

	// Drawing Manager에서 가져온 데이터 중 마커를 아래 지도에 표시하는 함수입니다
	function drawMarker(markers, map) {
	    var len = markers.length, i = 0;

	    for (; i < len; i++) {
	        var marker = new kakao.maps.Marker({
	            map: map, 
	            position: new kakao.maps.LatLng(markers[i].y, markers[i].x), 
	            zIndex: markers[i].zIndex
	        });

	        overlays.push(marker);
	    }
	}

	// Drawing Manager에서 가져온 데이터 중 선을 아래 지도에 표시하는 함수입니다
	function drawPolyline(lines, map) {
	    var len = lines.length, i = 0;

	    for (; i < len; i++) {
	        var path = pointsToPath(lines[i].points);
	        var style = lines[i].options;
	        var polyline = new kakao.maps.Polyline({
	            map: map,
	            path: path,
	            strokeColor: style.strokeColor,
	            strokeOpacity: style.strokeOpacity,
	            strokeStyle: style.strokeStyle,
	            strokeWeight: style.strokeWeight
	        });

	        overlays.push(polyline);
	    }
	}

	// Drawing Manager에서 가져온 데이터 중 
	// 선과 다각형의 꼭지점 정보를 kakao.maps.LatLng객체로 생성하고 배열로 반환하는 함수입니다 
	function pointsToPath(points) {
	    var len = points.length, 
	        path = [], 
	        i = 0;

	    for (; i < len; i++) { 
	        var latlng = new kakao.maps.LatLng(points[i].y, points[i].x);
	        path.push(latlng); 
	    }

	    return path;
	}   
	</script>
</body>

</html>