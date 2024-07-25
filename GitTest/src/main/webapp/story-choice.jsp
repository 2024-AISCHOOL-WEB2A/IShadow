<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<!--<meta name=description content="This site was generated with Anima. www.animaapp.com"/>-->
<!-- <link rel="shortcut icon" type=image/png href="https://animaproject.s3.amazonaws.com/home/favicon.png" /> -->
<meta name="viewport" content="width=1440, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/stroy-choice.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
<style>
html, body {
    margin: 0;
    padding: 0;
    height: 100%;
    width: 100%;
    overflow: hidden;
}
.view-container {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 20px;
}
.view-1, .view-2, .view-3, .view {
    display: flex;
    flex-direction: column;
    align-items: center;
    color: white;
    text-align: center;
}
.ellipse-1 {
    width: 15vw;
    height: 15vw;
    border-radius: 50%;
    margin-right: 0.14vw;
    object-fit: cover;
}
</style>
<script>
function submitForm(name) {
    let form = document.createElement('form');
    form.method = 'POST';
    form.action = 'ChoiceStory';

    let input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'story';
    input.value = name;

    form.appendChild(input);
    document.body.appendChild(form);
    form.submit();
}
</script>
</head>
<body style="margin: 0; background: #000000">
    <input type="hidden" id="anPageName" name="page" value="stroy-choice" />
    <div class="container-center-horizontal">
        <div class="stroy-choice screen">
            <div class="flex-col">
            	<!-- header -->
                <%@ include file="header.jsp" %>
                
                <!-- 동화선택 -->
                <div class="view-container">
                    <a href="ChoiceStory">
                        <div class="view-1">
                            <img class="ellipse-1" src="assets/img/ellipse-1@2x.png" alt="Ellipse 1" />
                            <h1 class="text-40">빨간 모자</h1>
                        </div>
                    </a>
                    <a href="ChoiceStory">
                        <div class="view-1">
                            <img class="ellipse-1" src="assets/img/Heungbun and Nolbun.png" alt="Ellipse 1" />
                            <h1 class="text-40">흥부 놀부</h1>
                        </div>
                    </a>
                    <a href="ChoiceStory">
                        <div class="view-1">
                            <img class="ellipse-1" src="assets/img/ellipse-1-2@2x.png" alt="Ellipse 1" />
                            <h1 class="text-40">플란다스의 개</h1>
                        </div>
                    </a>
                </div>
                <div class="view-container">
                    <div onclick="submitForm(this.querySelector('.hiddenName').name)">
                        <div class="view-1">
                            <img class="ellipse-1" src="assets/img/ellipse-1-3@2x.png" alt="Ellipse 1" />
                            <div class="text-40">해와 달이된 오누이></div>
                            <input class="hiddenName" type="hidden" name="해와 달이 된 오누이">
                        </div>
                    </div>
                    <a href="ChoiceStory">
                        <div class="view-1">
                            <img class="ellipse-1" src="assets/img/ellipse-1-4@2x.png" alt="Ellipse 1" />
                            <div class="text-40">토끼와 거북이</div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
