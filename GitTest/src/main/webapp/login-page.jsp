<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.aischool.model.Login" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=1440, maximum-scale=1.0" />
<link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
<meta name="og:type" content="website" />
<meta name="twitter:card" content="photo" />
<link rel="stylesheet" type="text/css" href="assets/css/login-page.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
<link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
</head>
<body style="margin: 0; background: #000000" class="">
   <input type="hidden" id="anPageName" name="page" value="login-page" />
   <div class="container-center-horizontal">
      <div class="login-page screen">
         <div class="overlap-group2">
            <img class="zcc-2 animate-enter4" src="assets/img/zcc-1-1.png" alt="zcc 2" />
            <div class="btndefault">
                  <input type="button" value="LogIn" class="buttonfit" onclick="Login()">
            </div>
            <div class="loginidstate3">
               <div class="overlap-group">
                  <div class="group-3">
                     <div class="ellipse-5"></div>
                     <img class="rectangle-8" src="assets/img/login_page/rectangle-8.svg" alt="Rectangle 8" />
                  </div>
                  <div class="text">
                     <input type="text" name="u_id" class="email" placeholder="ID을 입력하세요">
                  </div>
               </div>
            </div>
            <div class="loginidstate3-1">
               <div class="overlap-group">
                  <div class="group-3">
                     <div class="ellipse-5"></div>
                     <img class="rectangle-8" src="assets/img/login_page/rectangle-8.svg" alt="Rectangle 8" />
                  </div>
                  <div class="text">
                     <input type="password" name="u_pw" class="pw" placeholder="PW를 입력하세요">
                  </div>
               </div>
            </div>
            <div class="rectangle-65"></div>
            <div class="text-78 text-1">회원 가입</div>
            <div class="rectangle-66"></div>
            <div class="text-79 text-1">비밀번호 찾기</div>
         </div>
      </div>
   </div>
   <script>
    function Login(){
        let iD = document.getElementsByClassName("email")[0];
        let pW = document.getElementsByClassName("pw")[0];
        let form = document.createElement("form");
        let body = document.body;
        let iD_Input = document.createElement("input");
        let pW_Input = document.createElement("input");
        form.action = "LoginService";
        form.method = "POST";
        
        iD_Input.type = "hidden";
        pW_Input.type = "hidden";
        iD_Input.name = "u_id";
        pW_Input.name = "u_pw";
        iD_Input.value = iD.value;
        pW_Input.value = pW.value;
        form.appendChild(iD_Input);
        form.appendChild(pW_Input);
        body.appendChild(form);
        form.submit();  
    }
   </script>
</body>
</html>
