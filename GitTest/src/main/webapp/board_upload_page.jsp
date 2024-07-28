
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
<link rel="stylesheet" type="text/css" href="assets/css/post-page.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
</head>
<body style="margin: 0; background: #000000 ">
   <input type="hidden" id="anPageName" name="page" value="post-page" />
   <%@ include file="header.jsp"%>
   <div class="container-center-horizontal">

      <div class="post-page screen">

         <div class="overlap-group1 single-linebody-base">


            <div class="rectangle-24"></div>
            <div class="text-65">파일첨부</div>

            <div class="rectangle-25"><input type="text" class="fileupload" name="fileupload" ></div>
            <div class="rectangle-26"></div>
            
            <label class="browse" for="profile"><input type="file"
               id="profile" accept="image/png, image/jpeg">
            </label>
            
            <div class="rectangle-27"></div>
            <div class="text-66">제목</div>
            <div class="rectangle-28"><input type="text" class="firstFeature" name="firstFeature" placeholder="Type here..."></div>
            <div class="rectangle-29"><input type="text" class="secondFeature" name="secondFeature" placeholder="Type here..."></div>
            <div class="rectangle-30"><input type="text" class="thirdFeature" name="thirdFeature" placeholder="Type here..."></div>
            <div class="rectangle-31">
            <input type="text" class="title" name="title" placeholder="Type here..."></div>
            <div class="text-67">첫번째 특징         </div>
            <div class="text-68">두번째 특징</div>
            <div class="text-69">세번째 특징</div>
            <div class="rectangle-32"></div>
            <div class="text-70">정답 입력</div>
            <div class="rectangle-36"></div>
            <div class="text-71">올리기</div>
            <div class="rectangle-33"><input type="text" class="inputanswer" name="inputanswer" ></div>
            
            <div class="overlap-group"></div>
         </div>
      </div>
   </div>
   </div>
   <script>
    console.dir(document.getElementsByClassName("fileupload"));


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
