<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" type="image/png"
	href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css"
	href="assets/css/white_main-u4370u4458u4358u4455u4523.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
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
	flex-wrap: wrap;
	margin-top: 20px;
}

.view {
	width: 120px;
	height: 120px;
	margin: 10px;
	cursor: pointer;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-color: transparent;
	border: none;
	box-shadow: none;
}

.view img {
	width: 280px;
}

.view-text {
	font-family: 'Maplestory Bold', sans-serif;
	margin-top: 10px;
	text-align: center;
	color: #000000;
}

.link-sns_item {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 200px;
	height: 50px;
	background-color: #000000;
	margin-top: 10px;
	cursor: pointer;
	font-family: 'Maplestory Bold', sans-serif;
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
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
	justify-content: center;
	align-items: center;
}

.modal-content {
	background-color: #ffffff;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	border-radius: 15px;
	width: 80%;
	max-width: 500px;
	text-align: center;
}

.close {
	color: #4bed;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.modal-btn {
	background-color: #4bed;
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
	max-width: 400px margin: auto;
}

.toggle-container {
	position: fixed;
	top: 10px;
	right: 10px;
	display: flex;
	align-items: center;
}

.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
	margin-right: 10px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	transition: 0.4s;
	border-radius: 34px;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	transition: 0.4s;
	border-radius: 50%;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:checked+.slider:before {
	transform: translateX(26px);
}
#theme-label {
    color: #ffffff; /* 흰색 텍스트 */
}

</style>
</head>
<body>
	<input type="hidden" id="anPageName" name="page"
		value="main-u4370u4458u4358u4455u4523" />
	<div class="container-center-horizontal">
		<div class="main-u4370u4458u4358u4455u4523 screen">
			<div class="overlap-group">
				<h1 class="shadow">아이Shadow</h1>

				<!-- 들어가는 버튼 -->
				<div class="view-container">
					<!-- 튜토리얼 -->
					<a href="javascript:void(0);" id="tutorial-btn">
						<div class="view">
							<img src="assets/img/cloud11.png">
							<div class="view-text">튜토리얼</div>
						</div>
					</a>
					<!-- 동화 -->
					<a href="javascript:void(0);" id="story-btn">
						<div class="view">
							<img src="assets/img/cloud22.png">
							<div class="view-text">동화나라</div>
						</div>
					</a>
					<!-- 캐치마인드 -->
					<a href="javascript:void(0);" id="catchmind-btn">
						<div class="view">
							<img src="assets/img/cloud88.png">
							<div class="view-text">게임나라</div>
						</div>
					</a>
					<!-- 게시판 -->
					<a href="WhitePostsSelectAll">
						<div class="view">
							<img src="assets/img/cloud99.png">
							<div class="view-text">자랑나라</div>
						</div>
					</a>
					<!-- QA -->
					<a href="WhiteQaAllSelect">
						<div class="view">
							<img src="assets/img/cloud66.png">
							<div class="view-text">소원나라</div>
						</div>
					</a>
				</div>

			</div>
		</div>
	</div>
<span id="theme-label">Dark Mode</span>
	<!-- 튜토리얼 모달 -->
	<div id="tutorialModal" class="modal">
		<div class="modal-content">

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
			<span class="close">&times;</span> <img
				src="assets/img/main/before_game.gif"
				style="width: 100%; max-width: 400px;" />
			<button class="modal-btn" id="story-confirm-btn">확인</button>
		</div>
	</div>

	<!-- 캐치마인드 모달 -->
	<div id="catchmindModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span> <img
				src="assets/img/main/before_game.gif"
				style="width: 100%; max-width: 400px;" />
			<button class="modal-btn" id="catchmind-confirm-btn">확인</button>
		</div>
	</div>
     <div class="toggle-container">
           <label class="switch">
               <input type="checkbox" id="theme-toggle" checked>
               <span class="slider round"></span>
           </label>
           <span id="theme-label">Light Mode</span>
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
            window.location.href = "white_story-choice.jsp";
        }
        catchmindConfirmBtn.onclick = function() {
            window.location.href = "WhiteGameStart";
        }
    
        document.addEventListener('DOMContentLoaded', (event) => {
            const toggle = document.getElementById('theme-toggle');
            const body = document.body;
            const themeLabel = document.getElementById('theme-label');

            // 로컬 스토리지에서 테마 상태를 가져옴
            const savedTheme = localStorage.getItem('theme');
            
            if (savedTheme) {
                if (savedTheme === 'light') {
                    body.classList.add('light-theme');
                    themeLabel.textContent = 'Light Mode';
                    toggle.checked = true;
                } else {
                    body.classList.add('dark-theme');
                    themeLabel.textContent = 'Dark Mode';
                    toggle.checked = false;
                }
            } else {
                // 기본 테마 설정
                body.classList.add('light-theme');
                themeLabel.textContent = 'Light Mode';
                toggle.checked = true;
            }

            toggle.addEventListener('change', function() {
                if (this.checked) {
                    body.classList.remove('dark-theme');
                    body.classList.add('light-theme');
                    themeLabel.textContent = 'Light Mode';
                    localStorage.setItem('theme', 'light');
                    setTimeout(() => {
                        window.location.href = 'white_main.jsp';
                    }, 500); // 딜레이 추가
                } else {
                    body.classList.remove('light-theme');
                    body.classList.add('dark-theme');
                    themeLabel.textContent = 'Dark Mode';
                    localStorage.setItem('theme', 'dark');
                    setTimeout(() => {
                        window.location.href = 'main.jsp';
                    }, 500); // 딜레이 추가
                }
            });
        });


    </script>
</body>
</html>
