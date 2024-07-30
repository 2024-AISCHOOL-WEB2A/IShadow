<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.aischool.model.Qa"%>
<%@ page import="com.aischool.model.QaDAO"%>
<%
int qa_idx = Integer.parseInt(request.getParameter("qa_idx"));
QaDAO qaDAO = new QaDAO();
Qa qa = qaDAO.selectQaById(qa_idx);
String adminComment = qa.getAdmin_comment();
if (adminComment == null || adminComment.trim().isEmpty()) {
    adminComment = "관리자가 확인중에 있습니다.";
}
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
	href="assets/css/request-page-post.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
@font-face {
	font-family: 'Maplestory Bold';
	src: url('assets/font/Maplestory Light.ttf') format('truetype');
}

body {
	font-family: 'Maplestory Bold', sans-serif !important;
	color: white !important;
	margin: 0;
	background: url('assets/img/background.png') no-repeat center center
		fixed;
	background-size: cover;
}

.header-fixed {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
}

.container-center-horizontal {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	min-height: 100vh;
	padding-top: 100px; /* Adjust padding to account for the fixed header height */
}

.request-page-post {
	width: 80%;
	background-color: rgba(255, 255, 255, 0); /* Adjust transparency here */
}

.overlap-group {
	width: 100%;
	min-height: 100vh;
}

.section {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
	width: 100%;
}

.section-large {
	flex-direction: column;
	align-items: flex-start;
}

.label {
	font-size: 24px;
	font-weight: bold;
	margin-right: 10px;
	width: 150px;
}

.value {
	font-size: 24px;
	font-weight: normal;
	border: 2px solid yellow;
	border-radius: 15px;
	padding: 10px; /* Added padding */
	background: transparent;
	width: calc(100% - 170px);
	box-sizing: border-box;
}

.value-large {
	width: -webkit-fill-available;
    box-sizing: border-box;
    margin-top: 10px;
    height: 200px;
}
</style>
</head>
<body>
	<!-- header -->
	<div class="header-fixed">
		<%@ include file="header.jsp"%>
	</div>
	
	<div class="container-center-horizontal">
		<div class="request-page-post screen">
			<div class="overlap-group">
				<div class="section">
					<div class="label">제목</div>
					<div class="value"><%=qa.getQa_title()%></div>
				</div>
				<div class="section">
					<div class="label">작성자</div>
					<div class="value"><%=qa.getU_id()%></div>
				</div>
				<div class="section">
					<div class="label">작성일</div>
					<div class="value"><%=qa.getQa_d_at()%></div>
				</div>
				<div class="section section-large">
					<div class="label">내용</div>
					<div class="value value-large"><%=qa.getQa_content()%></div>
				</div>
				<div class="section">
					<div class="label">관리자 댓글</div>
					<div class="value"><%=adminComment%></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
