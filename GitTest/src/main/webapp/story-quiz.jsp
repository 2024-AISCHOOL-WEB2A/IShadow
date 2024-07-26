<%@page import="com.aischool.model.Stories"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<Stories> choicedStory = (ArrayList<Stories>)session.getAttribute("choicedStory"); 
int story_idx = 0;
if (choicedStory != null && !choicedStory.isEmpty()) {
    if (request.getParameter("story_idx") != null) {
        story_idx = Integer.parseInt(request.getParameter("story_idx"));
    }
}
%>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
    <meta name="og:type" content="website" />
    <meta name="twitter:card" content="photo" />
    <link rel="stylesheet" type="text/css" href="css/story-quiz.css" />
    <link rel="stylesheet" type="text/css" href="css/styleguide.css" />
    <link rel="stylesheet" type="text/css" href="css/globals.css" />
    <style>
      html, body {
        overflow: hidden; /* Disable scroll */
        margin: 0; /* Remove default margin */
        padding: 0; /* Remove default padding */
        height: 100%; /* Ensure body takes full height */
      }
      .container {
        position: relative;
        text-align: center;
        color: white;
        width: 100%;
        height: 100vh;
        background: url('assets/img/background.png') no-repeat center center;
        background-size: cover;
      }
      .header-img {
        position: absolute;
        top: 10px;
        left: 20px;
        width: 150px;
        height: auto;
      }
      .nav {
        position: absolute;
        top: 10px;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        gap: 20px;
      }
      .nav img {
        width: 50px;
        height: 50px;
      }
      .nav div {
        display: flex;
        flex-direction: column;
        align-items: center;
        font-size: 14px;
      }
      .circles {
        position: absolute;
        top: 55%;
        left: 50%;
        transform: translate(-50%, -50%);
        display: flex;
        gap: 0px; /* No gap between the elements */
        align-items: center;
      }
      .circle {
        width: 400px; /* Adjusted size */
        height: 400px; /* Adjusted size */
        border-radius: 50%;
        background-color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
        margin-top: 150px; /* Move the white circle down */
      }
      .circle.red {
        width: 620px; /* Adjusted size */
        height: 620px; /* Adjusted size */
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
        background-color: red;
        margin-top: 0px; /* Ensure red circle is not affected */
      }
      .buttons {
        position: absolute;
        bottom: 20px;
        right: 20px;
        display: flex;
        flex-direction: column;
        gap: 10px;
      }
      .button {
        background-color: #ffd700;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        color: black;
        font-size: 16px;
        cursor: pointer;
      }
      #webcam-container {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
        border-radius: 50%;
      }
      #webcam-container video {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 50%;
      }
      .image {
        width: auto;
        height: 350px; /* Adjust this height as needed */
        margin: 0 -100px; /* Further adjust negative margin to move the image closer to the circles */
      }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
    <script type="text/javascript">
    const URL = "model/";
    let model, webcam, ctx, labelContainer, maxPredictions;

    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        model = await tmPose.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        const size = 620; // Size of the red circle
        const flip = true; 
        webcam = new tmPose.Webcam(size, size, flip); 
        await webcam.setup(); 
        await webcam.play();
        window.requestAnimationFrame(loop);

        const webcamContainer = document.getElementById("webcam-container");
        const canvas = document.createElement("canvas");
        canvas.width = size;
        canvas.height = size;
        canvas.style.width = "100%";
        canvas.style.height = "100%";
        webcamContainer.appendChild(canvas);

        ctx = canvas.getContext("2d");
        /* 라벨은 필요 없어서 일단 주석 */
        /* labelContainer = document.getElementById("label-container");
            if (labelContainer) {
                for (let i = 0; i < maxPredictions; i++) { 
                    labelContainer.appendChild(document.createElement("div"));
                }
            } */
        
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

       /*  for (let i = 0; i < maxPredictions; i++) {
        	// 정확도가 75% 이상인 클래스 찾기
            if (prediction[i].probability >= 0.75) {
                highConfidenceClass = prediction[i].className;
            } */
                /* 라벨은 필요 없어서 일단 주석 */
            /* const classPrediction = prediction[i].className 
            + ": " + prediction[i].probability.toFixed(2);
             labelContainer.childNodes[i].innerHTML = classPrediction;  */
        }
        for (let i = 0; i < maxPredictions; i++) {

            if (prediction[i].probability > maxProbability) {
                maxProbability = prediction[i].probability;
                bestMatch = prediction[i].className;
            }
        }

        drawPose(pose);
        
        const story_answer = <%=choicedStory.get(story_idx).getAnser()%>;
        if (maxProbability > 0.75 && bestMatch.toLowerCase() === story_answer.toLowerCase()) {
        	window.location.href = "story-ending-page.jsp";
        }
     // 정확도가 75% 이상인 클래스가 존재하고, 해당 클래스의 이름이 story_answer와 같다면 다음 페이지로 이동
        <%-- const story_answer = <%=choicedStory.get(story_idx).getAnser()%>; // 정답 클래스 이름을 여기에 입력
        if (highConfidenceClass && highConfidenceClass === story_answer) {
            window.location.href = "story-ending-page.jsp";
        } --%>
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
    </script>
  </head>
  <body onload="init()">
    <div class="container">
      <!-- header -->
      <%@ include file="header.jsp" %>
      <div class="circles">
        <div class="circle" id="story-quiz">
          <!-- 동화에 대한 문제 화면을 여기에 추가 -->
          
			<img src="<%= choicedStory.get(story_idx).getStoryImage() %>">	
        </div>
        <img class="image" src="assets/img/----.svg" alt="image" />
        <div class="circle red">
          <div id="webcam-container">
          </div>
          
          <!-- <div id="label-container"></div>
        </div> 라벨은 필요 없어서 일단 주석-->
      </div>
      <div class="buttons">
        <a href="story-ending-page.jsp"><button class="button">넘어 가기</button></a>
      </div>
    </div>
  </body>
</html>
