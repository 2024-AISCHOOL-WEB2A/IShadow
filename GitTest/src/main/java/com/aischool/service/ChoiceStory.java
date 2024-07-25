package com.aischool.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aischool.model.Stories;
import com.aischool.model.StoriesDAO;

/**
 * Servlet implementation class ChoiceStory
 */
@WebServlet("/ChoiceStory")
public class ChoiceStory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String storyName = request.getParameter("story");
		
		StoriesDAO dao = new StoriesDAO();
		
		ArrayList<Stories> stories =  dao.ChoiceStory(storyName);
		int idx = stories.size();
		
		if(!stories.isEmpty()) {
			HttpSession session = request.getSession();
			session.setAttribute("choicedStory", stories);
			session.setAttribute("idx", idx);
			response.sendRedirect("video.jsp");
			System.out.println(stories.get(0).getViedo());
			System.out.println("동화 선택 했다");
		}else {
			response.sendRedirect("story-choice.jsp");
			System.out.println("동화 선택 못했다ㅜㅜㅜ");
		}
		
		
		
	}

}
