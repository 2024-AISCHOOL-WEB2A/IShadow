package com.aischool.model;

public class Login {


//WebMember클래스는 데이터베이스의 정보를 저장할 데이터 타입
//테이블: WEB_MEMBER
//컬럼명: EMAIL, PW, TEL, ADDRESS
//데이터타입: VARCHAR2
//위 정보를 JAVA에서 표현할 수 있게 클래스를 생성
//WEB MEMBER -> WEBMEMBER 클래스
//EMAIL, PW, TEL, ADDRESS -> 필드변수
//VARCHAR2 -> STRING

   private String email;
   private String pw;

   
   
   //추가적으로 생성자(기본&사용자정의), Getter&Setter
   public Login(){
      
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   
   public Login(String email, String pw) {
      
      this.email = email;
      this.pw = pw;
   
   }
   
   
   
   

   

}



