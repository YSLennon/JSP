<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .popup-wrap {
            background-color: rgba(0, 0, 0, .7);
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            display: none;
            padding: 15px;
        }

        .popup {
            width: 100%;
            max-width: 400px;
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            background-color: #00462A;
            box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, .3);
            margin: auto;
        }

        .body-contentbox {
            word-break: break-word;
            overflow-y: auto;
            min-height: 50px;
            max-height: 200px;
            text-align: center;
        }

        .popup-foot {
            width: 100%;
            height: 50px;
        }

        .pop-btn {
            display: inline-flex;
            width: 49.5%;
            height: 100%;
            float: left;
            justify-content: center;
            align-items: center;
            color: #000000;
            cursor: pointer;
            border-top: 1px solid #000000;
        }

        .pop-btn.confirm {
            border-right: 1px solid #000000;
        }
        
    </style>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<body>
    <div class="container">
        <div class="modal-btn-box">
            <button type="button" id="modal-open">모달창 열기</button>
        </div>
        
        <div class="popup-wrap" id="popup">
            <div class="popup">
                <div class="body-contentbox">
                    <p>입력하실 제품의 이름을 입력하세요</p><br>
                    <input type="text" placeholder="검색어 입력"
                        style="font-size: 15px; width: 180px; height:30px; margin-right: 5px;"> <br>
                    <p>본인에게 해당 제품의 적합여부를 입력하세요</p>
                </div>
            </div>
            <div class="popup-foot">
                <span class="pop-btn confirm" id="confirm">적합</span>
                <span class="pop-btn close" id="close">부적합</span>
            </div>
        </div>
    </div>
    </div>
</body>

</html>
<script>
     function disableScroll() {
    // body 요소의 overflow를 hidden으로 변경하여 스크롤 비활성화
    document.body.style.overflow = 'hidden';
    }

    function enableScroll() {
    // body 요소의 overflow를 다시 visible로 변경하여 스크롤 활성화
    document.body.style.overflow = 'visible';
    }
    $(function(){
      $("#confirm").click(function(){
          //모달 닫기 함수 호출
          modalClose();
          enableScroll();
          //컨펌 이벤트 처리
      });
      $("#modal-open").click(function(){        
          $("#popup").css('display','flex').hide().fadeIn();
          disableScroll();
          //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
      });
      $("#close").click(function(){
          modalClose(); //모달 닫기 함수 호출
          enableScroll();
      });
      function modalClose(){
          $("#popup").fadeOut(); //페이드아웃 효과
      }
    });
</script>