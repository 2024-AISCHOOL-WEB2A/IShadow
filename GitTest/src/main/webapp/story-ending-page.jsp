<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=1440, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/story-ending-page.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	width: 100%;
	overflow: hidden;
	display: flex;
	justify-content: center;
	align-items: center;
	background: #000000;
}
.container {
	display: flex;
	gap: 50px; /* Add space between the buttons */
}
.overlap-group {
	position: relative;
	width: 200px; /* Adjust size as needed */
	height: 250px; /* Adjust size as needed */
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.text-48 {
	position: absolute;
	bottom: 25px; /* Adjust to position text inside the rectangle */
	left: 50%; /* Center the text */
	transform: translateX(-50%);
	color: white;
	font-size: 15px; /* Reduced font size */
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
}
.image-1 {
	width: 65%;
	height: auto;
	position: relative;
}
.text-48-centered {
	text-align: center;
	position: absolute;
	bottom: 25px;
	left: 50%;
	transform: translateX(-50%);
	color: white;
	font-size: 15px; /* Reduced font size */
}
</style>
</head>
<body>
	<input type="hidden" id="anPageName" name="page" value="stroy-ending-page" />
	<div class="stroy-ending-page screen">
		<div class="overlap-group-1">
			<img class="background-2" src="assets/img/background.png" alt="background 2" />
			<!-- header -->
			<%@ include file="header.jsp"%>

			<div class="container">
				<div class="group-3">
					<a href="main.jsp">
						<div class="overlap-group">
							<div class="rectangle"></div>
							<img class="image" src="assets/img/------.png" alt="image" />
							<h1 class="text-48 inter-normal-white-40px">처음으로</h1>
						</div>
					</a>
				</div>
				<div class="group-4">
					<a href="story-choice.jsp">
						<div class="overlap-group">
							<div class="rectangle"></div>
							<img class="image-1" src="assets/img/catchmind_ranking/--------.png" alt="image" />
							<div class="text-48 text-48-centered inter-normal-white-40px">다시하기</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
