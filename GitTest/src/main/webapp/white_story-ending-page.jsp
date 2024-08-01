<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="assets/css/white_story-ending-page.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
</head>

<style>
html, body {
   margin: 0;
   padding: 0;
   height: 100%;
   width: 100%;
   overflow: hidden;
}

.overlap-group {
   position: relative;
   width: 200px; /* Adjust size as needed */
   height: 250px; /* Adjust size as needed */
}
.text-48 {
   position: absolute;
   bottom: 25px; /* Adjust to position text inside the rectangle */
   left: 50%; /* Center the text */
   transform: translateX(-50%);
   color: white;
   font-size: 33px; /* Adjust size as needed */
}
.rectangle {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   
}
.image {
   width: 65%;
   height: auto;
   position: relative;
   margin-top: 5%; /* Adjust this value to move the image down */
   left: 0;
}
.image-121 {
   width: 65%;
   height: auto;
   position: absolute;
   top: 45%;
   left: 50%;
   transform: translate(-50%, -50%);
}
</style>
<body style="margin: 0; background: #000000">
<%@ include file="white_headerheader.jsp"%>
   <input type="hidden" id="anPageName" name="page" value="stroy-ending-page" />
   
   <div class="container-center-horizontal">
   
      <div class="stroy-ending-page screen">
      
      
         <div class="overlap-group-1">
            <img class="background-2" src="assets/img/white_background.png" alt="background 2" />
            <!-- header -->
            

            <div>
               <div class="group-3">
                  <a href="white_main.jsp">
                     <div class="overlap-group">
                        <div class="rectangle"></div>
                        <img class="image" src="assets/img/white_gohome.png" alt="image" />
                        <h1 class="text-48 inter-normal-white-40px">처음으로</h1>
                     </div>
                  </a>
               </div>
               <div class="group-4">
                  <a href="white_story-choice.jsp">
                     <div class="overlap-group">
                        <div class="rectangle"></div>
                        <img class="image-1" src="assets/img/white_replay.png" alt="image" />
                        <div class="text-48 inter-normal-white-40px">다시하기</div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>
