package com.aischool.service;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.Qa;
import com.aischool.model.QaDAO;


@WebServlet("/AdminQaSelectAll")
public class AdminQaSelectAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private QaDAO qaDAO;

    public void init() {
        qaDAO = new QaDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Qa> listQA = qaDAO.selectAllQa();
        
        if (listQA == null || listQA.size() == 0) {
            System.out.println("listQA is null or empty");
        } else {
            System.out.println("listQA size: " + listQA.size());
            for (Qa qa : listQA) {
                System.out.println(qa.getQa_idx() + "\t" + qa.getQa_title() + "\t" + qa.getQa_content() + "\t" + qa.getQa_d_at() + "\t" + qa.getU_id() + "\t" + qa.getAdmin_comment());
            }
        }

        request.setAttribute("listQA", listQA);
        request.getRequestDispatcher("admin_Qa.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 요청의 인코딩 설정
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String author = request.getParameter("author");

        // 디버깅 로그 추가
        System.out.println("author: " + author);
        System.out.println("title: " + title);
        System.out.println("content: " + content);

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Qa newQa = new Qa(0, title, content, timestamp.toString(), author, ""); // 관리자 댓글은 빈 문자열로 설정

        try {
            qaDAO.insertQa(newQa);
            response.sendRedirect("admin_Qa.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "데이터베이스에 저장하는 동안 오류가 발생했습니다.");
            request.getRequestDispatcher("/error-page.jsp").forward(request, response);
        }
    }
}