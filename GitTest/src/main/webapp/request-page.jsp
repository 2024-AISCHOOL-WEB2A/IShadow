<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.aischool.model.Qa" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1920, maximum-scale=1.0" />
    <link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
    <meta name="og:type" content="website" />
    <meta name="twitter:card" content="photo" />
    <link rel="stylesheet" type="text/css" href="assets/css/request-page.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
    <style>
      @font-face {
        font-family: 'Maplestory Bold';
        src: url('assets/font/Maplestory Light.ttf') format('truetype');
      }
      body {
        font-family: 'Maplestory Bold', sans-serif;
      }
      .uploadbtn {
        display: inline;
        width: 114px;
        height: 50px;
        margin: 664   px auto;
        background-color: #ffffff;
        color: white;
        font-size: 18px;
        border: none;
        border-radius: 30px;
        cursor: pointer;
        position: relative;
        z-index: 1000;
        left:1499px;
        top:663px;
        opacity:80%;
        color:#000000;
        
        
      }
      .uploadbtn:hover {
        background-color: #45a049;
      }
    </style>
    <script type="text/javascript">
        function redirectToUpload() {
            window.location.href = 'request-page-upload.jsp';
        }
    </script>
</head>
<body style="margin: 0">
  
    <input type="hidden" id="anPageName" name="page" value="request-page" />
    <div class="container-center-horizontal">
      <div class="request-page screen">
        <div class="overlap-group8">
        
          <img
            class="create-a-high-resolu"
            src="assets/img/background.png"
            alt="Create a high-resolution illustration for a presentation thumbnail with a _The L s-1584004691 1"
          />
            <%@ include file="header.jsp"%>
            
          <div class="rectangle-355">
            <div class="table-header">
              <div class="header-item">게시글 번호</div>
              <div class="header-item">제목</div>
              <div class="header-item">Date</div>
              <div class="header-item">user name</div>
            </div>
            <% 
                List<Qa> listQA = (List<Qa>) request.getAttribute("listQA");
                if (listQA != null && !listQA.isEmpty()) {
                  for (Qa qa : listQA) {
            %>
            <div class="group-2613114">
              <div class="overlap-group2">
                <div class="number"><%= qa.getQa_idx() %></div>
                <div class="text-7"><%= qa.getQa_title() %></div>
                <div class="date"><%= qa.getQa_d_at() %></div>
                <div class="user-name"><%= qa.getU_id() %></div>
              </div>
            </div>
            <% 
                  }
                } else {
                  out.println("<div>No data found</div>");
                }
            %>
          </div>
          
          <!-- 새로운 버튼 추가 -->
           <div><input type="button" class="uploadbtn" name="uploadbtn" value="업로드" onclick="redirectToUpload()"></div>
          
          <h1 class="text-1">해줘요</h1>

          <div class="group-2613114">
            <div class="overlap-group2">
              <img class="rectangle-325" src="assets/img/request_page/rectangle-325.svg" alt="Rectangle 325" />
              <div class="text-6 Maplestory-bold-white-30px">게시글 번호</div>
              <div class="text-7 Maplestory-normal-black-50px">아기상어 넣어줘요</div>
              <div class="number Maplestory-bold-black-48px">1</div>
              <div class="nlnh Maplestory-bold-black-48px">NLNH</div>
              <div class="text-8 Maplestory-bold-white-48px">제목</div>
              <div class="user-name Maplestory-bold-white-20px">user&nbsp;&nbsp;name</div>
            </div>
            <div class="overlap-group7">
              <div class="number-1 number-7 Maplestory-bold-black-48px">2</div>
              <div class="text-9 Maplestory-normal-black-48px">공룡도 보고싶어요</div>
              <div class="shs Maplestory-bold-black-48px">SHS</div>
            </div>
            <div class="overlap-group1">
              <div class="rectangle-333"></div>
              <div class="place-1 Maplestory-bold-black-48px">GUJO</div>
              <div class="text-10 Maplestory-normal-black-48px">금도끼 은도끼 넣어주세요</div>
              <div class="number-2 number-7 Maplestory-bold-black-48px">3</div>
            </div>
            <div class="overlap-group4">
              <img class="rectangle-335" src="assets/img/request_page/rectangle-331.svg" alt="Rectangle 335" />
              <div class="text-11 Maplestory-normal-black-48px">동물들도 있을까요?</div>
              <div class="gjgj Maplestory-bold-black-48px">GJGJ</div>
              <div class="number-3 number-7 Maplestory-bold-black-48px">4</div>
            </div>
            <div class="overlap-group3">
              <div class="number-4 number-7 Maplestory-bold-black-48px">5</div>
              <div class="text-14 Maplestory-normal-black-48px">굿즈도 있나요?</div>
              <div class="config Maplestory-bold-black-48px">CONFIG</div>
            </div>
            <div class="overlap-group6">
              <div class="number-5 number-7 Maplestory-bold-black-48px">6</div>
              <div class="text-13 Maplestory-normal-black-48px">어린이 동요도 해주세요</div>
              <div class="pong Maplestory-bold-black-48px">PONG</div>
            </div>
            <div class="overlap-group5">
              <div class="number-6 number-7 Maplestory-bold-black-48px">7</div>
              <div class="text-12 Maplestory-normal-black-48px">호랑이 손모양 궁금해요</div>
              <div class="shadow Maplestory-bold-black-48px">SHADOW</div>
            </div>
          </div>
          <div class="date Maplestory-bold-black-20px">23/12/2023</div>
          <div class="date-1 date-7 Maplestory-bold-black-32px">23/01/2024</div>
          <div class="date-2 date-7 Maplestory-bold-black-32px">02/02/2024</div>
          <div class="date-3 date-7 Maplestory-bold-black-32px">11/02/2024</div>
          <div class="date-4 date-7 Maplestory-bold-black-32px">23/02/2024</div>
          <div class="date-5 date-7 Maplestory-bold-black-32px">22/05/2024</div>
          <div class="date-6 date-7 Maplestory-bold-black-32px">23/07/2024</div>

        </div>
      </div>
    </div>
</body>
</html>
