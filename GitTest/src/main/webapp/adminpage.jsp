<%@page import="com.aischool.model.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("getPosts");
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
<link rel="stylesheet" type="text/css" href="assets/css/admin-page1.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
.adminImage {
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지가 부모 영역을 꽉 채우도록 설정 */
    object-position: center; /* 이미지 중앙 정렬 */
}
</style>
</head>
<body style="margin: 0; background: #1e0338">
	<input type="hidden" id="anPageName" name="page" value="admin-page1" />
	<div class="container-center-horizontal">
		<div class="admin-page1 screen">
			<div class="group-2613113 group">
				<div class="mask-group">
					<img class="adminImage" src="AdminImg/admin.png" alt="관리자 사진">
				</div>
				<h1 class="text-1">관리자 페이지</h1>
				<div class="overlap-group-container">
					<div class="overlap-group1">
						<div class="text-2">
							<a href="AdminUserSelectAll">게시판</a>
						</div>
					</div>
					<div class="overlap-group-2">
						<div class="text-3">
							<a href="#">로그아웃</a>
						</div>
					</div>
				</div>
			</div>
			<div class="group-2613114 group">
				<div class="navbar-link-container poppins-bold-white-20px">
					<div class="navbar-link-text-4">게시글 번호</div>
					<div class="navbar-link-place">Date</div>
					<div class="navbar-link-user-name">user&nbsp;&nbsp;name</div>
					<div class="navbar-link-delete">delete</div>
				</div>

				<%
				for (int i = 0; i < posts.size(); i++) {
				%>
				<div class="overlap-group3">
					<div class="number-1 poppins-bold-white-16px"><%=i+1%></div>
					<div class="date poppins-normal-white-16px"><%=posts.get(i).getCreate_at()%></div>
					<div class="nlnh poppins-bold-white-16px"><%=posts.get(i).getUser()%></div>
					<div class="overlap-group10">
						<div class="text-5 poppins-bold-white-14px"<%-- onclick="postDelete('<%=posts.get(i).getIdx()%>')" --%>>삭제하기</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<script>
		/* 봉인 */
		function postDelete(idx) {
			let form = document.createElement("form");
			form.method = "POST";
			form.action = "AdminPostDelete";

			let input = document.createElement("input");
			input.type = "hidden";
			input.name = "postIDX";
			input.value = idx;

			form.appendChild(input);
			document.body.appendChild(form);
			form.submit();
		}
	</script>
</body>
</html>
