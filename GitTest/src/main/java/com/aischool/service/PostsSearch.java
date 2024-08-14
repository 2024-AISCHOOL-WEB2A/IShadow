package com.aischool.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.CurPage;
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
		CurPage pagination = new CurPage();
		
		// 1. 전체 게시물 개수 
		String searchVal = request.getParameter("searchVal");
		int listCnt = postDao.getPostsCount(searchVal);

		// 2. 현재 페이지 정보
		pagination.setSearchVal(searchVal);
		pagination.pageInfo(1, 1, listCnt);

		// 3. 페이징 처리
		ArrayList<Post> posts = postDao.postSelectAll(pagination, searchVal);
		

		postDao.close();
		
		request.setAttribute("pagination", pagination);
		request.setAttribute("getPosts", posts);

		RequestDispatcher dis = request.getRequestDispatcher("board_page.jsp");
		dis.forward(request, response);
	}

}
