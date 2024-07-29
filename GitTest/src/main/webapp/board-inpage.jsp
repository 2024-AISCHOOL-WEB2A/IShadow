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
<!--<meta name=description content="This site was generated with Anima. www.animaapp.com"/>-->
<!-- <link rel="shortcut icon" type=image/png href="https://animaproject.s3.amazonaws.com/home/favicon.png" /> -->
<meta name="viewport" content="width=1440, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png"
	href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css"
	href="assets/css/board-inpage.css" />
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
					alert("정답 입니다.");
				}else{
					alert("다시 입력해주세요");
				}
			},
			error: function(){
				alert("error");
			}
		});
	}
</script>
</head>
<body style="margin: 0; background: #000000">
	<div class="board-inpage">
		<div class="overlap-group">
			<!-- header -->
			<%@ include file="header.jsp"%>
			<div>
				<div>
					<div class="rectangle-37 rectangle">
						<div class="user"><%=postscomment.get(0).getU_id()%> 님의 작품</div>
					</div>

					<div class="rectangle-39 rectangle">
						<div class="text-12"><%=postscomment.get(0).getHint_1()%></div>
					</div>

					<div class="rectangle-43 rectangle">
						<div class="text-17"><%=postscomment.get(0).getHint_2()%></div>
					</div>

					<div class="rectangle-44 rectangle">
						<div class="text-16"><%=postscomment.get(0).getHint_3()%></div>
					</div>

				</div>
				<img class="image-5" src="assets/img/image-5.png" alt="image 5" />

				<div>
					<input type="hidden" id="idx" value="<%= postscomment.get(0).getPost_idx() %>">
					<div class=container>
						<div class="rectangle-40 rectangle"></div>
						<div class="text-13" id="answer"><%=postscomment.get(0).getPost_answer()%></div>
					</div>
					<div class="rectangle-41 rectangle"></div>
<!-- 					<div class="text-14">정답 입력창</div> -->
						<input type="text" id="inputans" class="text-14">
					</div>
						<div class=container>
							<div class="rectangle-42 rectangle"></div>
							<div class="text-15" onclick="testBtn();">확인해보기</div>
					</div>
			</div>
		</div>

	</div>

	</div>
</body>