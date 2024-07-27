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

@WebServlet("/AdminPostDelete")
public class AdminPostDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String deletePost = request.getParameter("postIDX");
		PostDAO dao = new PostDAO();

		int cnt = dao.postDlete(deletePost);

		// 전체 게시글 표출
		ArrayList<Post> posts = dao.postSelectAll();
		
		if(cnt > 0) {
			System.out.println("게시글 삭제 성공!");
			request.setCharacterEncoding("UTF-8");
			request.setAttribute("getPosts", posts);
			RequestDispatcher dis = request.getRequestDispatcher("adminpage.jsp");
			dis.forward(request, response);
			
		}else {
			System.out.println("게시글 삭제 실패 ㅜㅜ");
			response.sendRedirect("AdminPostSelectAll");
		}
	}

}