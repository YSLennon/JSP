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
            <button type="button" id="modal-open">ëª¨ë¬ì°½ ì´ê¸°</button>
        </div>
        <div class="popup-wrap" id="popup">
            <div class="popup">
                <div class="body-contentbox">
                    <p>ìë ¥íì¤ ì íì ì´ë¦ì ìë ¥íì¸ì</p><br>
                    <input type="text" placeholder="ê²ìì´ ìë ¥"
                        style="font-size: 15px; width: 180px; height:30px; margin-right: 5px;"> <br>
                    <p>ë³¸ì¸ìê² í´ë¹ ì íì ì í©ì¬ë¶ë¥¼ ìë ¥íì¸ì</p>
                </div>
            </div>
            <div class="popup-foot">
                <span class="pop-btn confirm" id="confirm">ì í©</span>
                <span class="pop-btn close" id="close">ë¶ì í©</span>
            </div>
        </div>
    </div>
    </div>
</body>

</html>
<script>
     function disableScroll() {
    // body ììì overflowë¥¼ hiddenì¼ë¡ ë³ê²½íì¬ ì¤í¬ë¡¤ ë¹íì±í
    document.body.style.overflow = 'hidden';
    }

    function enableScroll() {
    // body ììì overflowë¥¼ ë¤ì visibleë¡ ë³ê²½íì¬ ì¤í¬ë¡¤ íì±í
    document.body.style.overflow = 'visible';
    }
    $(function(){
      $("#confirm").click(function(){
          //ëª¨ë¬ ë«ê¸° í¨ì í¸ì¶
          modalClose();
          enableScroll();
          //ì»¨í ì´ë²¤í¸ ì²ë¦¬
      });
      $("#modal-open").click(function(){        
          $("#popup").css('display','flex').hide().fadeIn();
          disableScroll();
          //íìì flexìì±ì¼ë¡ ë°ê¿ì¤ í hide()ë¡ ì¨ê¸°ê³  ë¤ì fadeIn()ì¼ë¡ í¨ê³¼
      });
      $("#close").click(function(){
          modalClose(); //ëª¨ë¬ ë«ê¸° í¨ì í¸ì¶
          enableScroll();
      });
      function modalClose(){
          $("#popup").fadeOut(); //íì´ëìì í¨ê³¼
      }
    });
</script>