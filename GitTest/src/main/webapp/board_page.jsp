<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.aischool.model.Post"%>
<%@ page import="com.aischool.model.Page"%>
<%@ page import="com.aischool.model.CurPage"%>
<%
	ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("getPosts");
	CurPage pagination = (CurPage) request.getAttribute("pagination");
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
<style>
body {
	font-family: 'Maplestory Bold', sans-serif !important;
	margin: 0;
	background: url('assets/img/background.png') no-repeat center center
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
  	.paging-wrap { 
/*   		width:1200px; */
		margin:0 auto;
/*    		display: block; */
  	}
  	.pagination{
/* 		list-style:none; */
/* 	 	width: 300px; */
/*   		margin-left: auto; */
/*   		margin-right: auto; */
		margin-top: 30px;
/*   		margin:0 auto; */
/*   		float:left;  */
  		text-align:center;
  }
/*   .pagination li { */
/*    		display:inline-block; */
/*    		text-align:center; */
/*   } */
   .page-item{
   		margin-right: 20px;
 		text-align: center;
  		display: inline-block;
   }
</style>
<script>
	function redirectToUpload(val) {
		let form = document.createElement('form');
		form.method = 'POST';
		form.action = 'board_upload_page.jsp';
		
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
		form.action = 'PostsCommentAll';

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
		<%@ include file="header.jsp"%>
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
		<form method="get" id="searchfrm" action="PostsSearch">
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
			for (int i=0,cnt;i<size;) {
		%>
				<div class="view-container">
		<%
				cnt=0;
				while(i < size && cnt < 3){
		%>
				<div onclick="submitForm(this.querySelector('.hiddenName').name)">
					<div class="view">
						<img class="ellipse-1" src="<%=posts.get(i).getFile()%>" />
						<div class="text-40"><%=posts.get(i).getTitle()%></div>
						<div class="text-40">조회수 <%=posts.get(i).getViews()%></div>
						<input class="hiddenName" type="hidden" name="<%=posts.get(i).getIdx()%>">
					</div>
				</div>
		<% i++;cnt++;} %>
			  </div>
		<% }} 	   %>
		 
	    <div class="paging-wrap">
			<ul class="pagination">
			     <c:if test="${pagination.prev}">
			         <li class="page-item"><a class="page-link" href="#"
			             onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
			         , '${pagination.keyword}')">이전</a></li>
			     </c:if>
			     <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
			         <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
			         <a class="page-link" href="#"
			             onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
			          , '${pagination.keyword}')">
			                 ${idx} </a></li>
			     </c:forEach>
			     <c:if test="${pagination.next}">
			         <li class="page-item"><a class="page-link" href="#"
			             onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
			         , '${pagination.keyword}')">다음</a></li>
			     </c:if>
			</ul>
		</div>


	<script>
		function fn_prev(page, range, rangeSize, listSize, search) {
	        var page = ((range - 2) * rangeSize) + 1;
	        var range = range - 1;
	        var url = "PostsSelectAll";
	        url += "?page=" + page;
	        url += "&range=" + range;
	        url += "&listSize=" + listSize;
	        url += "&keyword=" + search;
	        location.href = url;
	    }
    	//페이지 번호 클릭
	    function fn_pagination(page, range, rangeSize, listSize, search) {
	        var url = "PostsSelectAll";
	            url += "?page=" + page;
	            url += "&range=" + range;
	            url += "&listSize=" + listSize;
	            url += "&keyword=" + search; 
	            location.href = url;    
		}
    	//다음 버튼 이벤트
    	//다음 페이지 범위의 가장 앞 페이지로 이동
	    function fn_next(page, range, rangeSize, listSize, search) {
	        var page = parseInt((range * rangeSize)) + 1;
	        var range = parseInt(range) + 1;            
	        var url = "PostsSelectAll";
	            url += "?page=" + page;
	            url += "&range=" + range;
	            url += "&listSize=" + listSize;
	            url += "&keyword=" + search;
	            location.href = url;
		}

    	// 검색
		function searchPosts() {
			var url = "PostsSearch";
            url += "?page=" + page;
            url += "&range=" + range;
            url += "&listSize=" + listSize;
	        url += "?keyword=" + $('#searchVal').val();
	        location.href = url;
		}
	</script>
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
