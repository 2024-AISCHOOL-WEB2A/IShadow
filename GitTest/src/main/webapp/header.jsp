<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=1440, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
@font-face {
	font-family: 'Maplestory Bold';
	src: url('assets/font/Maplestory Light.ttf') format('truetype');
}

.img-small {
  width: 30px !important;
  height: auto !important;
}

.img-medium {
  width: 80px !important;
  height: auto !important;
}

.img-large {
  width: 70px !important;
  height: auto !important;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	padding: 10px 20px;
	background-color: ; /* 배경색 필요 시 추가 */
	color: white;
	font-family: 'Maplestory Bold';
}

.header-left, .header-center, .header-right {
	display: flex;
	align-items: center;
}

.header-left {
	flex: 1; /* 왼쪽 요소의 너비를 자동으로 조정 */
	justify-content: flex-start; /* 왼쪽 정렬 */
}

.header-center {
	flex: 2; /* 가운데 요소의 너비를 두 배로 조정 */
	justify-content: center; /* 가운데 정렬 */
}

.header-right {
	flex: 1; /* 오른쪽 요소의 너비를 자동으로 조정 */
	justify-content: flex-end; /* 오른쪽 정렬 */
}

.header-logo {
	height: 70px;
}

.header-menu {
	display: flex;
	justify-content: center;
	flex-grow: 1;
	gap: 40px;
}

.header-menu-item {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.header-menu-item img {
  width: 40px;
  height: auto;
}

.header-menu-item div {
	margin-top: 5px;
	font-size: 16px;
	color: white;
	font-family: 'Maplestory Bold';
}

.login-button, .logout-button {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  font-family: 'Maplestory Bold';
  font-size: 16px;
  border-radius: 5px;
  cursor: pointer;
  text-decoration: none;
}

.login-button:hover {
  background-color: #0056b3;
}

.logout-button {
  background-color: transparent;
  color: #dc3545;
  border: none;
  padding: 10px 20px;
  font-family: 'Maplestory Bold';
  font-size: 16px;
  border-radius: 5px;
  cursor: pointer;
  text-decoration: underline;
}

.logout-button:hover {
  color: #c82333;
}

/* 인사말 스타일 */
.greeting {
  font-family: 'Maplestory Bold';
  color: white;
  font-size: 20px; /* 폰트 크기 크게 설정 */
}
</style>
</head>
<body>

<%
	// 로그아웃 처리
	if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("logout") != null) {
		session.invalidate(); // 세션을 무효화하여 로그인 상태를 해제
		response.sendRedirect(request.getRequestURI()); // 페이지를 새로 고침
		return; // 이후 코드 실행을 중지
	}
%>
<%-- <%
		// 세션 속성 설정 - 실제 로그인 후에 제거
		session.setAttribute("login_member", "testUser"); // 로그인 상태를 시뮬레이션
	%> --%>

<div class="header">
	<!-- 왼쪽: 로고 이미지 -->
	<div class="header-left">
		<a href="main.jsp"> 
			<img class="header-logo" src="assets/img/header/logo.png" />
		</a>
	</div>

	<!-- 가운데: 메뉴 이미지 -->
	<div class="header-center">
		<div class="header-menu">
			<div class="header-menu-item">
				<img src="assets/img/header/planet_2.png" alt="동화" class="img-medium" />
				<div>동화</div>
			</div>
			<div class="header-menu-item">
				<img src="assets/img/header/planet_3.png" class="img-medium"/>
				<div>캐치마인드</div>
			</div>
			<div class="header-menu-item">
				<img src="assets/img/header/planet_4.png" class="img-medium"/>
				<div>커뮤니티</div>
			</div>
			<div class="header-menu-item">
				<img src="assets/img/header/planet_5.png" class="img-medium"/>
				<div>Q&A</div>
			</div>
		</div>
	</div>

	<!-- 오른쪽: 로그인/로그아웃 버튼 및 인사말 -->
	<div class="header-right">
		<%
			// 세션 유효성 확인
			String loginMember = null;
			if (session != null) {
				loginMember = (String) session.getAttribute("login_member");
			}
		%>
		<% if (loginMember != null) { %>
			<div class="greeting">
				<%= loginMember %>님 안녕하세요
			</div>
			<form method="post" style="display:inline;">
				<button type="submit" name="logout" class="logout-button">로그아웃</button>
			</form>
		<% } else { %>
			<a href="login-page.jsp" class="login-button">로그인</a>
		<% } %>
	</div>
</div>
</body>
</html>
