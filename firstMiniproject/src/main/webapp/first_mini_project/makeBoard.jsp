<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/first_mini_project/src/layout/layout.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb5f78025cfc4a949b7645cd535a0956&libraries=services,clusterer,drawing"></script>
    
</head>
<body>
	<%@ page import="model.User"%>
	<jsp:include page="header.jsp"></jsp:include>
	
<div  class="container closeMod">
	<jsp:include page="sideBar.jsp"></jsp:include>
    <section id="detVwContainer">
    <form name="makeBoardForm">
      <input name="title" id="titleBlock" placeholder="Title">
        <div class="tagZone">
        <button id="startPoint" type="button" onclick="selectOverlay('MARKER')" class="bottomMenu">출발지점</button>
        <button id="makeCourse" type="button" onclick="selectOverlay('POLYLINE')" class="bottomMenu">코스 그리기</button>
        </div>
        
        <div class="mainBlock">
            <div id="map">

            </div>
			<div class="txtAreaBlock">
	            <textarea name="contents" id="contentsArea" placeholder="내용"></textarea>
            </div>
            
            <div class="tagZone">
                <select id="catSelect" name="category" class="bottomMenu">
                	<option value='C'>자전거</option>
                	<option value='R'>달리기</option>
				</select>
				<input name="distance" id="distanceInput" class="bottomMenu" placeholder="예상거리(km)">
				<input name="addr" id="addrInput" class="bottomMenu" placeholder="지역">
                <input name="datetime" id="dateSelect" class="bottomMenu" placeholder="모임날짜: YYYY-MM-DD HH:MI">
                <button type="button" onclick="fnMakeBoard()" class="bottomMenu submitBtn">작성</button>
            </div>
        </div>
    </form>
    </section>
    </div>
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script>
	//makeMap();
	
	var form = document.makeBoardForm;
	<%
	User userSession = (User) session.getAttribute("userSession");
	%>
	
	// Drawing Manager로 도형을 그릴 지도 div
	var drawingMapContainer = document.getElementById('map'),
	    drawingMap = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 변경해야함
	        level: 3 // 지도의 확대 레벨
	    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var drawingMap = new kakao.maps.Map(drawingMapContainer, drawingMap); 

	var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
	    map: drawingMap, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
	    drawingMode: [ // Drawing Manager로 제공할 그리기 요소 모드입니다
	        kakao.maps.drawing.OverlayType.MARKER,
	        kakao.maps.drawing.OverlayType.POLYLINE,
	    ],
	    // 사용자에게 제공할 그리기 가이드 툴팁입니다
	    // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
	    guideTooltip: ['draw', 'drag', 'edit'], 
	    markerOptions: { // 마커 옵션입니다 
	        draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다 
	        removable: true // 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다  
	    },
	    polylineOptions: { // 선 옵션입니다
	        draggable: true, // 그린 후 드래그가 가능하도록 설정합니다
	        removable: true, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
	        editable: true, // 그린 후 수정할 수 있도록 설정합니다 
	        strokeColor: '#39f', // 선 색
	        hintStrokeStyle: 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
	        hintStrokeOpacity: 0.5  // 그리중 마우스를 따라다니는 보조선의 투명도
	    }
	};

	// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
	var manager = new kakao.maps.drawing.DrawingManager(options);

	// 버튼 클릭 시 호출되는 핸들러 입니다
	function selectOverlay(type) {
	    // 그리기 중이면 그리기를 취소합니다
	    manager.cancel();

	    // 클릭한 그리기 요소 타입을 선택합니다
	    manager.select(kakao.maps.drawing.OverlayType[type]);
	    
	}

	
	// showList();
	function showList(){
	<%
		userSession = (User) session.getAttribute("userSession");
		String sessionUid = "";
		if(userSession != null){
			sessionUid = userSession.getUid();
		}
	%>
	}
	function fnMakeBoard(){
		var mapData = manager.getData();
		requestAjaxMessage('makeBoard',mapData);
	}
	function requestAjaxMessage(act, mapData){
		console.log("manager.getData(): "+ mapData);
		console.log(JSON.stringify(mapData));
		$.ajax({
			url : "${pageContext.request.contextPath}/board",
			type : "POST",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType : "json",
			data : {
				act : act,
			    title : form.title.value, 
			    map : JSON.stringify(mapData), 
			    contents : form.contents.value, 
			    category : form.category.value,
			    distance : form.distance.value,
			    addr : form.addr.value,
			    datetime : form.datetime.value
			},
			success : function(response) {
				alert(response.message);
				location.href="${pageContext.request.contextPath}/page?act=searchGroup";
			},
			error : function(xhr, status, error) {
				console.error("AJAX Error - Status: " + status
						+ ", Error: " + error);
				console.error("Response Text: " + xhr.responseText);
				alert("There was an error processing the request.");
			}
		});

	}

	</script>
</body>

</html>