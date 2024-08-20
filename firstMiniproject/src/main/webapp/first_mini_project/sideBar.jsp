<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
</head>

<body>
	<%@ page import="model.User"%>
<% 
String act = request.getParameter("act");
User userSession = (User)session.getAttribute("userSession");
String sessionNick = "";
boolean sessionAuth = false;
if(userSession != null){
	sessionNick = userSession.getNickName()+"님";
	if(userSession.getAuthority().equals("A")){
		sessionAuth = true;
	}
}

	
		
%>
    <aside id="sideBar">
        <div id="profile">
            <span id="sideNick"><%=sessionNick%></span> 환영합니다
            <div id="statusZone">
                오늘도 함께 달려볼까요?
            </div>
            <div id="latestActivity">
                latestActivity
            </div>
            <a href="${pageContext.request.contextPath}/page?act=makeBoard" id="viewMyHistory">
                모임 만들러가기
            </a>
        </div>

        <div id="runTag"class="sideTagZone" style="background-color: white;">
            <img class="tagIcon" src="${pageContext.request.contextPath}/first_mini_project/src/icon/icon_shoe.png" alter="shoeImage">
        </div>
        <div id="cycleTag" class="sideTagZone">
            <img class="tagIcon" src="${pageContext.request.contextPath}/first_mini_project/src/icon/icon_bicycle.png" alter="bicycleImage">
        </div>

        <div id="history">
           <!--  <div class="historyBlock">
                <div id="historyArea">historyTitle</div>
                <div id="historyDistance"> 100km</div>
                <div id="eventDate"> 2024.05.06 13:00</div>
            </div>
            <div class="historyBlock">
                <div id="historyArea">historyTitle</div>
                <div id="historyDistance"> 100km</div>
                <div id="eventDate"> 2024.05.06 13:00</div>
            </div>
            <div class="historyBlock">
                <div id="historyArea">historyTitle</div>
                <div id="historyDistance"> 100km</div>
                <div id="eventDate"> 2024.05.06 13:00</div>
            </div>
            <div class="historyBlock">
                <div id="historyArea">historyTitle</div>
                <div id="historyDistance"> 100km</div>
                <div id="eventDate"> 2024.05.06 13:00</div>
            </div> -->
        </div>
        <div id="trip">
            trip

            <div>
                <span id="distance">0</span> km
            </div>
        </div>
    </aside>
    <script>
    
	function showHistory(sideTag){
			$.ajax({
	 			url : "${pageContext.request.contextPath}/board",
	 			type : "POST",
	 			dataType : "json",
	 			data : {
	 				act : 'sideHistory',
	 				category : sideTag
	 			},
	 			success : function(response) {
	 				if(response.uid != null){
	 					appendHistory(response.historyList);
	 					
	 					
	 					document.querySelector("#distance").innerText = response.trip;
	 					showList();
	 				}
							
	 				
				},
	 			error : function(xhr, status, error) {
	 				console.error("AJAX Error - Status: " + status
	 						+ ", Error: " + error);
	 				console.error("Response Text: " + xhr.responseText);
	 				alert("historyError");
	 			}
	 		}); 

        	    	
	}
function appendHistory(data){
		let container = document.getElementById("history");
		
		container.innerHTML = '';
		var cnt = 0;

		data.forEach(item => {
			if(cnt == 4){
				return;
			}
			const listItem = document.createElement('div');
			listItem.innerHTML = `
				<div class="historyBlock">
	             <div id="historyArea">`+item.title+`</div>
	             <div id="historyDistance">`+item.distance+`</div>
	             <div id="eventDate">`+item.datetime+`</div>
	         </div>
			`;
			container.appendChild(listItem);
			cnt++;
		});
	}

	
	document.querySelector("#runTag").addEventListener("click",showRunTag);
    document.querySelector("#cycleTag").addEventListener("click",showCycleTag);
    
    <%if(userSession != null){%>
    	if('<%=userSession.getFavor()%>' === 'C'){
    		showCycleTag();
    	} else{
    		showRunTag();
    	}
    <%}else {%>
    	showRunTag();
    <%}%>
	function showRunTag(){
    	document.querySelector("#runTag").style.backgroundColor = 'white';
    	document.querySelector("#cycleTag").style.backgroundColor = '#eee';
        showHistory('R');
	}    
    function showCycleTag(){
    	document.querySelector("#cycleTag").style.backgroundColor = 'white';
    	document.querySelector("#runTag").style.backgroundColor = '#eee';
        showHistory('C');
    }
    if(<%=sessionAuth%>){
    	var adminPage = document.querySelector("#latestActivity")
    	adminPage.innerHTML = ''
    	adminPage.innerHTML = '<a id="toAuthPage" href="${pageContext.request.contextPath}/page?act=userList">회원 관리 페이지</a>'
    }
    
    </script>
</body>

</html>