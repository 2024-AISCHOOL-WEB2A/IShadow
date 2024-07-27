package com.aischool.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aischool.model.Login;
import com.aischool.model.LoginDAO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 사용자가 전달한 이메일(email), 패스워드(pw)를 변수에 저장하기
        String u_id = request.getParameter("u_id");
        String u_pw = request.getParameter("u_pw");

        // 2. 이메일, 패스워드 콘솔창에 출력하기
        System.out.println(u_id + " | " + u_pw);

        // 3. 데이터베이스에 이메일, 패스워드를 전달하여 로그인 기능 구현하기
        LoginDAO dao = new LoginDAO();
        Login member = new Login();
        member.setU_id(u_id);
        member.setU_pw(u_pw);

        Login member2 = dao.login_member(member); // 되면 넘어오고 안 되면 안 넘어온다
        if (member2 != null) {
            // 로그인 성공
            // 로그인한 회원정보를 서버에 저장 -> 세션
            HttpSession session = request.getSession();
            session.setAttribute("login_member", member2);
            response.sendRedirect("main.jsp");
            System.out.println("로그인 성공");
        } else {
            response.sendRedirect("login.jsp?error=1");
            System.out.println("로그인 실패");
        }
    }
}
