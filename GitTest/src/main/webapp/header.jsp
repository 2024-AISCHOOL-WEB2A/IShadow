<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background-color: rgba(0, 0, 0, 0.7);
	position: relative;
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
}
</style>
<div class="header">
	<!-- 로고 이미지 -->
	<div class="">
		<a href="main.jsp"> <img class="header-logo"
			src="assets/img/---1.png" alt="1" />
		</a>
	</div>

	<!-- header 이미지 -->
	<div class="header-menu">
		<div class="header-menu-item">
			<img src="assets/img/story.svg" alt="동화" />
			<div>동화</div>
		</div>
		<div class="header-menu-item">
			<img src="assets/img/game.png" alt="캐치마인드" />
			<div>캐치마인드</div>
		</div>
		<div class="header-menu-item">
			<img src="assets/img/commu.png" alt="커뮤니티" />
			<div>커뮤니티</div>
		</div>
		<div class="header-menu-item">
			<img src="assets/img/QA.png" alt="Q&A" />
			<div>Q&A</div>
		</div>
	</div>
</div>
