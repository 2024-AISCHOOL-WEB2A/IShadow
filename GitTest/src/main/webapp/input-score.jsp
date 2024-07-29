<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
  <link rel="shortcut icon" type="image/png" href="https://animaproject.s3.amazonaws.com/home/favicon.png" />
  <link rel="stylesheet" type="text/css" href="assets/css/input-score.css" />
  <link rel="stylesheet" type="text/css" href="assets/css/styleguide.css" />
  <link rel="stylesheet" type="text/css" href="assets/css/globals.css" />
</head>
<body style="margin: 0; background: #02173a">
  <input type="hidden" id="anPageName" name="page" value="input-score" />
  <div class="container-center-horizontal">
    <div class="input-score screen">
      <div class="container-box">
        <h1 class="title">00m 00s</h1>
        <div class="overlap-group1 overlap">
          <div class="text-50 text" onclick="showInput()">닉네임을 입력하세요.</div>
          <input type="text" class="input-field" placeholder="닉네임을 입력하세요" onblur="hideInput()" />
        </div>
        <a href="catchmind-result.jsp">
          <div class="group-2">
            <div class="overlap-group overlap3"><div class="text-49 text">확인</div></div>
          </div>
        </a>
      </div>
    </div>
  </div>
  <script>
    function showInput() {
      document.querySelector('.text-50').style.display = 'none';
      document.querySelector('.input-field').style.display = 'block';
      document.querySelector('.input-field').focus();
    }
    function hideInput() {
      if (document.querySelector('.input-field').value === '') {
        document.querySelector('.input-field').style.display = 'none';
        document.querySelector('.text-50').style.display = 'block';
      }
    }
  </script>
</body>
</html>
