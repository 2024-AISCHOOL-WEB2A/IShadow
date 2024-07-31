package com.aischool.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.Paging;
import com.aischool.model.Post;
import com.aischool.model.PostDAO;

/**
 * Servlet implementation class Board
 */
//기존 게시판 댓
@WebServlet("/PostsSelectAll")
public class PostsSelectAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PostDAO postDao = new PostDAO();
		Paging paging = new Paging();

//		int pageCount = paging.getPageCount(1, postDao.getPostsCount());
//		int currentPage = Integer.parseInt(request.getParameter("pageNum"));
//		int pageSize = 1;
		ArrayList<Post> posts = postDao.postSelectAll();

//		String myPage = paging.pageIndexList(currentPage, pageCount, "PostsSelectAll");
		
		postDao.close();

		request.setAttribute("getPosts", posts);
//		request.setAttribute("myPage", myPage);

		RequestDispatcher dis = request.getRequestDispatcher("board_page.jsp");
		dis.forward(request, response);

	}

}
