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
    </style>
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
          <h1 class="text-1">해줘요</h1>
          <div class="overlap-group">
            <div class="text-2 valign-text-middle single-linebody-base">게시판</div>
            <div class="group-2613110">
              <div class="group-2613107">
                <img class="frame" src="assets/img/frame.svg" alt="Frame" />
                <img class="image-9" src="assets/img/image-9.png" alt="image 9" />
                <img class="frame-1" src="assets/img/frame-1.svg" alt="Frame" />
                <img class="image-9-1" src="assets/img/image-9-1.png" alt="image 9" />
              </div>
              <div class="text-container single-linebody-base">
                <div class="text-3 valign-text-middle">동화</div>
                <div class="text-4 valign-text-middle">캐치마인드</div>
                <div class="text-5 valign-text-middle">공유하기</div>
              </div>
            </div>
          </div>
         
          <img class="x1" src="assets/img/---1.png" alt="1" />
        </div>
      </div>
    </div>
</body>
</html>
