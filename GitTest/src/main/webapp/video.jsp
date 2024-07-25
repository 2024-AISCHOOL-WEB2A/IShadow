<%@page import="com.aischool.model.Stories"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<!--<meta name=description content="This site was generated with Anima. www.animaapp.com"/>-->
<!-- <link rel="shortcut icon" type=image/png href="https://animaproject.s3.amazonaws.com/home/favicon.png" /> -->
<meta name="viewport" content="width=1440, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png"
	href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/video.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
</head>
<Style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	width: 100%;
	overflow: hidden;
}

video {
	width: 100%;
	height: 100%;
}
</Style>
<body style="margin: 0; background: #000000">
	<input type="hidden" id="anPageName" name="page" value="video" />
	<div class="container-center-horizontal">
		<div class="video screen">
			<div class="overlap-group1">

				<!-- header -->
				<%@ include file="header.jsp"%>

				<a href="story-quiz.jsp">
					<div class="link-sns_item">
						<div class="text-64 valign-text-middle">넘어가기</div>
					</div>
				</a>
				<!--영상 들어갈 자리-->
				<div class="rectangle-7">
					<%
					ArrayList<Stories> choicedStory = (ArrayList<Stories>) session.getAttribute("choicedStory");
					int idx = 0;
					if (choicedStory != null && !choicedStory.isEmpty()) {
					%>
						<%if (request.getParameter("idx") == null) {%>
							<video class="choicedStory" autoplay="autoplay" 
							src="<%=choicedStory.get(idx).getViedo()%>" onended="idxSelector(<%=idx%>)">
							</video>
						<%}
						else{
							idx += Integer.parseInt(request.getParameter("idx"));
						%>
							<video class="choicedStory" autoplay="autoplay" 
							src="<%=choicedStory.get(idx).getViedo()%>" onended="idxSelector()">
							</video>
						<%}%>
					<%
					} else {
					%>
					<p>비디오를 로드할 수 없습니다....</p>
					<%
					}
					%>
				</div>
				<img class="x1" src="assets/img/---1.png" alt="1" />
			</div>
		</div>
	</div>
	<script>
	/* 영상 idx 정보 넘겨주기 */
    function idxSelector(idx){
    	sessionStorage.setItem('index', idx);
    	alert(idx);
    	window.location.href = "story-quiz.jsp";
    }
    
    
    
      function ShowOnScroll() {
        this.toShow = [];
        this.nextEventY = undefined;
      }

      ShowOnScroll.prototype.show = function (e) {
        e.style.display = "";
      };

      ShowOnScroll.prototype.hide = function (e) {
        e.style.display = "none";
      };

      ShowOnScroll.prototype.getTop = function (e) {
        if (e.Top != undefined && e.Top != 0) {
          return e.Top;
        }
        var top = 0;
        var iter = e;
        do {
          top += iter.offsetTop || 0;
          iter = iter.offsetParent;
        } while (iter);
        e.Top = top;
        return top;
      };

      ShowOnScroll.prototype.onScroll = function () {
        var screenBottom = window.pageYOffset + window.innerHeight;
        if (this.nextEventY == undefined || this.nextEventY > screenBottom) {
          return;
        }
        this.nextEventY = undefined;
        for (var i = 0; i < this.toShow.length; i++) {
          var e = this.toShow[i];
          var top = this.getTop(e);
          if (top < screenBottom) {
            this.show(e);
            this.toShow.shift();
            i--;
          } else {
            this.nextEventY = top;
            break;
          }
        }
      };

      ShowOnScroll.prototype.resetScrolling = function () {
        // Clear state
        var screenBottom = window.pageYOffset + window.innerHeight;
        for (var i = 0; i < this.toShow.length; i++) {
          var e = this.toShow[i];
          this.show(e);
        }
        this.toShow = [];
        this.nextEventY == undefined;

        // Collect items
        var itemsToShowOnScroll = Array.prototype.slice.call(document.getElementsByTagName("*"));
        itemsToShowOnScroll = itemsToShowOnScroll.filter(function (e) {
          return e.getAttribute("show-on-scroll") != undefined;
        });
        var getTop = this.getTop;
        itemsToShowOnScroll.sort(function (a, b) {
          return getTop(a) - getTop(b);
        });
        for (var i = 0; i < itemsToShowOnScroll.length; i++) {
          var e = itemsToShowOnScroll[i];
          var top = this.getTop(e);
          if (top < screenBottom) {
            continue;
          }
          this.toShow.push(e);
          this.hide(e);
          this.nextEventY = this.nextEventY != undefined ? this.nextEventY : top;
        }
      };

      ShowOnScroll.prototype.handleEvent = function (e) {
        switch (e.type) {
          case "scroll":
            this.onScroll();
            break;
          case "resize":
            this.resetScrolling();
            break;
        }
      };

      ShowOnScroll.prototype.init = function () {
        this.resetScrolling();
        window.addEventListener("scroll", this);
        window.addEventListener("resize", this);
      };

      // After anima-src
      setTimeout(function () {
        var instShowOnScroll = new ShowOnScroll();
        instShowOnScroll.init();
      }, 250);
    </script>
</body>
</html>
