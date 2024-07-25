package com.aischool.service;

import java.io.IOException;
import java.util.ArrayList;

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
		int idx = Integer.parseInt(request.getParameter("post_idx"));
		// 게시물 조회수 카운트
		postDao.plusBoardView(idx);

		//게시물 상세보기
		ArrayList<PostComments> postscomment = postDao.PostsComments(idx);
		int size = postscomment.size();
		for(int i=0;i<size;i++) {
			System.out.println(
					postscomment.get(i).getCmt_idx()+
					postscomment.get(i).getPost_idx()+
					postscomment.get(i).getCmt_content()+
					postscomment.get(i).getCreated_at()+
					postscomment.get(i).getU_id()
					);
		}

		postDao.close();
	}

}
