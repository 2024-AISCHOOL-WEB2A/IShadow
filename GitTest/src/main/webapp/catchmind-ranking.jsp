<%@page import="com.aischool.model.Ranking"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	Ranking rank = new Ranking();
	ArrayList<Ranking> ranking = (ArrayList<Ranking>)request.getAttribute("ranking");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1440, maximum-scale=1.0" />
    <link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
    <meta name="og:type" content="website" />
    <meta name="twitter:card" content="photo" />
    <link rel="stylesheet" type="text/css" href="assets/css/catchmind-ranking.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
</head>
<body style="margin: 0; background: #ffffff">
    <input type="hidden" id="anPageName" name="page" value="catchmind-ranking" />
    <div class="container-center-horizontal">
        <div class="catchmind-ranking screen">
            <div class="overlap-group4">
                <img class="background" src="assets/img/background.png" alt="background" />
                <img class="x1" src="assets/img/---1.png" alt="1" />
                <div class="overlap-group">
                    <div class="text-1 valign-text-middle single-linebody-base">게시판</div>
                    <div class="group-2613110">
                        <div class="group-2613107">
                            <img class="frame" src="assets/img/frame.svg" alt="Frame" />
                            <img class="image-9" src="assets/img/image-9.png" alt="image 9" />
                            <img class="frame-1" src="assets/img/frame-1.svg" alt="Frame" />
                            <img class="image-9-1" src="assets/img/image-9-1.png" alt="image 9" />
                        </div>
                        <div class="text-container single-linebody-base">
                            <div class="text-2 valign-text-middle">동화</div>
                            <div class="text-3 valign-text-middle">캐치마인드</div>
                            <div class="text-4 valign-text-middle">공유하기</div>
                        </div>
                    </div>
                </div>
                <div class="overlap-group1" onclick="location.href='main.jsp'">
                    <div class="text-5 inter-normal-white-40px">처음으로</div>
                    <img class="image" src="assets/img/------.png" alt="image" />
                    <div class="view"></div>
                </div>
                <div class="overlap-group2" onclick="location.href='GameStart'">
                    <div class="text-6 inter-normal-white-40px">다시하기</div>
                    <img class="image-1" src="assets/img/--------.png" alt="image" />
                    <div class="view"></div>
                </div>
                <h1 class="title">Ranking</h1>
                <div class="overlap-group3 inter-normal-white-55px">
                    <% for(int i = 0; i < ranking.size(); i++) { %>
                        <div class="rank-item">
                            <div class="rank-position"><%= i+1 %>th</div>
                            <div class="rank-time"><%= ranking.get(i).getTime() %></div>
                            <div class="rank-nickname"><%= ranking.get(i).getNickName() %></div>
                        </div>
                    <% } %>
                    <div class="view-1"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
