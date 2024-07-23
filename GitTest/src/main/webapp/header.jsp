<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
@font-face {
    font-family: 'Maplestory Bold';
    src: url('assets/font/Maplestory Light.ttf') format('truetype');
}

.header {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    padding: 10px 20px;
    background-color: rgba(0, 0, 0, 0.7);
    position: relative;
}

.header-logo {
    height: 70px;
    position: absolute;
    left: 20px;
    top: 10px; /* 위로 10px 이동 */
}

.header-menu {
    display: flex;
    gap: 40px;
}

.header-menu-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    color: white;
    font-family: 'Maplestory Bold', sans-serif; /* 폰트 패밀리 추가 */
}

.header-menu-item img {
    width: 40px;
    height: 40px;
}

.header-menu-item div {
    margin-top: 5px;
    font-size: 16px;
}
</style>
<div class="header">
    <!-- 로고 이미지 -->
    <div class="">
        <img class="header-logo" src="assets/img/---1.png" alt="1" />
    </div>

    <!-- header 이미지 -->
    <div class="header-menu">
        <div class="header-menu-item">
            <img src="assets/img/frame-8.svg" alt="게시판" />
            <div>게시판</div>
        </div>
        <div class="header-menu-item">
            <img src="assets/img/image-9.png" alt="동화" />
            <div>동화</div>
        </div>
        <div class="header-menu-item">
            <img src="assets/img/frame-9.svg" alt="캐치마인드" />
            <div>캐치마인드</div>
        </div>
        <div class="header-menu-item">
            <img src="assets/img/image-9-1.png" alt="공유하기" />
            <div>공유하기</div>
        </div>
    </div>
</div>
