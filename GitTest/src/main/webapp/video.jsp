<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <!--<meta name=description content="This site was generated with Anima. www.animaapp.com"/>-->
    <!-- <link rel="shortcut icon" type=image/png href="https://animaproject.s3.amazonaws.com/home/favicon.png" /> -->
    <meta name="viewport" content="width=1440, maximum-scale=1.0" />
    <link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
    <meta name="og:type" content="website" />
    <meta name="twitter:card" content="photo" />
    <link rel="stylesheet" type="text/css" href="assets/css/video.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
  </head>
  <body style="margin: 0; background: #000000">
    <input type="hidden" id="anPageName" name="page" value="video" />
    <div class="container-center-horizontal">
      <div class="video screen">
        <div class="overlap-group1">
          <img class="zcc-1 animate-enter2" src="assets/img/zcc-4.png" alt="zcc 4" />
          <div class="overlap-group">
            <div class="text-60 valign-text-middle single-linebody-base">게시판</div>
            <div class="group-2613110">
              <div class="group-2613107">
                <img class="frame" src="assets/img/frame-10.svg" alt="Frame" />
                <img class="image-9" src="assets/img/image-9.png" alt="image 9" />
                <img class="frame-1" src="assets/img/frame-11.svg" alt="Frame" />
                <img class="image-9-1" src="assets/img/image-9-1.png" alt="image 9" />
              </div>
              <div class="text-container single-linebody-base">
                <div class="text-61 valign-text-middle">동화</div>
                <div class="text-62 valign-text-middle">캐치마인드</div>
                <div class="text-63 valign-text-middle">공유하기</div>
              </div>
            </div>
          </div>
          <a href="story-quiz.html">
            <div class="link-sns_item"><div class="text-64 valign-text-middle">넘어가기</div></div></a
          >
          <div class="rectangle-7"></div>
          <img class="line-1" src="assets/img/line-1.svg" alt="Line 1" />
          <div class="ellipse-2"></div>
          <img class="x1" src="img/---1.png" alt="1" />
        </div>
      </div>
    </div>
    <script>
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
