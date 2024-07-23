<%@page import="com.aischool.model.Games"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=1440, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/catchmind.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
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
#loading {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 1.5em;
    color: #333;
}
.view {
    position: relative;
    width: 48.26vw;
    height: 48.26vw;
    margin: auto;
    border-radius: 50%;
    overflow: hidden;
    clip-path: circle(50%);
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
    top: 80%;
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
    transition: width 1s linear;
}
.time-display {
    position: absolute;
    width: 100%;
    text-align: center;
    font-size: 1.5em;
    color: #000;
    top: -30px;
}
#quizCompleted {
    display: none;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 2em;
    color: #dc3545;
    background: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 10px;
    z-index: 10;
}
/* 기본 상태 (어두운 색상) */
.rectangle-dark {
    filter: grayscale(100%) brightness(50%);
    transition: filter 0.5s;
}

/* 원래 상태 (원래 색상) */
.rectangle-light {
    filter: grayscale(0%) brightness(100%);
    transition: filter 0.5s;
}
@keyframes fadeOut {
    0% { opacity: 1; }
    100% { opacity: 0; }
}
</style>
</head>
<body style="margin: 0; background: #ffffff">
    <input type="hidden" id="anPageName" name="page" value="catchmind" />
    <div class="container-center-horizontal">
        <div class="catchmind screen">
            <div class="overlap-group1">
                <img class="background-2" src="assets/img/background.png" alt="background 2" />
                <!-- header -->
                <%@ include file="header.jsp" %>
                
                <img class="image" src="assets/img/----.svg" alt="image" />
                <!--정답 창-->
                <div class="view">
                    <canvas id="canvas"></canvas>
                    <div id="label-container"></div>
                </div>
                <!--문제 창-->
                <div class="view-1">
                    <img id="quiz-image" src="" alt="quiz image" />
                </div>
                <div id="correctIndicator">Correct!</div>
                <div id="quizCompleted">퀴즈 완료!</div>
                <div class="group-5">
				    <img class="rectangle rectangle-dark" src="assets/img/rectangle-6.png" alt="Rectangle 6" />
				    <img class="rectangle rectangle-dark" src="assets/img/rectangle-6.png" alt="Rectangle 9" />
				    <img class="rectangle rectangle-dark" src="assets/img/rectangle-6.png" alt="Rectangle 7" />
				    <img class="rectangle rectangle-dark" src="assets/img/rectangle-6.png" alt="Rectangle 8" />
				    <img class="rectangle rectangle-dark" src="assets/img/rectangle-6.png" alt="Rectangle 10" />
				</div>
                <div class="rectangle-11">
                    <div class="timer-bar" id="timer-bar"></div>
                    <div class="time-display" id="time-display">0초</div>
                </div>
            </div>
        </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script type="text/javascript">
    let games = [];
    let cnt = 0;
    let timeLeft = 0;
    let timerId;
    const duration = 300; // 타이머 시간 (초)
    let startTime, endTime;
    let currentGameIndex = 0;

    function startTimer() {
      const timerBar = document.getElementById('timer-bar');
      const timeDisplay = document.getElementById('time-display');
      timerId = setInterval(() => {
        timeLeft++;
        updateTimer(timerBar, timeDisplay);
        if (timeLeft >= duration) {
          endQuiz();
        }
      }, 1000);
    }

    function updateTimer(timerBar, timeDisplay) {
      timerBar.style.width = (timeLeft / duration) * 100 + '%';
      timeDisplay.textContent = timeLeft + '초';
    }

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

    const URL = "model/";
    let model, webcam, ctx, labelContainer, maxPredictions;

    async function init() {
        startTimer();
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        model = await tmPose.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // Convenience function to setup a webcam
        const viewElement = document.querySelector('.view');
        const size = { width: viewElement.offsetWidth, height: viewElement.offsetHeight }; // view 크기와 동일하게 설정
        const flip = true; // whether to flip the webcam
        webcam = new tmPose.Webcam(size.width, size.height, flip); // width, height, flip
        await webcam.setup(); // request access to the webcam
        await webcam.play();

        // **추가된 부분: webcam.canvas 크기 조정**
        webcam.canvas.width = size.width;
        webcam.canvas.height = size.height;
        webcam.canvas.style.width = "100%";
        webcam.canvas.style.height = "100%";

        // view 요소에 webcam.canvas 추가
        viewElement.appendChild(webcam.canvas);

        window.requestAnimationFrame(loop);

        // append/get elements to the DOM
        const canvas = document.getElementById("canvas");
        canvas.width = size.width;
        canvas.height = size.height;
        ctx = canvas.getContext("2d");
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));
        }

        // Load the first image
        loadImage();
    }

    async function loop(timestamp) {
        webcam.update(); // update the webcam frame
        await predict();
        window.requestAnimationFrame(loop);
    }

    let correctAnswers = 0;

    function handleCorrectAnswer() {
        const images = document.querySelectorAll('.group-5 .rectangle');
        if (correctAnswers < images.length) {
            images[correctAnswers].classList.remove('rectangle-dark');
            images[correctAnswers].classList.add('rectangle-light');
            correctAnswers++;
        }
    }

    async function predict() {
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

        if (maxProbability > 0.75 && bestMatch.toLowerCase() === games[currentGameIndex].ans.toLowerCase()) {
            currentGameIndex++;
            setTimeout(() => {
                loadImage();
                handleCorrectAnswer();
            }, 2000); // 2초 대기 후 다음 문제로 넘어감
        }

        drawPose(pose);
    }

    function drawPose(pose) {
        if (webcam.canvas) {
            ctx.drawImage(webcam.canvas, 0, 0);
            // draw the keypoints and skeleton
            if (pose) {
                const minPartConfidence = 0.5;
                tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
                tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
            }
        }
    }

    function loadImage() {
        const quizImage = document.getElementById('quiz-image');
        if(currentGameIndex < games.length){
            quizImage.src = games[currentGameIndex].qes;
        }else{
            endQuiz();
        }
    }

    function endQuiz() {
        const quizCompleted = document.getElementById('quizCompleted');
        quizCompleted.style.display = 'block';
        webcam.stop();
        clearInterval(timerId);

        // 퀴즈 종료 시간 저장
        /* endTime = timeLeft; */
        let minue = parseInt(timeLeft / 60);
        let second = parsInt(timeLeft % 60)
        console.log("분:", minue, " 초:", second);
    }

    // Automatically start when the page loads
    window.onload = init;

</script>
</body>
</html>
