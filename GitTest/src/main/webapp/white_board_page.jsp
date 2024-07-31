<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.aischool.model.Post"%>
<%
ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("getPosts");
String myPage = (String) request.getAttribute("myPage");
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
<link rel="stylesheet" type="text/css" href="assets/css/white_board_page.css" />
<link rel="stylesheet" type="text/css" href="assets/css/white_board_page.css" />
<link rel="stylesheet" type="text/css" href="assets/css/white_board_page.css" />
<style>
body {
	font-family: 'Maplestory Bold', sans-serif !important;
	margin: 0;
	background: url('assets/img/white_background.png') no-repeat center center
		fixed;
	background-size: cover;
	overflow: auto; /* 스크롤 허용 */
	color: white !important;
}

.view-container {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin-top: 20px;
}

.view-1, .view-2, .view-3, .view {
/* 	display: flex; */
	flex-direction: column;
	align-items: center;
	color: white;
	text-align: center;
}

.ellipse-1 {
	width: 15vw;
	height: 15vw;
	border-radius: 50%;
	margin-right: 0.14vw;
	object-fit: cover;
}
</style>
<script>
	function searchPosts() {
		let searchVal = document.getElementById("searchVal");
		if (searchVal.value == "" || searchVal.value == null) {
			alert("텍스트를 입력 해주세요.");
			return;
		}
		let searchfrm = getElementById("searchfrm");
		searchfrm.submit();
	}

	function redirectToUpload(val) {
		let form = document.createElement('form');
		form.method = 'POST';
		form.action = 'white_board_upload_page.jsp';
		
		let input = document.createElement('input');
		input.type = 'hidden';
		input.name = 'user';
		input.value = val;

		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
	}
	function submitForm(name) {
		let form = document.createElement('form');
		form.method = 'GET';
		form.action = 'WhitePostsCommentAll';

		let input = document.createElement('input');
		input.type = 'hidden';
		input.name = 'idx';
		input.value = name;

		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
	}
</script>
</head>
<body>
	<div class="header-container">
		<%@ include file="white_header.jsp"%>
	</div>
	<!-- 	<div class="container-center-horizontal"> -->
	<!-- 		<div class="desktop-1"> -->
	<!-- 			<div class="overlap-group4"> -->
	<input type="hidden" id="anPageName" name="page" value="request-page" />

	<h1 class="text-55" style="margin-bottom: 0px; margin-top: 150px;">커뮤니티</h1>
	<div style="text-align: center;">
		<%
		if (loginMember != null) {
		%>
			<input type="button" class="uploadbtn" name="uploadbtn" value="업로드" onclick="redirectToUpload('<%=loginMember.getU_id()%>')">
		<%
		}
		%>
	</div>

	<div class="search-container">
		<form method="get" id="searchfrm" action="WhitePostsSearch">
			<input type="text" id="searchVal" name="searchVal"
				class="search-input" placeholder="검색어를 입력하세요" />
			<button class="search-button" onclick="searchPosts();">
				<img class="icon-magnifying-glass"
					src="assets/img/board_page/search_icon.png" alt="돋보기" />
			</button>
		</form>
	</div>

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

		if (posts.isEmpty()) {} 
		else {
			int size = posts.size();
			for (int i=0,e=0; i<size-3;) {
		%>
			<div class="view-container">
		<%
				while(e<3 && e<size) {
		%>
				<div onclick="submitForm(this.querySelector('.hiddenName').name)">
					<div class="view">
						<img class="ellipse-1" src="<%=posts.get(i).getFile()%>" />
						<div class="text-40"><%=posts.get(i).getTitle()%></div>
						<input class="hiddenName" type="hidden" name="<%=posts.get(i).getIdx()%>">
					</div>
				</div>
		  <%i++;e++;}e=0;%>
			</div>
		<%}}%>

<!-- 	<div> -->
<!-- 		<div style="text-align: center; color: white;">페이징 작업</div> -->
<!-- 	</div> -->

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
