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
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
@font-face {
    font-family: 'Maplestory Bold';
    src: url('assets/font/Maplestory Bold.ttf') format('truetype');
}

body {
	background-color: #1e0338; /* 어두운 보라색 배경 */
	color: #FFFFFF; /* 흰색 글자 */
	font-family: 'Maplestory Bold', sans-serif; /* 폰트 패밀리 추가 */
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.overlap-group {
	background-color: #424874; /* 약간 밝은 보라색 배경 */
	padding: 30px;
	border-radius: 10px;
	width: 80%;
	max-width: 800px;
}

.section {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
}

.label {
	font-weight: bold;
	width: 20%;
	margin-right: 10px; /* label과 value 사이의 공간 추가 */
	font-family: 'Maplestory Bold', sans-serif; /* 폰트 패밀리 추가 */
}

.value {
	width: 100%;
	background-color: #4a176800; /* 투명 배경 */
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #FFFFFF; /* 흰색 경계선 */
	font-family: 'Maplestory Bold', sans-serif; /* 폰트 패밀리 추가 */
}

.section-large {
	flex-direction: column;
	align-items: flex-start;
}

.section-large .value-large {
	width: 100%;
	height: 150px;
	overflow-y: auto;
	margin-top: 10px;
}

.input-section {
	display: flex;
	align-items: center;
	gap: 10px;
}

input[type="text"] {
	flex-grow: 1;
	padding: 10px;
	border-radius: 5px;
	border: none;
	background-color: #4a176800; /* 투명 배경 */
	border: 1px solid #FFFFFF; /* 흰색 경계선 */
	color: #FFFFFF;
	font-family: 'Maplestory Bold', sans-serif; /* 폰트 패밀리 추가 */
}

button {
	padding: 10px 20px;
	border-radius: 5px;
	border: none;
	background-color: #a6b1e1;
	color: #424874;
	cursor: pointer;
	font-family: 'Maplestory Bold', sans-serif; /* 폰트 패밀리 추가 */
}
</style>
</head>
<body>
	<div class="overlap-group">
		<div class="section">
			<div class="label">제목</div>
			<div class="value"><%=qa.getQa_title()%></div>
		</div>
		<div class="section">
			<div class="label">작성자</div>
			<div class="value"><%=qa.getQa_idx()%></div>
		</div>
		<div class="section">
			<div class="label">작성일</div>
			<div class="value"><%=qa.getQa_d_at()%></div>
		</div>
		<div class="section section-large">
			<div class="label">내용</div>
			<div class="value value-large"><%=qa.getQa_content()%></div>
		</div>
		<div class="section input-section">
			<div class="label">관리자 댓글</div>
			<form action="InsertComment" class="comment">
				<input type="hidden" value="<%=qa.getQa_idx()%>" name="idx">
				<input type="text" placeholder="관리자 댓글을 입력하세요" name="comment">
				<button onclick="action()">등록</button>
			</form>
		</div>
	</div>
<script>
	function action(){
		let form = document.querySelector(".comment");
		form.submit();
	}
</script>
</body>
</html>
	