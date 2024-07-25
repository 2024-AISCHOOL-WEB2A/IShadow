<%@page import="com.aischool.model.Stories"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script>
      async function init() {
        const video = document.createElement('video');
        video.setAttribute('autoplay', '');
        video.setAttribute('playsinline', '');

        const constraints = {
          video: {
            width: 700, /* Adjusted size to match the red circle */
            height: 700, /* Adjusted size to match the red circle */
            facingMode: 'user'
          }
        };

        try {
          const stream = await navigator.mediaDevices.getUserMedia(constraints);
          video.srcObject = stream;
          document.getElementById('webcam-container').appendChild(video);
        } catch (err) {
          console.error('Error accessing webcam:', err);
        }
      }
      
      $index = sessionStorage.getItem('index');
    </script>
  </head>
  <body onload="init()">
    <div class="container">
      <!-- header -->
      <%@ include file="header.jsp" %>
      <div class="circles">
        <div class="circle" id="story-quiz">
          <!-- 동화에 대한 문제 화면을 여기에 추가 -->
        <% 
			ArrayList<Stories> choicedStory = (ArrayList<Stories>)session.getAttribute("choicedStory");
			if(session.getAttribute("index")==null){%>
				<img src="<%=choicedStory.get(0).getStoryImage()%>">	
	    <%  
	    	}else{
	    		int index = (int)session.getAttribute("index");
	    		System.out.println(index + "25일 525");
	    %>	
	    		<img src="<%=choicedStory.get(0).getStoryImage()%>">
        <%  }%>
        </div>
        <img class="image" src="assets/img/----.svg" alt="image" />
        <div class="circle red">
          <div id="webcam-container"></div>
          <div id="label-container"></div>
        </div>
      </div>
      <div class="buttons">
        <a href="story-ending-page.jsp"><button class="button">넘어 가기</button></a>
      </div>
    </div>
  </body>
</html>
