<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <aside id="sideBar">
        <div id="profile">
            <span id="name">유성</span>님 안녕하세요
            <div id="statusZone">
                following followers activityCount
            </div>
            <div id="latestActivity">
                latestActivity
            </div>
            <a href="javascript:;" id="viewMyHistory">
                View my activity histories...
            </a>
        </div>

        <div id="sideTagZone" style="background-color: white;">
            <img class="tagIcon" src="src/icon/icon_shoe.png" alter="shoeImage">
        </div>
        <div id="sideTagZone">
            <img class="tagIcon" src="src/icon/icon_bicycle.png" alter="bicycleImage">
        </div>

        <div id="history">
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
            </div>
            <div class="historyBlock">
                <div id="historyArea">historyTitle</div>
                <div id="historyDistance"> 100km</div>
                <div id="eventDate"> 2024.05.06 13:00</div>
            </div>
        </div>
        <div id="trip">
            trip

            <div>
                <span id="distance">1000.0</span> km
            </div>
        </div>
    </aside>
</body>

</html>