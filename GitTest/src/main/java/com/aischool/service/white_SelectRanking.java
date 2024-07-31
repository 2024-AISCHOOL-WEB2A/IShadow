package com.aischool.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.Ranking;
import com.aischool.model.RankingDAO;

/**
 * Servlet implementation class white_SelectRanking
 */
@WebServlet("/white_SelectRanking")
public class white_SelectRanking extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      RankingDAO dao = new RankingDAO();
      
      ArrayList<Ranking> ranking = dao.getRanking();
      
      request.setCharacterEncoding("UTF-8");
      
      if(!ranking.isEmpty()) {
         request.setAttribute("ranking", ranking);
         
         request.getRequestDispatcher("white_catchmind_ranking.jsp").forward(request, response);
         System.out.println("ranking간다!");
      }else {
         response.sendRedirect("white_catchmind.jsp");
         System.out.println("ranking비었다 ㅜㅜ");
      }
      
   }
}
