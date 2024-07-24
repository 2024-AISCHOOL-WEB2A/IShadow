package com.aischool.service;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.Ranking;
import com.aischool.model.RankingDAO;

@WebServlet("/InsertRanking")
public class InsertRanking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nickName = request.getParameter("nickName");
        String hiddenTimeParam = request.getParameter("hiddenTime");
        Date date = new Date(); 
        
        RankingDAO dao = new RankingDAO();
        int cnt = dao.insertRanking(nickName, hiddenTimeParam, date);

        request.setCharacterEncoding("UTF-8");

        if (cnt > 0) {
            response.sendRedirect("SelectRanking");
        } else {
            response.sendRedirect("catchmind.jsp");
            System.out.println("ranking등록 실패 ㅜㅜ");
        }
    }
}
