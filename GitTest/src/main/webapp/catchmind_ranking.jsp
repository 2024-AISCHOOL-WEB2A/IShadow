<%@page import="com.aischool.model.Ranking"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Ranking rank = new Ranking();
ArrayList<Ranking> ranking = (ArrayList<Ranking>) request.getAttribute("ranking");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=1920, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/catchmindu95ranking.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
	.header-container {
	position: relative; /* z-index 적용을 위해 position 설정 */
	z-index: 10; /* 적절한 z-index 값 설정 */
}
</style>
</head>
<body style="margin: 0; background: #000000">
    <script>
        function moveMain() {
            window.location.href = 'main.jsp';
        }
        function reTry() {
            window.location.href = 'GameStart';
        }
    </script>
    <input type="hidden" id="anPageName" name="page" value="catchmindu95ranking" />
    <div class="container-center-horizontal">
        <div class="catchmindu95ranking screen">
            <div class="overlap-group3">
                <img class="create-a-high-resolu" src="assets/img/background.png" alt="background" />
                <div class="header-container">
					<%@ include file="header.jsp"%>
				</div>
                <div class="ranking-container">
                    <h1 class="title">Ranking</h1>
                    <div class="group-11">
                        <div class="ranking-item">
                            <div class="rank-number">등수</div>
                            <div class="rank-time">기록</div>
                            <div class="rank-name">닉네임</div>
                        </div>
                        <% for (int i = 1; i <= ranking.size(); i++) { %>
                        <div class="ranking-item">
                            <div class="rank-number"><%=i%>등</div>
                            <div class="rank-time"><%=ranking.get(i - 1).getTime()%></div>
                            <div class="rank-name"><%=ranking.get(i - 1).getNickName()%></div>
                        </div>
                        <% } %>
                    </div>
                </div>
                <div class="overlap-group" onclick="moveMain()">
                    <img class="image" src="assets/img/------.png" alt="image" />
                    <div class="view view-2"></div>
                    <div class="gText">처음으로</div>
                </div>
                <div class="overlap-group1" onclick="reTry()">
                    <img class="image-1" src="assets/img/catchmind_ranking/--------.png" alt="image" />
                    <div class="view-1 view-2"></div>
                    <div class="gText">다시하기</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>