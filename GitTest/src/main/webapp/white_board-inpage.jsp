<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.aischool.model.PostComments"%>
<%
	ArrayList<PostComments> postscomment = (ArrayList<PostComments>)request.getAttribute("getPostComment");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" type="image/png"
	href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css"
	href="assets/css/white_board-inpage.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	function testBtn(){
		let input = document.getElementById("inputans");
		let idx = document.getElementById("idx");
		$.ajax({
			type: "post",
			data: "input="+(input.value)+"&idx="+(idx.value),
			url:"PostsCorrectAnswer",
			dataType:"text",
			success: function(result){
				if(result == "ok"){
					showResult("O");
				}else{
					showResult("X");
				}
			},
			error: function(){
				alert("error");
			}
		});
	}

	function showResult(result){
		let resultDiv = document.createElement("div");
		resultDiv.innerHTML = result;
		resultDiv.style.position = "fixed";
		resultDiv.style.top = "50%";
		resultDiv.style.left = "50%";
		resultDiv.style.transform = "translate(-50%, -50%)";
		resultDiv.style.fontSize = "100px";
		resultDiv.style.color = result == "O" ? "green" : "red";
		document.body.appendChild(resultDiv);
		setTimeout(() => { document.body.removeChild(resultDiv); }, 1000);
	}

	function toggleHint(hintNumber){
		let hintElement = document.getElementById("hint" + hintNumber);
		if(hintElement.innerText.startsWith("힌트")){
			let hintText = "";
			if(hintNumber === 1){
				hintText = "<%=postscomment.get(0).getHint_1()%>";
			} else if(hintNumber === 2){
				hintText = "<%=postscomment.get(0).getHint_2()%>";
			} else if(hintNumber === 3){
				hintText = "<%=postscomment.get(0).getHint_3()%>";
			}
			hintElement.innerText = hintText;
		} else {
			hintElement.innerText = "힌트 " + hintNumber;
		}
	}
</script>
<style>
	@font-face {
		font-family: 'Maplestory Bold';
		src: url('../font/Maplestory Bold.ttf') format('truetype');
	}
	body {
		font-family: 'Maplestory Bold', sans-serif !important; /* 폰트 패밀리 추가 */
		color: white !important;
		margin: 0 !important;
		background: url('assets/img/white_background.png') no-repeat center center fixed !important; /* 배경 이미지 추가 */
		background-size: cover !important;
	}
	.center-container {
		display: flex !important;
		justify-content: center !important;
		align-items: center !important;
		flex-direction: column !important;
		height: calc(100vh - 100px) !important; /* 헤더 높이를 제외한 나머지 */
	}
	.inline-items {
		display: flex !important;
		align-items: center !important;
		margin-top: 10px !important;
	}
	.inline-items > div, .inline-items > input, .inline-items > button {
		margin: 0 10px !important;
		padding: 15px !important; /* 패딩 추가 */
		border: 2px solid white !important;
		border-radius: 15px !important;
		color: #4bed !important;
		background: white !important;
		font-size: 24px !important; /* 글씨 크기 키움 */
		cursor: pointer !important;
	}
	.image-container {
		border: 2px solid white !important;
		border-radius: 15px !important;
		width: 80% !important; /* 고정된 크기 설정 */
		height: 500px !important; /* 고정된 높이 설정 */
		margin: 20px 0 !important;
		display: flex !important;
		justify-content: center !important;
		align-items: center !important;
		overflow: hidden !important; /* 이미지가 컨테이너를 벗어나지 않도록 */
	}
	.image-5 {
		width: auto;
		height: 100% 
	}
	.button {
		border: 2px solid white !important;
		border-radius: 15px !important;
		color: yellow !important;
		background: none !important;
		padding: 15px 30px !important; /* 패딩 추가 */
		font-size: 24px !important; /* 글씨 크기 키움 */
		cursor: pointer !important;
	}
</style>
</head>
<body>
	<div class="center-container">
		<!-- header -->
		<%@ include file="white_header.jsp"%>
		<div class="inline-items" style="width: 80% !important;">
			<div style="flex: 1; text-align: center !important;"><%=postscomment.get(0).getU_id()%> 님의 작품</div>
			<div id="hint1" onclick="toggleHint(1)" style="flex: 1; text-align: center !important;">힌트 1</div>
			<div id="hint2" onclick="toggleHint(2)" style="flex: 1; text-align: center !important;">힌트 2</div>
			<div id="hint3" onclick="toggleHint(3)" style="flex: 1; text-align: center !important;">힌트 3</div>
		</div>
		<div class="image-container">
			<img class="image-5" src="<%=postscomment.get(0).getPost_file() %>" alt="image 5" />
		</div>
		<div class="inline-items" style="width: 80% !important;">
			<div style="flex: 1; text-align: center !important;">정답:</div>
			<input type="text" id="inputans" style="flex: 2; font-size: 24px !important; padding: 15px !important;">
			<button class="button" onclick="testBtn();" style="flex: 1 !important;">확인해보기</button>
		</div>
		<input type="hidden" id="idx" value="<%= postscomment.get(0).getPost_idx() %>">
	</div>
</body>
</html>
