<%@page import="com.aischool.model.Games"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Game</title>
<style>
    #timerContainer {
        width: 100%;
        background-color: #f3f3f3;
        border: 1px solid #ccc;
        position: relative;
    }
    #timer {
        height: 30px;
        background-color: #ff0000;
        width: 0;
        transition: width 1s linear;
    }
    #timeDisplay {
        position: absolute;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
        font-size: 1.5em;
        color: #ffffff;
    }
    .quiz img {
        max-width: 100%;
        height: auto;
    }
    canvas {
        display: block;
        margin: auto;
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
</style>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script type="text/javascript">
    const URL = "model/";
    let model, webcam, ctx, labelContainer, maxPredictions;
    let games = [];
    let cnt = 0;
    let timeLeft = 0;
    let timerId;
    let startTime, endTime;

    async function init() {
        document.getElementById("loading").style.display = "block";
        
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        model = await tmPose.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        const size = 320;  // 해상도를 낮춰서 초기화 속도를 높임
        const flip = true;
        webcam = new tmPose.Webcam(size, size, flip);
        await webcam.setup();
        await webcam.play();
        window.requestAnimationFrame(loop);

        const canvas = document.getElementById("canvas");
        canvas.width = size;
        canvas.height = size;
        ctx = canvas.getContext("2d");
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) {
            labelContainer.appendChild(document.createElement("div"));
        }

        startTime = new Date(); // 게임 시작 시간 기록
        loadQuestion();
        timerId = setInterval(updateTimer, 1000);

        document.getElementById("loading").style.display = "none"; // 로딩 화면 숨김
    }

    async function loop(timestamp) {
        webcam.update();
        await predict();
        window.requestAnimationFrame(loop);
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
            document.querySelector('.quiz').classList.add('correct');
            cnt++;
            currentGameIndex++;
            setTimeout(() => {
                document.querySelector('.quiz').classList.remove('correct');
                loadQuestion();
            }, 2000); // 2초 대기 후 다음 문제로 넘어감
        }

        drawPose(pose);
    }

    function updateTimer() {
        let minutes = Math.floor(timeLeft / 60);
        let seconds = timeLeft % 60;
        if (seconds < 10) seconds = '0' + seconds;

        document.getElementById('timeDisplay').textContent = minutes + ':' + seconds;
        document.getElementById('timer').style.width = (timeLeft / 300) * 100 + '%';

        if (timeLeft < 300) {
            timeLeft++;
        } else {
            clearInterval(timerId);
            endQuiz();
        }
    }

    function endQuiz() {
        webcam.stop(); // 웹캠 스트림 중지
        endTime = new Date(); // 게임 종료 시간 기록
        let timeSpent = Math.floor((endTime - startTime) / 1000); // 소요된 시간 (초 단위)
        let minutes = Math.floor(timeSpent / 60);
        let seconds = timeSpent % 60;
        if (seconds < 10) seconds = '0' + seconds;

        document.querySelector('.time').textContent = "소요된 시간: " + minutes + "분 " + seconds + "초";
        document.querySelector('.quiz').innerText = "퀴즈가 종료되었습니다!";
    }

    function loadQuestion() {
        if (currentGameIndex < games.length) {
            document.querySelector('.quiz').innerHTML = "<img src='" + games[currentGameIndex].qes + "'>";
            document.querySelector('.count').innerHTML = cnt + "/" + games.length;
        } else {
            clearInterval(timerId);
            document.querySelector('.count').innerHTML = cnt + "/" + games.length;
            endQuiz();
        }
    }

    function drawPose(pose) {
        if (webcam.canvas) {
            ctx.drawImage(webcam.canvas, 0, 0);
            if (pose) {
                const minPartConfidence = 0.5;
                tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
                tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
            }
        }
    }

    window.onload = init;

    let currentGameIndex = 0;

    <% 
    Games game;
    ArrayList<Games> gamesList = (ArrayList<Games>) request.getAttribute("games");
    for (int i = 0; i < gamesList.size(); i++) {
        game = gamesList.get(i);
    %>
    games.push({
        id: <%= game.getIdx() %>,
        qes: "<%= game.getQes_img() %>",
        ans: "<%= game.getAns() %>"
    });
    <% } %>
</script>
</head>
<body>
    <div id="timerContainer">
        <div id="timer"></div>
        <div id="timeDisplay">00:00</div>
    </div>
    <div class="quiz"></div>
    <div class="count"></div>
    <div class="time"></div> <!-- 소요 시간 표시 영역 -->
    <div id="loading">Loading...</div> <!-- 로딩 메시지 -->
    <canvas id="canvas"></canvas>
    <div id="label-container"></div>
</body>
</html>
