<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/main-u4370u4458u4358u4455u4523.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" 	/>
<style>
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        width: 100%;
        overflow: hidden;
        background: #000000;
    }
    .container-center-horizontal {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        width: 100%;
    }
    .main-u4370u4458u4358u4455u4523 {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    .overlap-group {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .view-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .view {
        width: 200px;
        height: 50px;
        background-color: #ffffff;
        margin: 10px;
        cursor: pointer;
    }
    .link-sns_item {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 200px;
        height: 50px;
        background-color: #ffffff;
        margin-top: 10px;  /* margin-top 값을 줄여줍니다 */
        cursor: pointer;
    }
    .shadow {
        color: #ffffff;
        font-size: 2em;
    }
    /* Modal styles */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
        justify-content: center;
        align-items: center;
    }
    .modal-content {
        background-color: #d3d3d3; /* 회색 배경색 */
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        border-radius: 15px; /* 둥근 모서리 */
        width: 80%;
        max-width: 500px;
        text-align: center;
    }
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .modal-btn {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 15px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }
    .modal-btn:hover {
        opacity: 0.8;
    }
    .modal-video {
        width: 100%;
        max-width: 400px;
        margin: auto;
    }
</style>
</head>
<body>
    <input type="hidden" id="anPageName" name="page" value="main-u4370u4458u4358u4455u4523" />
    <div class="container-center-horizontal">
        <div class="main-u4370u4458u4358u4455u4523 screen">
            <div class="overlap-group">
                <h1 class="shadow">아이Shadow</h1>
                
                <!-- 들어가는 버튼 -->
                <div class="view-container">
                    <!-- 튜토리얼 -->
                    <a href="javascript:void(0);" id="tutorial-btn">
                        <div class="view"></div>
                    </a>
                    <!-- 동화 -->
                    <a href="javascript:void(0);" id="story-btn">
                        <div class="view"></div>
                    </a>
                    <!-- 캐치마인드 -->
                    <a href="javascript:void(0);" id="catchmind-btn">
                        <div class="view"></div>
                    </a>
                    <!-- 게시판 -->
                    <a href="board_page.jsp">
                        <div class="view"></div>
                    </a>
                    <!-- QA -->
                    <a href="qaAllSelect">
                        <div class="view"></div>
                    </a>
                </div>
                
            </div>
        </div>
    </div>

    <!-- 튜토리얼 모달 -->
    <div id="tutorialModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <video class="modal-video" controls>
                <source src="assets/video/tutorial.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <button class="modal-btn" id="tutorial-confirm-btn">확인</button>
        </div>
    </div>

    <!-- 동화 모달 -->
    <div id="storyModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <img src="assets/img/main/before_game.gif" style="width:100%; max-width:400px;" />
            <button class="modal-btn" id="story-confirm-btn">확인</button>
        </div>
    </div>

    <!-- 캐치마인드 모달 -->
    <div id="catchmindModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <img src="assets/img/main/before_game.gif" style="width:100%; max-width:400px;" />
            <button class="modal-btn" id="catchmind-confirm-btn">확인</button>
        </div>
    </div>

    <script>
        // Get the modals
        var tutorialModal = document.getElementById("tutorialModal");
        var storyModal = document.getElementById("storyModal");
        var catchmindModal = document.getElementById("catchmindModal");

        // Get the buttons that open the modals
        var tutorialBtn = document.getElementById("tutorial-btn");
        var storyBtn = document.getElementById("story-btn");
        var catchmindBtn = document.getElementById("catchmind-btn");

        // Get the <span> elements that close the modals
        var spans = document.getElementsByClassName("close");

        // Get the confirm buttons
        var tutorialConfirmBtn = document.getElementById("tutorial-confirm-btn");
        var storyConfirmBtn = document.getElementById("story-confirm-btn");
        var catchmindConfirmBtn = document.getElementById("catchmind-confirm-btn");

        // When the user clicks the button, open the tutorial modal 
        tutorialBtn.onclick = function() {
            tutorialModal.style.display = "flex";
        }

        // When the user clicks the button, open the story modal 
        storyBtn.onclick = function() {
            storyModal.style.display = "flex";
        }

        // When the user clicks the button, open the catchmind modal 
        catchmindBtn.onclick = function() {
            catchmindModal.style.display = "flex";
        }

        // When the user clicks on <span> (x), close the modal
        for (var i = 0; i < spans.length; i++) {
            spans[i].onclick = function() {
                this.parentElement.parentElement.style.display = "none";
            }
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == tutorialModal) {
                tutorialModal.style.display = "none";
            } else if (event.target == storyModal) {
                storyModal.style.display = "none";
            } else if (event.target == catchmindModal) {
                catchmindModal.style.display = "none";
            }
        }

        // When the user clicks the confirm button, redirect to appropriate page
        tutorialConfirmBtn.onclick = function() {
            tutorialModal.style.display = "none";
        }
        storyConfirmBtn.onclick = function() {
            window.location.href = "story-choice.jsp";
        }
        catchmindConfirmBtn.onclick = function() {
            window.location.href = "GameStart";
        }
    </script>
</body>
</html>
