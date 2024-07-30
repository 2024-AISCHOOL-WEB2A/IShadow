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

@WebServlet("/AdminLoginService")
public class AdminLoginService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String u_id = request.getParameter("u_id");
        String u_pw = request.getParameter("u_pw");

        LoginDAO dao = new LoginDAO();
        Login member = new Login();
        member.setU_id(u_id);
        member.setU_pw(u_pw);

        Login member2 = dao.login_member(member);
        if (member2 != null && "A".equals(member2.getU_type())) {
            HttpSession session = request.getSession();
            session.setAttribute("login_member", member2);
            response.sendRedirect("AdminUserSelectAll");
            System.out.println("관리자 로그인 성공");
        } else {
            response.sendRedirect("admin_login.jsp?error=1");
            System.out.println("관리자 로그인 실패");
        }
    }
}
