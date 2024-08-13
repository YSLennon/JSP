<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="src/layout/layout.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

    <section id="detVwContainer">
        <div id="titleBlock">
            <div id="listTitle">Title</div>
            <div id="boardInfo">
                <div id="organizer" style="margin-left: 150px;">organizer</div>
                <div id="cdatetime">2024.05.06 13:00 작성일자</div>
            </div>

        </div>
        <div class="mainBlock">
            <div id="map">

            </div>

            <div id="tagZone">
                <div class="tagBlock">Ride</div>
                <div class="tagBlock">NowMember</div>
                <div class="tagBlock">2024.05.06 13:00 </div>
            </div>

            <div id="contentsBlock">
                이것은 컨텐츠입니다
            </div>

        </div>
    </section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>