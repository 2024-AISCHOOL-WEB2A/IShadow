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
<meta name="og:type" content="wㅠebsite" />
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

#videoSkip {
	position: fixed;
	z-index: 100;
	border: none;
	background: none;
	color: white;
	font-size: 20px;
	font-family: 'Maplestory Bold', sans-serif;
	cursor: pointer;
	right: 20px;
	bottom: 20px;
}
</Style>
<body style="margin: 0; background: #000000">
	<input type="hidden" id="anPageName" name="page" value="video" />
	<div class="container-center-horizontal">
		<div class="video screen">
			<div class="overlap-group1">

				<!-- header -->
				<%@ include file="header.jsp"%>

				<%
				ArrayList<Stories> choicedStory = (ArrayList<Stories>) session.getAttribute("choicedStory");
				int idx = 0;
				System.out.println("영성 출력 전 " + request.getParameter("story_idx"));
				if (choicedStory != null && !choicedStory.isEmpty()) {
				%>
				<%
				if (request.getParameter("story_idx") == null) {
				%>

				<!--영상 들어갈 자리-->
				<div class="rectangle-7">
					<video id="storyVideo" class="choicedStory"
						src="<%=choicedStory.get(idx).getVideo()%>"
						onended="idxSelector(<%=idx%>)" autoplay="autoplay">
					</video>
					<%
					} else {
					idx += Integer.parseInt(request.getParameter("story_idx"));
					System.out.println("다음 동화 " + idx);
					%>
					<div class="rectangle-7">
						<video id="storyVideo" class="choicedStory"
							src="<%=choicedStory.get(idx).getVideo()%>"
							onended="idxSelector(<%=idx%>)" autoplay="autoplay">
						</video>
						<%
						}
						%>
						<%
						} else {
						%>
						<p>비디오를 로드할 수 없습니다....</p>
						<%
						}
						%>
					</div>
					<button id="videoSkip" class="text-64 valign-text-middle"
						onclick="idxSelectorBtn(<%=idx%>)">넘어가기</button>
				</div>
			</div>
		</div>
		<script>
	/* 영상 idx 정보 넘겨주기 */
    function idxSelector(idx) {
    // 1초 지연 후 폼 제출
    setTimeout(() => {
        let form = document.createElement("form");
        form.method = "POST";
        <%System.out.println("idx: " + idx);
if (idx != (choicedStory.size() - 1)) {%>
                form.action = "story-quiz.jsp";    
        <%} else {%>
                form.action = "story-ending-page.jsp";
        <%}%>
        let input = document.createElement("input");
        input.type = "hidden";
        input.name = "story_idx";
        input.value = idx;
        
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }, 1000);
}
	//스킾버튼용
    function idxSelectorBtn(idx) {
        // 1초 지연 후 폼 제출
       
            let form = document.createElement("form");
            form.method = "POST";
            <%System.out.println("idx: " + idx);
if (idx != (choicedStory.size() - 1)) {%>
                    form.action = "story-quiz.jsp";    
            <%} else {%>
                    form.action = "story-ending-page.jsp";
            <%}%>
            let input = document.createElement("input");
            input.type = "hidden";
            input.name = "story_idx";
            input.value = idx;
            
            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();
    }
    // 1초 지연 후 동영상 재생(필요하면 사용) autoplay지우고 이거 사용하면 됨
   /*  document.addEventListener("DOMContentLoaded", function() {
        setTimeout(() => {
            document.getElementById("storyVideo").play();
        }, 1000);
    }); */

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
