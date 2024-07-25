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
@WebServlet("/PostsCommentAll")
public class PostsCommentAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDao = new PostDAO();
		//전체 게시글 표출
		ArrayList<PostComments> postscomment = postDao.PostsComments();
		int size = postscomment.size();
		for(int i=0;i<size;i++) {
			System.out.println(
					postscomment.get(i).getCmt_idx()+
					postscomment.get(i).getPost_idx()+
					postscomment.get(i).getCmt_content()+
					postscomment.get(i).getCreated_at()+
					postscomment.get(i).getU_id()+
					postscomment.get(i).getHint_1()+
					postscomment.get(i).getHint_2()+
					postscomment.get(i).getHint_3()+
					postscomment.get(i).getPost_answer());
		}
		postDao.close();
	}

}
