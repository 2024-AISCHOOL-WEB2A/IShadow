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
    <link rel="stylesheet" type="text/css" href="assets/css/mypage.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
  </head>
  <body style="margin: 0; background: #000000">
       <%@ include file="header.jsp"%>
    <input type="hidden" id="anPageName" name="page" value="mypage" />
    <div class="container-center-horizontal">
      <div class="mypage screen">
        <div class="overlap-group9">
      

          <a href="board-inpage.html">
            <div class="link link-6">
              <div class="overlap-group">
                <div class="x1719813394355jpg"></div>
                <div class="background background-2">
                  <div class="emphasis">
                    <div class="text-8 valign-text-middle arial-black-white-17-6px">애창동요</div>
                  </div>
                </div>
              </div>
            </div></a
          ><a href="board-inpage.jsp">
            <div class="link-1 link-6">
              <div class="overlap-group">
                <div class="x1719813394355jpg"></div>
                <div class="background background-2">
                  <div class="emphasis">
                    <div class="text-8 valign-text-middle arial-black-white-17-6px">애창동요</div>
                  </div>
                </div>
              </div>
            </div></a
          >
          <div class="overlap-group2">
            <div class="rectangle-59"></div>
            <div class="text-8-1 valign-text-middle">더보기</div>
          </div>
          <div class="overlap-group3">
            <div class="rectangle-59"></div>
            <div class="text-8-1 valign-text-middle">더보기</div>
          </div>
          <img class="line-2" src="assets/img/my_page/line-2.svg" alt="Line 2" />
          <div class="rectangle-61"></div>
          <h1 class="nlnh">NLNH님 안녕하세요!</h1>
          <div class="rectangle-62"></div>
          <div class="ellipse-22"></div>
          <a href="board-inpage.jsp">
            <div class="link-2 link-6">
              <div class="overlap-group">
                <div class="x1713773510791png"></div>
                <div class="background-1 background-2">
                  <div class="emphasis">
                    <div class="text-8 valign-text-middle arial-black-white-17-6px">생활동요</div>
                  </div>
                </div>
              </div>
            </div></a
          ><a href="board-inpage.jsp">
            <div class="link-3 link-6">
              <div class="overlap-group">
                <div class="x1713773510791png"></div>
                <div class="background-1 background-2">
                  <div class="emphasis">
                    <div class="text-8 valign-text-middle arial-black-white-17-6px">생활동요</div>
                  </div>
                </div>
              </div>
            </div></a
          ><a href="board-inpage.jsp">
            <div class="link-4 link-6">
              <div class="overlap-group">
                <div class="x1713773510791png"></div>
                <div class="background-1 background-2">
                  <div class="emphasis">
                    <div class="text-8 valign-text-middle arial-black-white-17-6px">생활동요</div>
                  </div>
                </div>
              </div>
            </div></a
          ><a href="board-inpage.jsp">
            <div class="link-5 link-6">
              <div class="overlap-group">
                <div class="x1713773510791png"></div>
                <div class="background-1 background-2">
                  <div class="emphasis">
                    <div class="text-8 valign-text-middle arial-black-white-17-6px">생활동요</div>
                  </div>
                </div>
              </div>
            </div></a
          >
         
            
          </div>
     
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
