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
<!--<meta name=description content="This site was generated with Anima. www.animaapp.com"/>-->
<!-- <link rel="shortcut icon" type=image/png href="https://animaproject.s3.amazonaws.com/home/favicon.png" /> -->
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
		<div class="admin-select-user museumclassic-medium-black-16px screen">
			<div class="flex-row flex">
				<div class="id">회원 ID</div>
				<div class="flex-col flex">
					<div class="overlap-group-3">
						<div class="ellipse-6"></div>
						<h1 class="text-1">관리자 페이지</h1>
					</div>
					<div class="overlap-group-container">
						<div class="overlap-group7">
							<div class="text museumclassic-medium-white-12px">
								<a href="AdminPostSelectAll">게시판</a>
							</div>
						</div>
						<div class="overlap-group4">
							<div class="text museumclassic-medium-white-12px">
								<a href="#">로그아웃</a>
							</div>
						</div>
					</div>
					<div class="text-3 museumclassic-medium-white-15px">닉네임</div>
				</div>
				<div class="place museumclassic-medium-white-15px">DATE</div>
				<div class="text-4 museumclassic-medium-white-15px">삭제</div>
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
					<div class="text museumclassic-medium-white-12px"
						onclick="userDelete('<%=users.get(i).getId()%>')">삭제하기</div>
				</div>
			</div>
			<%
			}
			%>
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
