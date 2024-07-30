<%@page import="com.aischool.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=1920, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png"
    href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css"
    href="assets/css/admin-select-user.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
</head>
<body style="margin: 0; background: #1e0338">
    <input type="hidden" id="anPageName" name="page"
        value="admin-select-user" />
    <div class="container-center-horizontal">
        <div class="admin-select-user screen">
            <div class="central-container">
                <div class="overlap-group-3">
                    <div class="ellipse-6"></div>
                    <h1 class="text-1">관리자 페이지</h1>
                    <div class="overlap-group-container">
                        <div class="overlap-group7">
                            <div class="text">
                                <a href="AdminPostSelectAll" style="color: #DCD6F7">게시판</a>
                            </div>
                        </div>
                        <div class="overlap-group4">
                            <div class="text">
                                <a href="#" style="color: #DCD6F7">로그아웃</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-row">
                    <div class="id">회원 ID</div>
                    <div class="text-3">닉네임</div>
                    <div class="place">DATE</div>
                    <div class="text-4">삭제</div>
                </div>
                <img class="line-12" src="assets/img/line-12.svg" alt="Line 12" />
                <%
                for (int i = 0; i < users.size(); i++) {
                %>
                <div class="overlap-group">
                    <div class="a"><%=users.get(i).getId()%></div>
                    <div class="nlnh"><%=users.get(i).getNick()%></div>
                    <div class="date"><%=users.get(i).getJoindate()%></div>
                    <div class="overlap-group9">
                        <div class="text-6"
                            onclick="userDelete('<%=users.get(i).getId()%>')">삭제하기</div>
                    </div>
                </div>
                <%
                }
                %>
            </div>
        </div>
    </div>
    <script>
        function userDelete(id) {
            let form = document.createElement("form");
            form.method = "POST";
            form.action = "AdminUserDelete";

            let input = document.createElement("input");
            input.type = "hidden";
            input.name = "userID";
            input.value = id;

            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();
        }
    </script>
</body>
</html>
