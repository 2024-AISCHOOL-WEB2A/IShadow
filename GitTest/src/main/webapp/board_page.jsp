<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.aischool.model.Post"%>
<%
	ArrayList<Post> posts = (ArrayList<Post>)request.getAttribute("getPosts");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" type="image/png"
	href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/board_page.css" />
<link rel="stylesheet" type="text/css" href="assets/css/board_page.css" />
<link rel="stylesheet" type="text/css" href="assets/css/board_page.css" />
<script>
 	function searchPosts(){
		let frm = document.searchfrm;
		let searchVal = searchfrm.searchVal;
		if(searchVal.value == "" || searchVal.value == null){
			alert("텍스트를 입력 해주세요.");
			return;
		}
	}
</script>
</head>
<body style="margin: 0; background: #000000">
	<div class="desktop-1">
		<div class="overlap-group4">
			<!-- header -->
			<%@ include file="header.jsp"%>
			<h1 class="text-55">커뮤니티</h1>
				<div class="search-container">
					<form method="get" action="PostsSearch">
						<input type="text" name="searchVal" class="search-input" placeholder="검색어를 입력하세요" />
						<button class="search-button" onclick="searchPosts();">
							<img class="icon-magnifying-glass"
								src="assets/img/board_page/search_icon.png" alt="돋보기" />
						</button>
					</form>
				</div>
			<div class="group-2613103">
				<%
					/* // ArrayList 설정
	                ArrayList<String[]> items = new ArrayList<String[]>();
	                items.add(new String[]{"assets/img/QA.png", "제목 1"});
	                items.add(new String[]{"assets/img/image2.jpg", "제목 2"});
	                items.add(new String[]{"assets/img/image3.jpg", "제목 3"});
	                items.add(new String[]{"assets/img/image4.jpg", "제목 4"});
	                items.add(new String[]{"assets/img/image5.jpg", "제목 5"});
	                items.add(new String[]{"assets/img/image6.jpg", "제목 6"});
	
	                // 동적 생성
	                for (String[] item : items) {
	                    String imgSrc = item[0];
	                    String title = item[1]; */
                	if(!posts.isEmpty()){
               			int size = posts.size();
                   		for(int i=0; i<size; i++) {
                %>
				<div class="group-2613103-item board">
					<a href="board-inpage.jsp">
						<div class="link">
							<div class="overlap-group"
								style="background-image: url(<%= posts.get(i).getFile() %>);"></div>
						</div>
					</a>
					<div class="title"><%= posts.get(i).getTitle() %></div>
				</div>
				<%
                  		}
                   	}
                %>
			</div>
		</div>
	</div>
	<script>
        function ShowOnScroll() {
            this.toShow = [];
            this.nextEventY = undefined;
        }

        ShowOnScroll.prototype.show = function(e) {
            e.style.display = "";
        };

        ShowOnScroll.prototype.hide = function(e) {
            e.style.display = "none";
        };

        ShowOnScroll.prototype.getTop = function(e) {
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

        ShowOnScroll.prototype.onScroll = function() {
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

        ShowOnScroll.prototype.resetScrolling = function() {
            // Clear state
            var screenBottom = window.pageYOffset + window.innerHeight;
            for (var i = 0; i < this.toShow.length; i++) {
                var e = this.toShow[i];
                this.show(e);
            }
            this.toShow = [];
            this.nextEventY == undefined;

            // Collect items
            var itemsToShowOnScroll = Array.prototype.slice.call(document
                    .getElementsByTagName("*"));
            itemsToShowOnScroll = itemsToShowOnScroll.filter(function(e) {
                return e.getAttribute("show-on-scroll") != undefined;
            });
            var getTop = this.getTop;
            itemsToShowOnScroll.sort(function(a, b) {
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
                this.nextEventY = this.nextEventY != undefined ? this.nextEventY
                        : top;
            }
        };

        ShowOnScroll.prototype.handleEvent = function(e) {
            switch (e.type) {
            case "scroll":
                this.onScroll();
                break;
            case "resize":
                this.resetScrolling();
                break;
            }
        };

        ShowOnScroll.prototype.init = function() {
            this.resetScrolling();
            window.addEventListener("scroll", this);
            window.addEventListener("resize", this);
        };

        // After anima-src
        setTimeout(function() {
            var instShowOnScroll = new ShowOnScroll();
            instShowOnScroll.init();
        }, 250);
    </script>
</body>
</html>
