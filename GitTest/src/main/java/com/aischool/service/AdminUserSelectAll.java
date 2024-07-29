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


@WebServlet("/AdminUserSelectAll")
public class AdminUserSelectAll extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDAO dao = new UserDAO();
		//전체 유저 표출
		ArrayList<User> users = dao.userSelectAll();
		
		request.setAttribute("users", users);

		RequestDispatcher dis = request.getRequestDispatcher("admin_user_select.jsp");
		dis.forward(request, response);
		

	}

}
