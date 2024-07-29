<%@page import="com.aischool.model.Games"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1440, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/catchmind.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
/* 전체 페이지와 body 설정 */
html, body {
    margin: 0; /* 기본 여백 제거 */
    padding: 0; /* 기본 패딩 제거 */
    height: 100%; /* 높이 100% */
    width: 100%; /* 너비 100% */
    overflow: hidden; /* 스크롤바 숨김 */
}

/* 퀴즈 이미지 스타일 */
.quiz img {
    max-width: 100%; /* 최대 너비 100% */
    height: auto; /* 높이는 자동 조절 */
}

/* 캔버스 스타일 */
canvas {
    display: block; /* 블록 요소로 표시 */
    margin: auto; /* 가운데 정렬 */
    border-radius: 50%; /* 테두리를 둥글게 */
    clip-path: circle(50%); /* 원형으로 자르기 */
}

/* 정답 맞춘 경우의 스타일 */
.correct {
    background-color: #d4edda; /* 배경색 설정 */
    transition: background-color 0.5s; /* 배경색 전환 효과 */
}

/* 웹캠 뷰 컨테이너 스타일 */
.view {
    position: relative; /* 상대 위치 설정 */
    width: 48.26vw; /* 너비 설정 */
    height: 48.26vw; /* 높이 설정 */
    margin: auto; /* 가운데 정렬 */
    border-radius: 50%; /* 테두리를 둥글게 */
    overflow: hidden; /* 넘치는 부분 숨기기 */
    clip-path: circle(50%); /* 원형으로 자르기 */
    top: 10vw; /* 상단 여백 설정 */
}

/* 웹캠 뷰 캔버스 스타일 */
.view canvas {
    width: 100%; /* 너비 100% */
    height: 100%; /* 높이 100% */
    position: absolute; /* 절대 위치 설정 */
    top: 0; /* 상단 여백 0 */
    left: 0; /* 왼쪽 여백 0 */
}

/* 퀴즈 이미지 컨테이너 스타일 */
.view-1 {
    position: absolute; /* 절대 위치 설정 */
    width: 20%; /* 너비 20% */
    height: 20%; /* 높이 20% */
    top: 100%; /* 상단 여백 100% */
    left: 10%; /* 왼쪽 여백 10% */
    background-color: #e0e0e0; /* 배경색 설정 */
    border-radius: 20px; /* 테두리를 둥글게 */
    display: flex; /* 플렉스 박스 설정 */
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
}

/* 퀴즈 이미지 스타일 */
.view-1 img {
    max-width: 80%; /* 최대 너비 80% */
    max-height: 80%; /* 최대 높이 80% */
    object-fit: contain; /* 이미지 비율 유지 */
    border-radius: 20px; /* 테두리를 둥글게 */
}

/* 퀴즈 정답 표시 컨테이너 스타일 */
.group-5 {
    position: absolute; /* 절대 위치 설정 */
    width: 30%; /* 너비 30% */
    height: 10%; /* 높이 10% */
    top: 10%; /* 상단 여백 10% */
    left: 10%; /* 왼쪽 여백 10% */
    display: flex; /* 플렉스 박스 설정 */
    justify-content: space-around; /* 요소 간 공간 분배 */
}

/* 퀴즈 정답 이미지 스타일 */
.rectangle {
    width: 18%; /* 너비 18% */
    height: auto; /* 높이는 자동 조절 */
}

/* 타이머 바 컨테이너 스타일 */
.rectangle-11 {
    position: absolute; /* 절대 위치 설정 */
    width: 40%; /* 너비 40% */
    height: 5%; /* 높이 5% */
    top: 15%; /* 상단 여백 15% */
    left: 10%; /* 왼쪽 여백 10% */
    background-color: #ffffff80; /* 반투명 배경색 */
    border-radius: 10px; /* 테두리를 둥글게 */
    overflow: hidden; /* 넘치는 부분 숨기기 */
}

/* 타이머 바 스타일 */
.timer-bar {
    height: 100%; /* 높이 100% */
    background-color: #ff0000; /* 배경색 설정 */
    transition: width 0.1s linear; /* 너비 전환 효과 */
}

/* 타이머 표시 텍스트 스타일 */
.time-display {
    position: absolute; /* 절대 위치 설정 */
    width: 100%; /* 너비 100% */
    text-align: center; /* 가운데 정렬 */
    font-size: 1.5em; /* 폰트 크기 설정 */
    color: #000; /* 텍스트 색상 설정 */
    top: -30px; /* 상단 여백 설정 */
}

/* 어두운 정답 이미지 필터 효과 */
.rectangle-dark {
    filter: grayscale(100%) brightness(50%); /* 회색조 및 밝기 조절 */
    transition: filter 0.5s; /* 필터 전환 효과 */
}

/* 밝은 정답 이미지 필터 효과 */
.rectangle-light {
    filter: grayscale(0%) brightness(100%); /* 회색조 및 밝기 조절 */
    transition: filter 0.5s; /* 필터 전환 효과 */
}

/* 모달 창 페이드 아웃 효과 */
@keyframes fadeOut {
    0% {
        opacity: 1; /* 초기 투명도 설정 */
    }
    100% {
        opacity: 0; /* 최종 투명도 설정 */
    }
}

/* 모달 창 스타일 */
.modal {
    display: none; /* 기본적으로 숨김 */
    position: fixed; /* 고정 위치 설정 */
    z-index: 1; /* z-index 설정 */
    left: 0; /* 왼쪽 여백 0 */
    top: 0; /* 상단 여백 0 */
    width: 100%; /* 너비 100% */
    height: 100%; /* 높이 100% */
    overflow: auto; /* 넘치는 부분 스크롤 */
    background-color: rgba(0, 0, 0, 0.4); /* 반투명 배경색 */
    display: flex; /* 플렉스 박스 설정 */
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
}

/* 모달 창 컨텐츠 스타일 */
.modal-content {
    background-color: #F4EEFF; /* 배경색 설정 */
    padding: 1.5rem; /* 패딩 크기 줄이기 */
    max-width: 400px; /* 컨테이너 박스의 최대 너비 줄이기 */
    width: 90%; /* 컨테이너 박스의 너비를 화면에 맞추기 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 설정 */
    text-align: center; /* 텍스트 가운데 정렬 */
    border-radius: 15px; /* 모서리 둥글게 설정 */
}

/* 모달 창 내 텍스트 스타일 */
.modal-content p {
    color: #A6B1E1; /* 텍스트 색상 설정 */
    font-size: 5rem; /* 폰트 크기 줄이기 */
    font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 설정 */
    margin: 1rem 0; /* 외부 여백 설정 */
    background-color: #DCD6F7;
    text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}

/* 닫기 버튼 스타일 */
.close {
    color: #aaa; /* 텍스트 색상 설정 */
    float: right; /* 오른쪽 정렬 */
    font-size: 28px; /* 폰트 크기 설정 */
    font-weight: bold; /* 폰트 두께 설정 */
}

/* 닫기 버튼 호버 및 포커스 효과 */
.close:hover, .close:focus {
    color: black; /* 텍스트 색상 설정 */
    text-decoration: none; /* 밑줄 제거 */
    cursor: pointer; /* 커서 모양 설정 */
}

/* 입력 컨테이너 스타일 */
.input-container {
    margin-top: 20px; /* 상단 여백 설정 */
    text-align: center; /* 텍스트 가운데 정렬 */
}

/* 텍스트 입력 필드 스타일 */
.input-container input[type="text"] {
    display: none; /* 기본적으로 숨김 */
    font-size: 0.9rem; /* 폰트 크기 줄이기 */
    min-height: 3%; /* 최소 높이 자동 */
    min-width: 5%; /* 최소 너비 자동 */
    font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 설정 */
    padding: 0.5rem; /* 패딩 설정 */
    border: 1px solid #333333; /* 테두리 설정 */
    border-radius: 5px; /* 모서리 둥글게 설정 */
}

/* 제출 버튼 스타일 */
.input-container input[type="submit"] {
    margin-top: 10px; /* 상단 여백 설정 */
    padding: 10px 20px; /* 패딩 설정 */
    border: none; /* 테두리 없음 */
    border-radius: 5px; /* 모서리 둥글게 설정 */
    background-color: #424874; /* 배경색 설정 */
    color: white; /* 텍스트 색상 설정 */
    cursor: pointer; /* 커서 모양 설정 */
    font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 설정 */
}

/* 입력 안내 텍스트 스타일 */
.text-50 {
    font-size: 1.5rem; /* 폰트 크기 줄이기 */
    min-height: auto; /* 최소 높이 자동 */
    min-width: auto; /* 최소 너비 자동 */
    font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 설정 */
    cursor: pointer; /* 커서 모양 설정 */
}

/* 그룹 컨테이너 스타일 */
.group-2 {
    align-items: center; /* 수직 가운데 정렬 */
    cursor: pointer; /* 커서 모양 설정 */
    display: flex; /* 플렉스 박스 설정 */
    justify-content: center; /* 수평 가운데 정렬 */
    margin: 0.8rem 0; /* 마진 설정 */
    min-width: auto; /* 최소 너비 자동 */
    border-radius: 10px; /* 모서리 둥글게 설정 */
    padding: 0.8rem 1.5rem; /* 패딩 설정 */
}

/* 오버랩 그룹 스타일 */
.overlap-group {
    align-items: center; /* 수직 가운데 정렬 */
    height: auto; /* 높이 자동 */
    min-width: auto; /* 최소 너비 자동 */
    border-radius: 10px; /* 모서리 둥글게 설정 */
    background-color: #333333; /* 배경색 설정 */
    margin-top: 0.8rem; /* 상단 여백 설정 */
    border: 3px solid #FECC6D; /* 테두리 설정 */
    padding: 0.8rem; /* 패딩 설정 */
}

/* 텍스트 스타일 */
.text-49 {
    font-size: 0.9rem; /* 폰트 크기 줄이기 */
    white-space: nowrap; /* 텍스트 줄 바꿈 없음 */
    width: auto; /* 너비 자동 */
    color: #FECC6D; /* 텍스트 색상 설정 */
    font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 설정 */
}

/* 오버랩 스타일 */
.overlap {
    height: 6.7vw; /* 높이 설정 */
    display: flex; /* 플렉스 박스 설정 */
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    border-radius: 10px; /* 모서리 둥글게 설정 */
    padding: 0.8rem; /* 패딩 설정 */
}

/* 오버랩 스타일 (변형) */
.overlap3 {
    background-color: #FF9B50; /* 배경색 설정 */
    display: flex; /* 플렉스 박스 설정 */
    height: 2vw; /* 높이 설정 */
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    border-radius: 10px; /* 모서리 둥글게 설정 */
    padding: 0.8rem; /* 패딩 설정 */
    width: 86px; /* 너비 설정 */
}

/* 기본 텍스트 스타일 */
.text {
    color: #333333; /* 텍스트 색상 설정 */
    font-family: 'Inter', sans-serif; /* 폰트 설정 */
    font-weight: 400; /* 폰트 두께 설정 */
    letter-spacing: 0; /* 자간 설정 */
    line-height: normal; /* 줄 높이 설정 */
    text-align: center; /* 텍스트 가운데 정렬 */
}

/* 헤더 컨테이너 스타일 */
.header-container {
    position: relative; /* 상대 위치 설정 */
    z-index: 10; /* z-index 설정 */
}

/* 입력 컨테이너 스타일 (수정됨) */
.input-container {
    display: flex; /* 플렉스 박스 설정 */
    flex-direction: column; /* 수직 방향 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
}

/* 입력 필드 스타일 (수정됨) */
.input-container .input-field {
    display: none; /* 기본적으로 숨김 */
    font-size: 0.9rem; /* 폰트 크기 설정 */
    font-family: 'Maplestory Bold', sans-serif; /* 폰트 설정 */
    padding: 0.5rem; /* 패딩 설정 */
    border: 1px solid #333333; /* 테두리 설정 */
    border-radius: 5px; /* 모서리 둥글게 설정 */
    width: 100%; /* 너비 설정 */
    text-align: center; /* 텍스트 가운데 정렬 */
}

</style>
</head>
<body style="margin: 0; background: #ffffff">
	<input type="hidden" id="anPageName" name="page" value="catchmind" />

	<div class="container-center-horizontal">
		<div class="catchmind screen">
			<div class="overlap-group1">
				<img class="background-2" src="assets/img/background.png" alt="background 2" /> 
				<img class="image" src="assets/img/----.svg" alt="image" />
				<div class="header-container">
					<%@ include file="header.jsp"%>
				</div>
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
					<img class="rectangle rectangle-dark" src="assets/img/catchmind/rectangle-6.png" alt="Rectangle 6" /> 
					<img class="rectangle rectangle-dark" src="assets/img/catchmind/rectangle-6.png" alt="Rectangle 9" /> 
					<img class="rectangle rectangle-dark" src="assets/img/catchmind/rectangle-6.png" alt="Rectangle 7" /> 
					<img class="rectangle rectangle-dark" src="assets/img/catchmind/rectangle-6.png" alt="Rectangle 8" /> 
					<img class="rectangle rectangle-dark" src="assets/img/catchmind/rectangle-6.png" alt="Rectangle 10" />
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
					<div class="text-50" onclick="showInput()">닉네임을 입력하세요.</div>
					<input type="text" placeholder="닉네임을 입력하세요" name="nickName" class="input-field" onblur="hideInput()" required>
					<input type="hidden" id="hidden-time" name="hiddenTime"> 
					<input type="submit" value="등록">
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
    let duration = 1; // 타이머 시간 (초)
    let currentGameIndex = 0;
    let gameEnded = false;
    let transformEnabled = false;

    // 서버로부터 전달된 게임 리스트를 자바스크립트 배열로 변환
    <%Games game;
request.setCharacterEncoding("UTF-8");
ArrayList<Games> gamesList = (ArrayList<Games>) request.getAttribute("games");
for (int i = 0; i < gamesList.size(); i++) {
	game = gamesList.get(i);%>
        games.push({
            id: <%=game.getIdx()%>,
            qes: "<%=game.getQes_img()%>",
            ans: "<%=game.getAns()%>"
        });
    <%}%>

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

    // 입력 필드와 안내 텍스트 전환 함수
    function showInput() {
        document.querySelector('.text-50').style.display = 'none';
        document.querySelector('.input-field').style.display = 'block';
        document.querySelector('.input-field').focus();
    }
    
    function hideInput() {
        if (document.querySelector('.input-field').value === '') {
            document.querySelector('.input-field').style.display = 'none';
            document.querySelector('.text-50').style.display = 'block';
        }
    }
</script>

</body>
</html>
