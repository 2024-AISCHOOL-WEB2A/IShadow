package com.aischool.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.Post;
import com.aischool.model.PostDAO;

/**
 * Servlet implementation class Board
 */
//기존 게시판 댓
@WebServlet("/PostsSelectAll")
public class PostsSelectAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PostDAO postDao = new PostDAO();
		//전체 게시글 표출
		ArrayList<Post> posts = postDao.postSelectAll();

		int size = posts.size();
		for(int i=0;i<size;i++) {
			System.out.println(posts.get(i).getIdx()+" "+
			posts.get(i).getTitle()+" "+
			posts.get(i).getUser()+" "+
			posts.get(i).getCreate_at()+" "+
			posts.get(i).getFile()+" "+
			posts.get(i).getViews()+"\n");			
		}

		postDao.close();
	}

}
