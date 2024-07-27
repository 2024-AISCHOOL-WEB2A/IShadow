<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=1440, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png"
	href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
@font-face {
	font-family: 'Maplestory Bold';
	src: url('assets/font/Maplestory Light.ttf') format('truetype');
}

.header {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	padding: 10px 20px;
	background-color: ;
	position: relative;
	color: white; /* Set the text color to white */
	font-family: 'Maplestory Bold'; /* Apply the Maplestory font */
}

.header-logo {
	height: 70px;
	position: absolute;
	left: 20px;
	top: 10px; /* 위로 10px 이동 */
}

.header-menu {
	display: flex;
	gap: 40px;
}

.header-menu-item {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.header-menu-item img {
	width: 40px;
	height: 40px;
}

.header-menu-item div {
	margin-top: 5px;
	font-size: 16px;
	color: white; /* Ensure text color is white */
	font-family: 'Maplestory Bold'; /* Apply the Maplestory font */
}
</style>
</head>
<body>
	<div class="header">
		<!-- 로고 이미지 -->
		<div class="">
			<a href="white_main.jsp"> <img class="header-logo" src="assets/img/header/logo.png" />
			</a>
		</div>

		<!-- header 이미지 -->
		<div class="header-menu">
			<div class="header-menu-item">
				<img src="assets/img/header/story.svg" alt="동화" />
				<div>동화</div>
			</div>
			<div class="header-menu-item">
				<img src="assets/img/header/game.png"/>
				<div>캐치마인드</div>
			</div>
			<div class="header-menu-item">
				<img src="assets/img/header/commu.png"/>
				<div>커뮤니티</div>
			</div>
			<div class="header-menu-item">
				<img src="assets/img/header/QA.png"/>
				<div>Q&A</div>
			</div>
		</div>
	</div>
</body>
</html>
