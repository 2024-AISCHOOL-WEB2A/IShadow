package com.aischool.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.Post;
import com.aischool.model.PostDAO;

/**
 * Servlet implementation class AdminPosetSelectAll
 */
@WebServlet("/AdminPostSelectAll")
public class AdminPostSelectAll extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PostDAO postDao = new PostDAO();
		//전체 게시글 표출
		ArrayList<Post> posts = postDao.postSelectAll();
		postDao.close();
		
		request.setAttribute("getPosts", posts);

		RequestDispatcher dis = request.getRequestDispatcher("adminpage.jsp");
		dis.forward(request, response);
		

	}

}
