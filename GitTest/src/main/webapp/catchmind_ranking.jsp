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
    <!--<meta name=description content="This site was generated with Anima. www.animaapp.com"/>-->
    <!-- <link rel="shortcut icon" type=image/png href="https://animaproject.s3.amazonaws.com/home/favicon.png" /> -->
    <meta name="viewport" content="width=1920, maximum-scale=1.0" />
    <link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
    <meta name="og:type" content="website" />
    <meta name="twitter:card" content="photo" />
    <link rel="stylesheet" type="text/css" href="assets/css/catchmindu95ranking.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
  </head>
  <body style="margin: 0; background: #000000">
  <script>
  	function moveMain(){
  		window.location.href = 'main.jsp';
  	}
  	function reTry(){
  		window.location.href = 'GameStart';
  	}
  </script>
    <input type="hidden" id="anPageName" name="page" value="catchmindu95ranking" />
    <div class="container-center-horizontal">
      <div class="catchmindu95ranking screen">
        <div class="overlap-group3">
          <img
            class="create-a-high-resolu"
            src="assets/img/background.png"
            alt="Create a high-resolution illustration for a presentation thumbnail with a _The L s-1584004691 2"
          />
          <%@ include file="header.jsp" %>
          <div class="overlap-group" onclick="mover">
            <img class="image" src="assets/img/------.png" alt="image" />
            <div class="view view-2"></div>
            <div class="gText">처음으로</div>
          </div>
          <div class="overlap-group1" onclick="reTry()">
            <img class="image-1" src="assets/img/catchmind_ranking/--------.png" alt="image" />
            <div class="view-1 view-2"></div>
            <div class="gText">다시하기</div>
          </div>
          <div class="ranking-container">
            <h1 class="title">Ranking</h1>
            <div class="group-11">
              <div class="ranking-item">
                <div class="rank-time">1st <%=ranking.get(0).getTime()%></div>
                <div class="rank-name"><%=ranking.get(0).getNickName()%></div>
              </div>
              <div class="ranking-item">
                <div class="rank-time">2nd <%=ranking.get(1).getTime()%></div>
                <div class="rank-name"><%=ranking.get(1).getNickName()%></div>
              </div>
              <div class="ranking-item">
                <div class="rank-time">3rd <%=ranking.get(2).getTime()%></div>
                <div class="rank-name"><%=ranking.get(2).getNickName()%></div>
              </div>
              <div class="ranking-item">
                <div class="rank-time">4th <%=ranking.get(3).getTime()%></div>
                <div class="rank-name"><%=ranking.get(3).getNickName()%></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
