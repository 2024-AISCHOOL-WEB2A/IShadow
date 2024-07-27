package com.aischool.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.User;
import com.aischool.model.UserDAO;

@WebServlet("/AdminUserDelete")
public class AdminUserDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String deleteUser = request.getParameter("userID");
		UserDAO dao = new UserDAO();
		int cnt = dao.userDelete(deleteUser);
		// 전체 게시글 표출
		if (cnt > 0) {
			ArrayList<User> users = dao.userSelectAll();

			request.setAttribute("users", users);

			System.out.println("삭제 성공!");
			RequestDispatcher dis = request.getRequestDispatcher("admin_user_select.jsp");
			dis.forward(request, response);
		} else {
			System.out.println("삭제 실패ㅜㅜ");
			response.sendRedirect("AdminUserSelectAll");
		}
	}

}