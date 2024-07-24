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
	href="assets/css/choice-1-or-2.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	width: 100%;
	overflow: hidden;
}

.centered-div-container {
	display: flex; /* Flexbox 사용 */
	justify-content: center; /* 수평 중앙 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	height: 100vh; /* 부모 컨테이너의 높이를 100%로 설정 */
	position: relative;
	bottom: 220px; /* 요소를 아래로 100px 이동 */
}


.text-105, .text-106 {
	color: white; /* 텍스트 색상을 흰색으로 설정 */
	font-family: 'Maplestory Bold', sans-serif; /* 폰트 패밀리 추가 */
	text-align: center; /* 텍스트 중앙 정렬 */
}

.rectangle-5, .rectangle-4 {
	width: 200px; /* 버튼의 너비 조정 */
	height: 50px; /* 버튼의 높이 조정 */
	background-color: rgba(255, 255, 255, 0.2); /* 버튼 배경색과 투명도 조정 */
	border-radius: 10px; /* 버튼의 모서리를 둥글게 조정 */
	margin-top: 10px; /* 텍스트와 버튼 간격 조정 */
}

a:hover .rectangle-5, a:hover .rectangle-4 {
	background-color: rgba(255, 255, 255, 0.4); /* 호버 시 버튼 배경색 변경 */
	
}
</style>
</head>
<body style="margin: 0; background: #000000">
	<input type="hidden" id="anPageName" name="page" value="choice-1-or-2" />
	<div class="choice-1-or-2 screen">
		<div class="overlap-group1 inter-normal-white-40px">

			<%@ include file="header.jsp"%>

			<div class="centered-div-container">
				<a href="catchmind.jsp">
					<div class="text-105">둘이서</div>
					<div class="rectangle-5 rectangle"></div>
				</a> <a href="catchmind.jsp">
					<div class="text-106">혼자서</div>
					<div class="rectangle-4 rectangle"></div>
				</a>
			</div>
		</div>
	</div>
</body>
</html>

