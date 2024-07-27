<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.aischool.model.Login" %>
<%
    // 세션에서 로그인한 사용자 정보 가져오기
    Login loginMemberPage = (Login) session.getAttribute("login_member");
    String author = "";
    if (loginMemberPage != null) {
        author = loginMemberPage.getU_id();
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
            max-width: 800px;
            margin: 0 auto;
            padding: 40px;
            background-color: transparent;
            border-radius: 20px;
            border: 2px solid yellow;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: white;
            font-family: 'Maplestory Bold';
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 18px;
            color: white;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 15px;
            border: 2px solid yellow;
            border-radius: 20px;
            box-sizing: border-box;
            font-size: 16px;
            background-color: transparent;
            color: white;
            font-family: 'Maplestory Bold';
        }

        .form-group textarea {
            height: 200px;
        }

        .buttons {
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 15px 30px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 18px;
            font-family: 'Maplestory Bold';
        }

        .btn-cancel {
            background-color: transparent;
            color: white;
            border: 2px solid yellow;
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
                    <form action="qaAllSelect" method="post" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
                        </div>
                        <div class="form-group">
                            <label for="author">작성자</label>
                            <input type="text" id="author" name="author" value="<%= author %>" readonly>
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
