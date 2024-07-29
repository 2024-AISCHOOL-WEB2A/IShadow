package com.aischool.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.PostComments;
import com.aischool.model.PostDAO;

/**
 * Servlet implementation class PostCommentsAll2
 */
// 게시물 상세 보기
@WebServlet("/PostsCommentAll")
public class PostsCommentAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDao = new PostDAO();
		int idx = Integer.parseInt(request.getParameter("idx"));

		ArrayList<PostComments> postscomment = postDao.PostsComments(idx);

		request.setAttribute("getPostComment", postscomment);
		
		RequestDispatcher dis = request.getRequestDispatcher("board-inpage.jsp");
		dis.forward(request, response);
		
	}

}
