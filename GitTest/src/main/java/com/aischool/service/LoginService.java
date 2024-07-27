package com.aischool.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.aischool.model.Login;
import com.aischool.model.LoginDAO;

/**
 * Servlet implementation class LoginService
 */
@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
    */
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
   
      //1.사용자가 전달한 이메일(email), 패스워드(pw)를 변수에 저장하기
      String email = request.getParameter("email");
      String pw = request.getParameter("pw");

      //2. 이메일, 패스워드 콘솔창에 출력하기
        // request.setAttribute("email", email);
        // request.setAttribute("pw", response);
      System.out.println(email + "|"+pw);
      //3.데이터베이스에 이메일,패스워드를 전달하여 로그인 기능 구현하기
      LoginDAO dao = new LoginDAO();
      
      Login member = new Login();
      
      member.setEmail(email);
      member.setPw(pw);
      
      
      Login member2 =  dao.login_member(member); //되면 넘어오고 안되면 안넘어온다
      if(member2 != null) {
         //로그인 성공 
         //로그인한 회원정보를 서버에 저장 - > 세션 
         HttpSession session = request.getSession();
         session.setAttribute("login_member", member2);//출력하기 세션에서 리퀘스트에서 출력학 객체를 만든다 
         response.sendRedirect("main.jsp");
         System.out.println("로그인성공");
      }else {
         response.sendRedirect("main.jsp");
         System.out.println("로그인 실패");
      }
   }
   

}
