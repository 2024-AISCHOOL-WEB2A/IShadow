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
 * Servlet implementation class PostsSearch
 */
@WebServlet("/PostsSearch")
public class PostsSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDao = new PostDAO();
		ArrayList<Post> posts = postDao.postSearch(request.getParameter("searchVal"));
		postDao.close();
		
		request.setAttribute("getPosts", posts);

		RequestDispatcher dis = request.getRequestDispatcher("board_page.jsp");
		dis.forward(request, response);
	}

}
