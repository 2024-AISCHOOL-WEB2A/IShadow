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
<link rel="stylesheet" type="text/css"
   href="assets/css/board-inpage.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
</head>
<body style="margin: 0; background: #000000">
      <div class="board-inpage screen">
         <div class="overlap-group">
            <!-- header -->
            <%@ include file="header.jsp"%>
            <img class="zcc-4 animate-enter" src="assets/img/zcc-4.png"
               alt="zcc 4" />
            <div class="rectangle-37 rectangle"></div>
            <div class="rectangle-39 rectangle"></div>
            <div class="rectangle-43 rectangle"></div>
            <div class="text-12">힌트1 보기</div>
            <div class="rectangle-44 rectangle"></div>
            <div class="rectangle-40 rectangle"></div>
            <div class="rectangle-41 rectangle"></div>
            <div class="rectangle-42 rectangle"></div>
            <img class="image-5" src="assets/img/image-5.png" alt="image 5" />
            <div class="user">user 님의 작품</div>
            <div class="text-13">정답</div>
            <div class="text-14">정답 입력창</div>
            <div class="text-15">확인해보기</div>
            <div class="text-16">힌트3 보기</div>
            <div class="text-17">힌트2 보기</div>
            <div class="overlap-group"></div>
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