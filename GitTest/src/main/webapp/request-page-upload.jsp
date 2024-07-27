<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.aischool.model.Login" %>
<%
    // 세션에서 로그인한 사용자 정보 가져오기
    Login loginMemberPage = (Login) session.getAttribute("login_member");
    String u_id = "";
    if (loginMemberPage != null) {
        u_id = loginMemberPage.getU_id(); // u_id 값으로 설정
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1920, maximum-scale=1.0" />
    <link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
    <meta name="og:type" content="website" />
    <meta name="twitter:card" content="photo" />
    <link rel="stylesheet" type="text/css" href="assets/css/request-page-upload.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
    <style>
        @font-face {
            font-family: 'Maplestory Bold';
            src: url('assets/font/Maplestory Light.ttf') format('truetype');
        }

        .form-container {
            width: 100%;
            max-width: 800px; /* 크기를 키움 */
            margin: 0 auto;
            padding: 40px; /* 패딩을 키움 */
            background-color: transparent; /* 투명 배경 */
            border-radius: 20px; /* 더 둥글게 */
            border: 2px solid yellow; /* 노란색 경계 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: white; /* 기본 텍스트 색상 흰색 */
            font-family: 'Maplestory Bold'; /* 메이플체 */
        }

        .form-group {
            margin-bottom: 20px; /* 간격을 키움 */
        }

        .form-group label {
            display: block;
            margin-bottom: 10px; /* 간격을 키움 */
            font-weight: bold;
            font-size: 18px; /* 폰트 크기를 키움 */
            color: white; /* 라벨 텍스트 색상 흰색 */
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 15px; /* 패딩을 키움 */
            border: 2px solid yellow; /* 노란색 경계 */
            border-radius: 20px; /* 더 둥글게 */
            box-sizing: border-box;
            font-size: 16px; /* 폰트 크기를 키움 */
            background-color: transparent; /* 투명 배경 */
            color: white; /* 텍스트 색상 흰색 */
            font-family: 'Maplestory Bold'; /* 메이플체 */
        }

        .form-group textarea {
            height: 200px; /* 텍스트 영역의 높이를 키움 */
        }

        .buttons {
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 15px 30px; /* 패딩을 키움 */
            border: none;
            border-radius: 20px; /* 더 둥글게 */
            cursor: pointer;
            font-size: 18px; /* 폰트 크기를 키움 */
            font-family: 'Maplestory Bold'; /* 메이플체 */
        }

        .btn-cancel {
            background-color: transparent;
            color: white;
            border: 2px solid yellow; /* 노란색 경계 */
        }

        .btn-submit {
            background-color: yellow;
            color: black;
        }
    </style>
</head>
<body style="margin: 0; background: #000000">
    <input type="hidden" id="anPageName" name="page" value="request-page-upload" />
    <div class="container-center-horizontal">
        <div class="request-page-upload screen">
            <div class="overlap-group3">
                <!-- header -->
                <%@ include file="header.jsp" %>
                <h1 class="text-1 text" style="color: white;">해줘요</h1>
                <div class="form-container">
                    <form action="qaAllSelect" method="post">
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
                        </div>
                        <div class="form-group">
                            <label for="u_id">작성자</label>
                            <input type="text" id="u_id" name="u_id" value="<%= u_id %>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea id="content" name="content" placeholder="내용을 입력하세요" required></textarea>
                        </div>
                        <div class="buttons">
                            <button type="button" class="btn btn-cancel" onclick="window.history.back();">취소</button>
                            <button type="submit" class="btn btn-submit">등록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
