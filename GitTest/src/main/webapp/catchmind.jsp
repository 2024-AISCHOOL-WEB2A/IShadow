<%@page import="com.aischool.model.Games"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1440, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png"
	href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/catchmind.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
.html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	width: 100%;
	overflow: hidden;
}

.quiz img {
	max-width: 100%;
	height: auto;
}

canvas {
	display: block;
	margin: auto;
	border-radius: 50%;
	clip-path: circle(50%);
}

.correct {
	background-color: #d4edda;
	transition: background-color 0.5s;
}

.view {
	position: relative;
	width: 48.26vw;
	height: 48.26vw;
	margin: auto;
	border-radius: 50%;
	overflow: hidden;
	clip-path: circle(50%);
	top: 10vw;
}

.view canvas {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

.view-1 {
	position: absolute;
	width: 20%;
	height: 20%;
	top: 100%;
	left: 10%;
	background-color: #e0e0e0;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.view-1 img {
	max-width: 80%;
	max-height: 80%;
	object-fit: contain;
	border-radius: 20px;
}

.group-5 {
	position: absolute;
	width: 30%;
	height: 10%;
	top: 10%;
	left: 10%;
	display: flex;
	justify-content: space-around;
}

.rectangle {
	width: 18%;
	height: auto;
}

.rectangle-11 {
	position: absolute;
	width: 40%;
	height: 5%;
	top: 15%;
	left: 10%;
	background-color: #ffffff80;
	border-radius: 10px;
	overflow: hidden;
}

.timer-bar {
	height: 100%;
	background-color: #ff0000;
	transition: width 0.1s linear;
}

.time-display {
	position: absolute;
	width: 100%;
	text-align: center;
	font-size: 1.5em;
	color: #000;
	top: -30px;
}

.rectangle-dark {
	filter: grayscale(100%) brightness(50%);
	transition: filter 0.5s;
}

.rectangle-light {
	filter: grayscale(0%) brightness(100%);
	transition: filter 0.5s;
}

@
keyframes fadeOut { 0% {
	opacity: 1;
}

100
%
{
opacity
:
0;
}
}
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
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal-content {
	background-color: #001f3f;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 400px;
	text-align: center;
	border-radius: 10px;
}

.modal-content p {
	color: #fff;
	font-size: 2em;
	margin: 0;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.input-container {
	margin-top: 20px;
	text-align: center;
}

.input-container input {
	width: 80%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

.input-container input[type="submit"] {
	margin-top: 10px;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background-color: #007bff;
	color: white;
	cursor: pointer;
}

#loading {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 1.5em;
	color: #333;
}

#toggleButton {
    position: absolute;
    top: 75%;
    left: 5%;
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
</style>
</head>
<body style="margin: 0; background: #ffffff">
	<input type="hidden" id="anPageName" name="page" value="catchmind" />
	
	<div class="container-center-horizontal">
		<div class="catchmind screen">
			<div class="overlap-group1">
			<%@ include file="header.jsp"%>
				<img class="background-2" src="assets/img/background.png"
					alt="background 2" />
				<img class="image" src="assets/img/----.svg" alt="image" />
				<div class="view">
					<div id="loading">로딩 중...</div>
					<canvas id="canvasOutput" willReadFrequently="true"></canvas>
					<canvas id="canvas" willReadFrequently="true"></canvas>
					<div id="label-container"></div>
				</div>
				<button id="toggleButton" onclick="toggleTransform()">Toggle Transform</button>
				<div class="view-1">
					<img id="quiz-image" src="" alt="quiz image" style="display: none;" />
				</div>
				<div class="group-5">
					<img class="rectangle rectangle-dark"
						src="assets/img/catchmind/rectangle-6.png" alt="Rectangle 6" /> <img
						class="rectangle rectangle-dark"
						src="assets/img/catchmind/rectangle-6.png" alt="Rectangle 9" /> <img
						class="rectangle rectangle-dark"
						src="assets/img/catchmind/rectangle-6.png" alt="Rectangle 7" /> <img
						class="rectangle rectangle-dark"
						src="assets/img/catchmind/rectangle-6.png" alt="Rectangle 8" /> <img
						class="rectangle rectangle-dark"
						src="assets/img/catchmind/rectangle-6.png" alt="Rectangle 10" />
				</div>
				<div class="rectangle-11">
					<div class="timer-bar" id="timer-bar"></div>
					<div class="time-display" id="time-display">0초</div>
				</div>
			</div>
		</div>
	</div>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<p id="modal-time-display">00m 00s</p>
			<div class="input-container">
				<form action="InsertRanking" method="post" id="rankingForm">
					<!--required는 필수 입력-->
					<input type="text" placeholder="닉네임을 입력하세요." name="nickName"
						required> <input type="hidden" id="hidden-time"
						name="hiddenTime"> <input type="submit" value="등록">
				</form>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
    <script async src="https://docs.opencv.org/4.x/opencv.js"></script>

<script type="text/javascript">
    // 게임 관련 변수들 초기화
    let games = [];
    let cnt = 0;
    let timeLeft = 0;
    let timerId;
    let duration = 1000; // 타이머 시간 (초)
    let currentGameIndex = 0;
    let gameEnded = false;
    let transformEnabled = false;

    // 서버로부터 전달된 게임 리스트를 자바스크립트 배열로 변환
    <% Games game;
    ArrayList<Games> gamesList = (ArrayList<Games>) request.getAttribute("games");
    for (int i = 0; i < gamesList.size(); i++) {
        game = gamesList.get(i); %>
        games.push({
            id: <%= game.getIdx() %>,
            qes: "<%= game.getQes_img() %>",
            ans: "<%= game.getAns() %>"
        });
    <% } %>

    // 타이머 시작 함수
    function startTimer() {
        const timerBar = document.getElementById('timer-bar');
        const timeDisplay = document.getElementById('time-display');

        // 타이머 바의 초기 너비를 0%로 설정
        timerBar.style.width = '0%';

        // 타이머 동작
        timerId = setInterval(() => {
            if (!gameEnded) {
                timeLeft += 0.1; // 100밀리초마다 0.1초씩 증가
                updateTimer(timerBar, timeDisplay);
            }
        }, 100);
    }
    
    let videoInput; // videoInput 변수를 전역으로 선언

    function onOpenCvReady() {
        console.log("OpenCV.js is ready."); // OpenCV.js가 로드된 것을 확인
        const canvasOutput = document.getElementById('canvasOutput');
        const canvas = document.getElementById('canvas');
        if (!canvasOutput || !canvas) {
            console.error("Canvas element not found!");
            return;
        }

        // 웹캠 스트림을 설정
        navigator.mediaDevices.getUserMedia({ video: { width: 640, height: 480 } })
            .then(function(stream) {
                videoInput = document.createElement('video');
                videoInput.width = 640;
                videoInput.height = 480;
                videoInput.srcObject = stream;
                videoInput.play();
                videoInput.onloadedmetadata = function() {
                    console.log("Video metadata loaded."); // 비디오 메타데이터가 로드된 것을 확인
                    init(); // 초기화 함수 호출
                };
            })
            .catch(function(err) {
                console.log("An error occurred: " + err);
            });
    }

    // 타이머 업데이트 함수
    function updateTimer(timerBar, timeDisplay) {
        const percentage = (timeLeft / duration) * 100;
        timerBar.style.width = percentage + '%';
        timeDisplay.textContent = Math.floor(timeLeft) + '초';

        // 타이머 바가 100%로 채워지면 퀴즈 종료
        if (percentage >= 100) {
            endQuiz();
        }
    }

    // 모델 및 웹캠 관련 변수들 초기화
    const URL = "model/";
    let model, webcam, ctx, labelContainer, maxPredictions;

    // 모델 초기화 및 웹캠 설정 함수
    async function init() {
        document.getElementById('loading').style.display = 'block';

        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        model = await tmPose.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        const viewElement = document.querySelector('.view');
        const size = { width: viewElement.offsetWidth, height: viewElement.offsetHeight };
        const flip = true;
        webcam = new tmPose.Webcam(size.width, size.height, flip);
        await webcam.setup();
        await webcam.play();

        webcam.canvas.width = size.width;
        webcam.canvas.height = size.height;
        webcam.canvas.style.width = "100%";
        webcam.canvas.style.height = "100%";

        viewElement.appendChild(webcam.canvas);

        window.requestAnimationFrame(loop);

        const canvas = document.getElementById("canvas");
        canvas.width = size.width;
        canvas.height = size.height;
        ctx = canvas.getContext("2d");
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) {
            labelContainer.appendChild(document.createElement("div"));
        }

        loadImage();
        document.getElementById('loading').style.display = 'none';
        startTimer();
    }

    // 웹캠 루프 함수
    async function loop(timestamp) {
        if (!gameEnded) {
            if (transformEnabled) {
                drawTransformedVideo(); // 변환된 영상
            } else {
                drawOriginalVideo(); // 원본 영상
            }
            await predict();
            window.requestAnimationFrame(loop);
        }
    }

    let correctAnswers = 0;

    // 정답 처리 함수
    function handleCorrectAnswer() {
        const images = document.querySelectorAll('.group-5 .rectangle');
        if (correctAnswers < images.length) {
            images[correctAnswers].classList.remove('rectangle-dark');
            images[correctAnswers].classList.add('rectangle-light');
            correctAnswers++;
        }
    }

    // 예측 함수
    async function predict() {
        if (currentGameIndex >= games.length) {
            endQuiz();
            return;
        }

        const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
        const prediction = await model.predict(posenetOutput);

        let maxProbability = 0;
        let bestMatch = "";
        for (let i = 0; i < maxPredictions; i++) {
            const classPrediction = prediction[i].className + ": " + prediction[i].probability.toFixed(2);
            labelContainer.childNodes[i].innerHTML = classPrediction;

            if (prediction[i].probability > maxProbability) {
                maxProbability = prediction[i].probability;
                bestMatch = prediction[i].className;
            }
        }

        // 정답 판별
        if (maxProbability > 0.50 && bestMatch.toLowerCase() === games[currentGameIndex].ans.toLowerCase()) {
            currentGameIndex++;
            setTimeout(() => {
                loadImage();
                handleCorrectAnswer();
            }, 2000);
        }

        drawPose(pose);
    }

    // 원본 영상 그리기 함수
    function drawOriginalVideo() {
        const canvasOutput = document.getElementById('canvasOutput');
        const ctx = canvasOutput.getContext('2d');

        if (videoInput) {
            // 비디오 프레임을 캔버스에 그립니다.
            ctx.drawImage(videoInput, 0, 0, canvasOutput.width, canvasOutput.height);
        }
    }

    // 변환된 영상 그리기 함수
    function drawTransformedVideo() {
        const canvasOutput = document.getElementById('canvasOutput');
        const ctx = canvasOutput.getContext('2d');

        if (videoInput) {
            // 비디오 프레임을 캔버스에 그립니다.
            ctx.drawImage(videoInput, 0, 0, canvasOutput.width, canvasOutput.height);

            // OpenCV.js를 사용하여 이미지 데이터를 처리합니다.
            const src = cv.imread(canvasOutput);
            const hsv = new cv.Mat();
            const mask = new cv.Mat();
            const kernel = cv.Mat.ones(3, 3, cv.CV_8U);

            // 영상 좌우 반전
            cv.flip(src, src, 1);

            // HSV 색 공간으로 변환
            cv.cvtColor(src, hsv, cv.COLOR_BGR2HSV);

            // 피부색 범위 설정 (HSV)
            let lower_skin = new cv.Mat(hsv.rows, hsv.cols, hsv.type(), [0, 20, 70, 0]);
            let upper_skin = new cv.Mat(hsv.rows, hsv.cols, hsv.type(), [20, 255, 255, 255]);

            // 피부색에 대한 마스크 생성
            cv.inRange(hsv, lower_skin, upper_skin, mask);

            // 모폴로지 연산을 통해 노이즈 제거 및 손 윤곽 강화
            cv.morphologyEx(mask, mask, cv.MORPH_CLOSE, kernel);
            cv.morphologyEx(mask, mask, cv.MORPH_OPEN, kernel);

            // 윤곽선 찾기
            let contours = new cv.MatVector();
            let hierarchy = new cv.Mat();
            cv.findContours(mask, contours, hierarchy, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE);

            // 빈 화면 생성 (모든 부분이 흰색)
            let hand_shadow = new cv.Mat(canvasOutput.height, canvasOutput.width, cv.CV_8UC3, new cv.Scalar(255, 255, 255));

            // 가장 큰 윤곽선 찾기 (손으로 간주)
            if (contours.size() > 0) {
                let maxContourIndex = 0;
                let maxArea = cv.contourArea(contours.get(0));
                for (let i = 1; i < contours.size(); i++) {
                    let area = cv.contourArea(contours.get(i));
                    if (area > maxArea) {
                        maxArea = area;
                        maxContourIndex = i;
                    }
                }
                if (maxArea > 5000) {  // 노이즈 제거
                    let max_contour = contours.get(maxContourIndex);
                    cv.drawContours(hand_shadow, contours, maxContourIndex, new cv.Scalar(0, 0, 0), -1);
                }
            }

            // 결과 영상 출력
            cv.imshow('canvasOutput', hand_shadow);

            // 메모리 해제
            src.delete();
            hsv.delete();
            mask.delete();
            lower_skin.delete();
            upper_skin.delete();
            contours.delete();
            hierarchy.delete();
            hand_shadow.delete();
            kernel.delete();
        }
    }

    // 포즈 그리기 함수
    function drawPose(pose) {
        const canvasOutput = document.getElementById('canvasOutput');
        const ctx = canvasOutput.getContext('2d');

        if (pose) {
            const minPartConfidence = 0.5;
            tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
            tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
        }
    }

    // 변환 토글 함수
    function toggleTransform() {
        transformEnabled = !transformEnabled;
    }

    // 이미지 로드 함수
    function loadImage() {
        const quizImage = document.getElementById('quiz-image');
        if (currentGameIndex < games.length) {
            quizImage.src = games[currentGameIndex].qes;
            quizImage.style.display = 'block';
        } else {
            endQuiz();
        }
    }

    // 퀴즈 종료 함수
    function endQuiz() {
        gameEnded = true;
        if (webcam && webcam.stream && webcam.stream.getTracks) {
            webcam.stream.getTracks().forEach(track => track.stop());
        }
        clearInterval(timerId);

        // 퀴즈 종료 시간 저장
        const minute = Math.floor(timeLeft / 60);
        const second = Math.floor(timeLeft % 60);
        const formattedTime = minute.toString().padStart(2, '0') + ':' + second.toString().padStart(2, '0'); // "mm:ss" 형식

        // 자바스크립트에서 시간을 "HH:mm:ss" 형식으로 변환
        const timeString = '00:' + formattedTime; // "00:mm:ss" 형식

        // 숨겨진 필드에 시간 설정
        const hiddenTimeInput = document.getElementById('hidden-time');
        hiddenTimeInput.value = timeString;

        setTimeout(() => {
            // 모달 창에 경과 시간 표시
            const modal = document.getElementById('myModal');
            const modalTimeDisplay = document.getElementById('modal-time-display');
            modalTimeDisplay.textContent = formattedTime;

            // 모달 창 열기
            modal.style.display = 'flex';
        }, 1000); // 1초 후에 모달 창 띄우기
    }

    // 모달 닫기 함수
    function closeModal() {
        window.location.href = 'SelectRanking';
    }

    // 페이지 로드 시 초기화 함수 호출
    window.onload = function() {
        // 로딩 중 메시지를 숨기고 퀴즈를 시작합니다.
        document.getElementById('loading').style.display = 'none';
        document.getElementById('myModal').style.display = 'none';
        onOpenCvReady(); // OpenCV가 준비되었을 때 초기화 함수 호출
    }
</script>

</body>
</html>
