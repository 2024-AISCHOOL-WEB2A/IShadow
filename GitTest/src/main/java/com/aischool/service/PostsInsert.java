package com.aischool.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.Post;
import com.aischool.model.PostDAO;

/**
 * Servlet implementation class PostInsert
 */
@WebServlet("/PostsInsert")
public class PostsInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDao = new PostDAO();
		Post post = new Post();
		int cnt = 0;
		String result;
		post.setIdx(postDao.getBoardNumber());
		post.setTitle(request.getParameter("title"));
		post.setFile(request.getParameter("fileUpload"));
		post.setViews(1);
		post.setAnswer(request.getParameter("inputanswer"));
		post.setUser(request.getParameter("user"));
		post.setHint1(request.getParameter("firstFeature"));
		post.setHint2(request.getParameter("secondFeature"));
		post.setHint3(request.getParameter("thirdFeature"));

		cnt = postDao.postInsert(post);
		postDao.close();
		
		result = (cnt > 0) ? "ok" : "";
		response.getWriter().print(result);
	}

}
