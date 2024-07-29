<%@page import="com.aischool.model.Stories"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<Stories> choicedStory = (ArrayList<Stories>) session.getAttribute("choicedStory");
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
<link rel="shortcut icon" type="image/png"
	href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
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
	position: relative;
	z-index: 2; /* Higher z-index to be on top */
}

#story-quiz {
	z-index: 3; /* Higher z-index to be on top */
}

.image {
	z-index: 1; /* Lower z-index to be below story-quiz */
	width: auto;
	height: 350px; /* Adjust this height as needed */
	margin: 0 -100px;
	/* Further adjust negative margin to move the image closer to the circles */
}

.buttons {
	position: absolute;
	bottom: 5%;
	right: 5%;
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.button, .hintToggle {
	background: none;
	border: none;
	color: white;
	font-family: Arial;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	text-decoration: none;
}

#webcam-container {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
	border-radius: 50%;
	position: absolute;
}

#webcam-container video {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 50%;
}

.storyHint{
	position: absolute;
	display: none;
	width: 70%;
	height: 70%;
	opacity: 50%;
}
.hintToggle{
	position: relative;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
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
            if (prediction[i].probability > maxProbability) {
                maxProbability = prediction[i].probability;
                bestMatch = prediction[i].className;
            }
        }

        drawPose(pose);

        const story_answer = "<%=choicedStory.get(story_idx).getAnser()%>"; 
        if (maxProbability > 0.75 && bestMatch.toLowerCase() === story_answer.toLowerCase()) {
            // 화면전환이 너무 빨리 돼서 일단 맞췄다는 는낌을 배견색으로 주고 2초 지연 후 화면 전환
            document.querySelector(".circle").style.backgroundColor = "red";

            setTimeout(() => {
                goToNext();
            }, 2000);  
        }
    }

    function goToNext() {
        let form = document.createElement("form");
        form.method = "POST";
        
        let input = document.createElement("input");
        input.type = "hidden";
        input.name = "story_idx";
        <%if (choicedStory.get(story_idx).getNext_story_idx() != choicedStory.get(0).getIdx()) {
	int story_next_idx = story_idx + 1;%>
            form.action = "video.jsp";
            input.value = <%=story_next_idx%>;
        <%} else {%>
            form.action = "story-ending-page.jsp";
            input.value = 0;
        <%}%>
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }

    function skipQuestion() {
        goToNext();
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
    function hintToggle() {
        let toggle = document.querySelector(".storyHint");
      //toggle.style.display가 초기 상태에서는 인라인 스타일로 설정되지 않기 때문에 처음 버튼을 누르면 ""가 나옴
        if (toggle.style.display === "none" || toggle.style.display === "") {
            toggle.style.display = "block";
        } else {
            toggle.style.display = "none";
        }
    }
</script>
</head>
<body onload="init()">
	<div class="container">
		<%@ include file="header.jsp"%>
		<div class="circles">
			<div class="circle" id="story-quiz">
				<img src="<%=choicedStory.get(story_idx).getStoryImage()%>">
			</div>
			<img class="image" src="assets/img/----.svg" alt="image" />
			<div class="circle red">
				<div id="webcam-container"></div>
				<img class="storyHint" src="<%=choicedStory.get(story_idx).getHint()%>">
			</div>
		</div>
		<div class="buttons">
			<button class="button" onclick="skipQuestion()">넘어 가기</button>
			<button class="hintToggle" onclick="hintToggle()">힌트보기</button>
		</div>
	</div>
</body>
</html>
