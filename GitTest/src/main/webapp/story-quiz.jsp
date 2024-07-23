<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
    <meta name="og:type" content="website" />
    <meta name="twitter:card" content="photo" />
    <link rel="stylesheet" type="text/css" href="css/story-quiz.css" />
    <link rel="stylesheet" type="text/css" href="css/styleguide.css" />
    <link rel="stylesheet" type="text/css" href="css/globals.css" />
    <style>
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
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        display: flex;
        gap: 20px;
      }
      .circle {
        width: 300px;
        height: 300px;
        border-radius: 50%;
        background-color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
      }
      .circle.red {
        width: 300px;
        height: 300px;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
        background-color: transparent; /* Remove background color */
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
    </style>
    <script>
      async function init() {
        const video = document.createElement('video');
        video.setAttribute('autoplay', '');
        video.setAttribute('playsinline', '');

        const constraints = {
          video: {
            width: 300,
            height: 300,
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
    </script>
  </head>
  <body onload="init()">
    <div class="container">
      <img class="header-img" src="assets/img/---1.png" alt="아이 Shadow" />
      <div class="nav">
        <div>
          <img src="assets/img/frame-4.svg" alt="동화" />
          <div>동화</div>
        </div>
        <div>
          <img src="assets/img/frame-5.svg" alt="캐치마인드" />
          <div>캐치마인드</div>
        </div>
        <div>
          <img src="assets/img/image-9.png" alt="게시판" />
          <div>게시판</div>
        </div>
        <div>
          <img src="assets/img/image-9-1.png" alt="공유하기" />
          <div>공유하기</div>
        </div>
      </div>
      <div class="circles">
        <div class="circle" id="story-quiz">
          <!-- 동화에 대한 문제 화면을 여기에 추가 -->
          <h3>동화 문제</h3>
          <p>여기에 동화 문제를 추가하세요.</p>
        </div>
        <div class="circle red">
          <div id="webcam-container"></div>
          <div id="label-container"></div>
        </div>
      </div>
      <div class="buttons">
        <button class="button">힌트 보기</button>
        <button class="button">넘어 가기</button>
      </div>
    </div>
  </body>
</html>
