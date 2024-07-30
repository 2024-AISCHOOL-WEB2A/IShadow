<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.aischool.model.Qa" %>
<%@ page import="com.aischool.model.QaDAO" %>
<%
    int qa_idx = Integer.parseInt(request.getParameter("qa_idx"));
    QaDAO qaDAO = new QaDAO();
    Qa qa = qaDAO.selectQaById(qa_idx);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1920, maximum-scale=1.0" />
    <link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
    <meta name="og:type" content="website" />
    <meta name="twitter:card" content="photo" />
    <link rel="stylesheet" type="text/css" href="assets/css/request-page-post.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
    <style>
        @font-face {
            font-family: 'Maplestory Bold';
            src: url('assets/font/Maplestory Light.ttf') format('truetype');
        }
        body {
            font-family: 'Maplestory Bold', sans-serif !important;
            color: white !important;
            margin: 0;
            background: url('assets/img/background.png') no-repeat center center fixed;
            background-size: cover;
        }
        .container-center-horizontal {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
        }
        .request-page-post {
            width: 80%;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .overlap-group {
            margin-top: 50px;
        }
        .text-5 {
            font-size: 36px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .text-container {
            display: flex;
            justify-content: space-between;
        }
        .text-2, .text-4 {
            font-size: 24px;
            font-weight: bold;
        }
        .overlap-group-container {
            margin-top: 20px;
        }
        .overlap-group4, .overlap-group2 {
            margin-bottom: 20px;
        }
        .text-1 {
            font-size: 36px;
            font-weight: bold;
        }
        .nlnh {
            font-size: 36px;
        }
        .overlap-group3 {
            margin-top: 20px;
        }
        .phone {
            font-size: 24px;
        }
        .text-3 {
            font-size: 24px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container-center-horizontal">
        <div class="request-page-post screen">
            <div class="overlap-group">
                <h1 class="text-5">해줘요</h1>
                <div class="overlap-group1">
                    <div class="flex-row">
                        <div class="text-container">
                            <div class="text-2">제목</div>
                            <div class="text-4">작성자</div>
                        </div>
                        <div class="overlap-group-container">
                            <div class="overlap-group4">
                                <div class="text-1 abhayalibreextrabold-regular-normal-black-36px"><%= qa.getQa_title() %></div>
                            </div>
                            <div class="overlap-group2">
                                <div class="nlnh abhayalibreextrabold-regular-normal-black-36px"><%= qa.getU_id() %></div>
                            </div>
                        </div>
                    </div>
                    <div class="overlap-group3">
                        <p class="phone">
                            <span>작성일</span><span class="span1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="span2"><%= qa.getQa_d_at() %></span>
                        </p>
                        <div class="text-3 abhayalibreextrabold-regular-normal-black-36px">
                            <%= qa.getQa_content() %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
