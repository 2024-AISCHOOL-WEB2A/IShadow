<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.aischool.model.Login"%>
<%
// 	Login loginMember = (Login) session.getAttribute("login_member");
%>
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
    <link rel="stylesheet" type="text/css" href="assets/css/white_post-page.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
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
    	.title{
		    width: 100%;
		    height: 3.47vw;
		    box-sizing: border-box;
		    padding: 10px; /* 원하는 만큼 패딩을 조정 */
		    font-size: 1.2em; /* 글자 크기 조정 */
		    color:#000000;
		    border: 1px solid #ccc; /* 보더 스타일 조정 */
		}
		.inputanswer{
		    width: 100%;
		    height: 3.19vw;
		    box-sizing: border-box;
		    padding: 10px; /* 원하는 만큼 패딩을 조정 */
		    font-size: 1.2em; /* 글자 크기 조정 */
		    border: 1px solid #ccc; /* 보더 스타일 조정 */
		}
		.filebox {
			display: flex; 
			gap: 10px;
          	margin-left:89px;
          	margin-top: 20px;
          	width: 345px;
          	height: 3.12vw
         }
         .filebox input {
         	border: 1px solid #dbdbdb; 
         	background-color: #fff; 
         	font-size: 16px;
         	top: 18.96vw;
         	height: 3.12vw;
         }
         .container {
		    background-color: blue;
		    border: 0.35vw solid;
		    border-color: #ffffff;
		    border-radius: 2.15vw;
		    height: 3.92vw;
		    left: 62.99vw;
		    position: absolute;
		    top: 70.69vw;
		    width: 8.06vw;
		    color: #ffffff;
		 }
		 .uploadText {
    		color: #ffffff;
    		size: 15px;
		    font-family: 'Maplestory Bold';
		    transform: translateY(20px);
		    position: relative;
		    left: 325px;
		    top: 280px;
		    font-size: 30px;
		 }
		 .overlap-group2 {
	        display: flex !important;
	        flex-direction: column !important;
	        align-items: center !important;
	        background: rgba(0, 0, 0, 0.8) !important;
	        padding: 40px !important; /* 패딩 증가 */
	        border: 2px solid #ffe077 !important; /* 노란색 외곽선 추가 */
	        border-radius: 15px !important;
	        width: 600px !important; /* 너비 증가 */
	        height: 700px;
    	}
    	.input-field {
	        width: 100% !important;
	        font-family: 'Maplestory Bold', sans-serif; /* 폰트 패밀리 추가 */
	        padding: 25px !important; /* 패딩 증가 */
	        margin: 20px 0 !important; /* 간격 증가 */
	        box-sizing: border-box !important;
	        border: 2px solid yellow !important;
	        border-radius: 15px !important;
	        font-size: 24px !important; /* 크기 증가 */
    	}
    	
    	.form-container {
            width: 80%; /* 이전보다 작은 크기로 설정 */
            max-width: 900px; /* 최대 너비 설정 */
            margin: 0 auto;
            padding: 30px; /* 패딩을 조금 줄임 */
            background-color: rgba(0, 0, 0, 0.8); /* 검정 배경색에 불투명도 추가 */
            border-radius: 20px;
            border: 2px solid yellow;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: white;
            font-family: 'Maplestory Bold';
            margin-top: 150px; /* 위쪽 여백 추가 */
        }

        .form-group {
            margin-bottom: 15px; /* 그룹 간격을 조금 줄임 */
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            font-size: 20px; /* 글씨 크기 증가 */
            color: white;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 15px; /* 패딩 증가 */
            border: 2px solid yellow;
            border-radius: 20px;
            box-sizing: border-box;
            font-size: 18px; /* 글씨 크기 증가 */
            background-color: transparent;
            color: white;
            font-family: 'Maplestory Bold';
        }

        .form-group textarea {
            height: 150px; /* 높이 증가 */
        }

        .buttons {
             display: flex; 
            justify-content: space-between;
        }

        .btn {
            padding: 15px 30px; /* 패딩 증가 */
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 18px; /* 글씨 크기 증가 */
            font-family: 'Maplestory Bold';
        }

        .btn-cancel {
            background-color: transparent;
            color: white;
            border: 2px solid yellow;
        }

        .btn-submit {
            background-color: yellow;
            color: black;
        }

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
    	function validation(){
    		let title = $('#title').val();
    		let fileUpload = $('.upload-name').val();
    		let inputanswer = $('#inputanswer').val();
    		let firstFeature = $('#firstFeature').val();
    		let secondFeature = $('#secondFeature').val();
    		let thirdFeature = $('#thirdFeature').val();
    		let user = $('#user').val();
    		if(title == '' || title == null){
   				alert("제목을 입력 해주세요.");
   				return;
   			}else if(fileUpload == '' || fileUpload == null){
   				alert("파일을 입력 해주세요.");
   				return;
   			}else if(inputanswer == '' || inputanswer == null){
   				alert("정답을 입력 해주세요.");
   				return;
   			}else if(firstFeature == '' || firstFeature == null){
   				alert("첫번째 특징을 입력 해주세요.");
   				return;
   			}else if(secondFeature == '' || secondFeature == null){
   				alert("두번째 특징을 입력 해주세요.");
   				return;
   			}else if(thirdFeature == '' || thirdFeature == null){
   				alert("세번째 특징을 입력 해주세요.");
   				return;
   			}

    		$.ajax({
    			type: "POST",
    			data: "firstFeature="+firstFeature+"&fileUpload="+fileUpload
    			+"&secondFeature="+secondFeature+"&user="+user
    			+"&thirdFeature="+thirdFeature+"&title="+title
    			+"&inputanswer="+inputanswer,
    			url:"WhitePostsInsert",
    			success: function(result){
    				if(result == "ok"){
    					alert("등록완료");
    					location="WhitePostsSelectAll";
    				}else{
    					alert("등록실패");
    				}
    			},
    			error: function(){
    				alert("error");
    			}
    		});
    	}
    </script>
  </head>
  <body>
    <input type="hidden" id="anPageName" name="page" value="post-page" />
    <%@ include file="white_header.jsp"%>

   	<div class="form-container">
   		<form method="post" id="boardup">
   			<input type="hidden" id="user" name="user" value="<%=loginMember.getU_id()%>">
   			<div class="form-group">
   				<label for="title">제목</label>
   				<input type="text" id="title" name="title">
   			</div>
   			<div class="filebox">
   				<label>파일 첨부</label>
   				<input class="upload-name" name="fileUpload" readonly>
           		<input type="file" id="file_01" class="file" title="파일 업로드">
	            <label for="file_01" class="upload-button">파일업로드</label>
   			</div>
   			<div class="form-group">
   				<label>정답</label>
   				<input type="text" id="inputanswer" name="inputanswer">
   			</div>
   			<div class="form-group">
               	<label for="content">첫번째 특징</label>
            	<textarea id="firstFeature" name="firstFeature" placeholder="내용을 입력하세요" required></textarea>
            </div>
            <div class="form-group">
               	<label for="content">두번째 특징</label>
            	<textarea id="secondFeature" name="secondFeature" placeholder="내용을 입력하세요" required></textarea>
            </div>
            <div class="form-group">
               	<label for="content">세번째 특징</label>
            	<textarea id="thirdFeature" name="thirdFeature" placeholder="내용을 입력하세요" required></textarea>
            </div>
   			<div class="buttons">
   				<button type="button" class="btn btn-cancel" onclick="window.history.back();">취소</button>
	            <button type="button" class="btn btn-submit" onclick="validation()">등록</button>
          	</div>
   		</form>
   	</div>

    <script>
      console.dir(document.getElementsByClassName("fileupload"));

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

      // Input File 파일명, 확장자만 나오게 커스텀
      let fileInput = document.querySelector('.filebox .file');
      let nameInput = document.querySelector('.filebox .upload-name');
      fileInput.addEventListener('change', function (e) {
        const input = e.target.closest('.file');
        if (!input) return;
        let fileName = input.value.split('/').pop().split('\\').pop();
        nameInput.value = fileName;
      });
    </script>
  </body>
</html>
