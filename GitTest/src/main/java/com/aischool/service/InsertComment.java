package com.aischool.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.QaDAO;


@WebServlet("/InsertComment")
public class InsertComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String comment = request.getParameter("comment");
		int idx = Integer.parseInt(request.getParameter("idx"));
		QaDAO  dao = new QaDAO();
		
		int cnt = dao.insertComment(comment, idx);
		System.out.println("cntasdfasdfsadfasdfasdfsdafsadfsa = " + cnt);
		
		if(cnt > 0) {
			System.out.println("코멘트 등록 성공");
			response.sendRedirect("AdminQaSelectAll");
		}else {
			System.out.println("코멘트 등록 실패");
			response.sendRedirect("AdminUserSelectAll");
		}
	}

}
