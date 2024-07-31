<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.aischool.model.Login"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=1440, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png"
    href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/login-page.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
    @font-face {
        font-family: 'Maplestory Bold';
        src: url('assets/font/Maplestory Bold.ttf') format('truetype');
    }
    body, input, button {
        font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 패밀리 추가 */
        color: white !important;
    }
    body {
        margin: 0 !important;
        background: url('assets/img/background.png') no-repeat center center fixed !important; /* 배경 이미지 추가 */
        overflow: hidden !important; /* 스크롤 없애기 */
        width: 100% !important;
        display: flex !important;
        justify-content: center !important;
        align-items: center !important;
        height: 100vh !important;
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
    }
    .title {
        font-size: 42px !important; /* 크기 증가 */
        font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 패밀리 추가 */
        margin-bottom: 30px !important; /* 간격 증가 */
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
        color: black !important; /* 텍스트 색상 검은색으로 변경 */
    }
    .button {
        width: 100% !important;
        font-family: 'Maplestory Bold', sans-serif; /* 폰트 패밀리 추가 */
        padding: 25px !important; /* 패딩 증가 */
        margin: 20px 0 !important; /* 간격 증가 */
        box-sizing: border-box !important;
        border: 2px solid #ffe077 !important;
        border-radius: 15px !important;
        background: none !important;
        color: white !important;
        font-size: 24px !important; /* 크기 증가 */
        cursor: pointer !important;
    }
    .link-buttons {
        display: flex !important;
        justify-content: space-between !important;
        width: 100% !important;
        font-family: 'Maplestory Bold', sans-serif; /* 폰트 패밀리 추가 */
    }
    .link-button {
        font-family: 'Maplestory Bold', sans-serif; /* 폰트 패밀리 추가 */
        flex: 1 !important;
        padding: 25px !important; /* 패딩 증가 */
        margin: 0 10px !important; /* 간격 증가 */
        box-sizing: border-box !important;
        border: 2px solid #ffe077 !important;
        border-radius: 15px !important;
        background: none !important;
        font-size: 18px !important; /* 크기 증가 */
        text-align: center !important;
        cursor: pointer !important;
    }
</style>
</head>
<body>
    <input type="hidden" id="anPageName" name="page" value="login-page" />
    <div class="overlap-group2">
        <div class="title">아이 Shadow</div>
        <input type="text" name="u_id" class="input-field email" placeholder="아이디를 입력하세요">
        <input type="password" name="u_pw" class="input-field pw" placeholder="비밀번호를 입력하세요">
        <input type="button" value="로그인" class="button" onclick="Login()">
        <div class="link-buttons">
            <div class="link-button" onclick="location.href='register.jsp'">회원 가입</div>
            <div class="link-button" onclick="location.href='find_id.jsp'">아이디 찾기</div>
            <div class="link-button" onclick="location.href='find_password.jsp'">비밀번호 찾기</div>
        </div>
    </div>
    <script>
        function Login() {
            let iD = document.getElementsByClassName("email")[0];
            let pW = document.getElementsByClassName("pw")[0];
            let form = document.createElement("form");
            let body = document.body;
            let iD_Input = document.createElement("input");
            let pW_Input = document.createElement("input");
            form.action = "LoginService";
            form.method = "POST";

            iD_Input.type = "hidden";
            pW_Input.type = "hidden";
            iD_Input.name = "u_id";
            pW_Input.name = "u_pw";
            iD_Input.value = iD.value;
            pW_Input.value = pW.value;
            form.appendChild(iD_Input);
            form.appendChild(pW_Input);
            body.appendChild(form);
            form.submit();
        }
    </script>
</body>
</html>
