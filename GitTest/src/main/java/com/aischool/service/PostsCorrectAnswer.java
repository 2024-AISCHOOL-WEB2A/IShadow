package com.aischool.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.PostDAO;

/**
 * Servlet implementation class PostsCorrectAnswer
 */
@WebServlet("/PostsCorrectAnswer")
public class PostsCorrectAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDao = new PostDAO();
		int cnt = postDao.postAnswer(Integer.parseInt(request.getParameter("idx")), 
				request.getParameter("input"));

		postDao.close();
		String result = (cnt > 0) ? "ok" : "";
		response.getWriter().print(result);
	}

}
