package com.aischool.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.UserDAO;


@WebServlet("/TestService")
public class TestService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("첫 번째");
		System.out.println("두 번째 코드 생성");
		
		UserDAO dao = new UserDAO();
		dao.connect();
		dao.close();
		
	}

}
