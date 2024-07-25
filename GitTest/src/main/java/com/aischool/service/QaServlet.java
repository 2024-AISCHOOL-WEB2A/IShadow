// QaServlet.java
package com.aischool.service;

import com.aischool.model.Qa;
import com.aischool.model.QaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/qaAllSelect")
public class QaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QaDAO qaDAO;

    public void init() {
        qaDAO = new QaDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Qa> listQA = qaDAO.selectAllQa(); // 메서드명 변경
        
        if (listQA == null || listQA.size() == 0) {
            System.out.println("listQA is null or empty");
        } else {
            System.out.println("listQA size: " + listQA.size());
            for (Qa qa : listQA) {
                System.out.println(qa.getQa_idx() + "\t" + qa.getQa_title() + "\t" + qa.getQa_content() + "\t" + qa.getQa_d_at() + "\t" + qa.getU_id() + "\t" + qa.getAdmin_comment());
            }
        }

        request.setAttribute("listQA", listQA);
        request.getRequestDispatcher("/request-page.jsp").forward(request, response);
    }
}
