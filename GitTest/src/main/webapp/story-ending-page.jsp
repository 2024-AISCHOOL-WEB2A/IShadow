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
	href="assets/css/stroy-ending-page.css" />
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
</style>
<body style="margin: 0; background: #000000">
	<input type="hidden" id="anPageName" name="page"
		value="stroy-ending-page" />
	<div class="container-center-horizontal">
		<div class="stroy-ending-page screen">
			<div class="overlap-group-1">
				<img class="background-2" src="assets/img/background.png"
					alt="background 2" />
				<!-- header -->
				<%@ include file="header.jsp"%>

				<div>
					<div class="group-3">
						<a href="main.jsp">
							<div class="overlap-group">
								<h1 class="text-99">처음으로</h1>
								<img class="image" src="assets/img/------.png" alt="image" />
								<div class="rectangle"></div>
							</div>
						</a>
					</div>
					<div class="group-4">
						<a href="story-choice.jsp">
							<div class="overlap-group">
								<div class="text-99">다시하기</div>
								<img class="image-1" src="assets/img/--------.png" alt="image" />
								<div class="rectangle"></div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
