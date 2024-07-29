<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            font-family: 'Maplestory Bold', sans-serif !important;
            margin: 0;
            background: url('assets/img/background.png') no-repeat center center fixed;
            background-size: cover;
            overflow: auto; /* 스크롤 허용 */
            color: white !important;
        }
        .header-container {
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1000;
        }
        .content-container {
            margin-top: 100px; /* 헤더 높이 만큼 여백 추가 */
            padding: 20px;
            text-align: center;
        }
        .rectangle-355 {
            width: 80%; /* 적절한 너비 설정 */
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 15px;
            font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 패밀리 추가 */
            margin: 0 auto; /* 가운데 정렬 */
            margin-top: 140px; /* 위쪽 여백 추가 */
            margin-left: 4%; /* 오른쪽으로 이동 */
        }
        .table-header {
            display: flex;
            justify-content: space-between;
            font-size: 18px;
            font-weight: bold;
            font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 패밀리 추가 */
        }
        .group-2613114 {
            margin-top: 10px;
        }
        .overlap-group2 {
            display: flex;
            justify-content: space-between;
            font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 패밀리 추가 */
        }
        .text-7 {
            text-align: left !important; /* 왼쪽 정렬 */
        }
        .uploadbtn {
            display: inline-block;
            width: 114px;
            height: 50px;
            background-color: #ffffff;
            color: black;
            font-size: 18px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            opacity: 80%;
            font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 패밀리 추가 */
            float: right; /* 오른쪽 정렬 */
            margin-top: 20px; /* 적절한 위쪽 여백 추가 */
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
<body>
    <div class="header-container">
        <%@ include file="header.jsp"%>
    </div>
    <input type="hidden" id="anPageName" name="page" value="request-page" />
    <div class="container-center-horizontal">
        <div class="request-page screen">
            <div class="content-container">
                <!-- 여기에 다른 내용이 있을 경우 추가 -->
            </div>
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
                <input type="button" class="uploadbtn" name="uploadbtn" value="업로드" onclick="redirectToUpload()">
            </div>
        </div>
    </div>
</body>
</html>
