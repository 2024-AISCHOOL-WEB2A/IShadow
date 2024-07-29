package com.aischool.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.Games;
import com.aischool.model.GamesDAO;


@WebServlet("/WhiteGameStart")
public class WhiteGameStart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		GamesDAO dao = new GamesDAO();
		
		ArrayList<Games> games =  dao.startGame();
		// request 영역에 games 저장
		System.out.println(games.size());
		for(int i = 0; i < games.size(); i++) {
			System.out.println(games.get(i).getQes_img());			
		}
		
		if(!games.isEmpty()) {
			request.setAttribute("games", games);
			
			request.getRequestDispatcher("white_catchmind.jsp").forward(request, response);
			System.out.println("games간다!");
		}else {
			response.sendRedirect("white_main.jsp");
			System.out.println("games비었다 ㅜㅜ");
		}

	}

}
