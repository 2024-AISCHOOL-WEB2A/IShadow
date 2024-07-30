<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<style>
@font-face {
	font-family: 'Maplestory Bold';
	src: url('assets/font/Maplestory Bold.ttf') format('truetype');
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-color: #2c003e;
	margin: 0;
	font-family: 'Maplestory Bold', Arial, sans-serif; /* 폰트 패밀리 우선 순위 지정 */
}

.login-container {
	text-align: center;
	background-color: #3b004d;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	width: 33%;
	max-width: 500px;
	min-width: 300px;
}

.login-container h1 {
	color: #ffffff;
	margin-bottom: 10px;
	font-size: 48px; /* 글씨 크기 키움 */
}

.login-container h2 {
	color: #ffffff;
	margin-bottom: 30px;
	font-size: 24px; /* 관리자 페이지를 나타내는 텍스트 크기 */
}

.login-container input[type="text"], .login-container input[type="password"], .login-container button {
	width: calc(100% - 30px); /* 동일한 너비로 설정 */
	padding: 15px; /* 패딩 조정 */
	margin: 10px 15px; /* 좌우 마진 추가 */
	border: none;
	border-radius: 5px;
	outline: none;
	font-size: 18px; /* 글씨 크기 조정 */
	font-family: 'Maplestory Bold', Arial, sans-serif; /* 폰트 패밀리 우선 순위 지정 */
	box-sizing: border-box; /* 박스 크기 조정 */
}

.login-container button {
	background-color: #ff0000;
	color: #ffffff;
	font-size: 20px; /* 글씨 크기 조정 */
	cursor: pointer;
}

.login-container button:hover {
	background-color: #cc0000;
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>관리자 페이지</h2> <!-- 관리자 페이지 텍스트 추가 -->
		<h1>아이 shadow</h1>
		<form action="AdminLoginService" method="post"> <!-- 폼 추가 -->
			<input type="text" name="u_id" placeholder="아이디" required /> 
			<input type="password" name="u_pw" placeholder="비밀번호" required />
			<button type="submit">로그인하기</button>
		</form>
	</div>
</body>
</html>
