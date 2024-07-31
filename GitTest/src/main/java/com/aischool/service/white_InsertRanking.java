package com.aischool.service;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.RankingDAO;

/**
 * Servlet implementation class white_InsertRanking
 */
@WebServlet("/white_InsertRanking")
public class white_InsertRanking extends HttpServlet {
   private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       request.setCharacterEncoding("UTF-8");
        String nickName = request.getParameter("nickName");
        String hiddenTimeParam = request.getParameter("hiddenTime");
        Date date = new Date(); 
        
        RankingDAO dao = new RankingDAO();
        int cnt = dao.insertRanking(nickName, hiddenTimeParam, date);


        if (cnt > 0) {
            response.sendRedirect("white_SelectRanking");
        } else {
            response.sendRedirect("white_catchmind.jsp");
            System.out.println("ranking등록 실패 ㅜㅜ");
        }
}
}
