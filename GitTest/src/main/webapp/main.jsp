<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<!--<meta name=description content="This site was generated with Anima. www.animaapp.com"/>-->
<!-- <link rel="shortcut icon" type=image/png href="https://animaproject.s3.amazonaws.com/home/favicon.png" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/main-u4370u4458u4358u4455u4523.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        width: 100%;
        overflow: hidden;
        background: #000000;
    }
    .container-center-horizontal {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        width: 100%;
    }
    .main-u4370u4458u4358u4455u4523 {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    .overlap-group {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .view-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .view {
        width: 200px;
        height: 50px;
        background-color: #ffffff;
        margin: 10px;
        cursor: pointer;
    }
    .link-sns_item {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 200px;
        height: 50px;
        background-color: #ffffff;
        margin-top: 10px;  /* margin-top 값을 줄여줍니다 */
        cursor: pointer;
    }
    .shadow {
        color: #ffffff;
        font-size: 2em;
    }
</style>
</head>
<body>
    <input type="hidden" id="anPageName" name="page" value="main-u4370u4458u4358u4455u4523" />
    <div class="container-center-horizontal">
        <div class="main-u4370u4458u4358u4455u4523 screen">
            <div class="overlap-group">
                <h1 class="shadow">아이Shadow</h1>
                
                <!-- 들어가는 버튼 -->
                <div class="view-container">
                	<!-- 튜토리얼 -->
                    <a href="#">
                        <div class="view"></div>
                    </a>
                    <!-- 동화 -->
                    <a href="story-choice.jsp">
                        <div class="view"></div>
                    </a>
                    <!-- 캐치마인드 -->
                    <a href="GameStart">
                        <div class="view"></div>
                    </a>
                    <!-- 캐치마인드 -->
                    <a href="desktop-1.jsp">
                        <div class="view"></div>
                    </a>
                </div>
                
            </div>
        </div>
    </div>
</body>
</html>
