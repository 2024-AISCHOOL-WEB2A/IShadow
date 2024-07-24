package com.aischool.service;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.Ranking;

@WebServlet("/InsertRanking")
public class InsertRanking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Ranking ranking = new Ranking();

		ranking.setNickName((String) request.getParameter("nickName"));

		// hiddenTime 파라미터를 String으로 받습니다.
		String hiddenTimeParam = request.getParameter("hiddenTime");

		// 직접 String 값을 Time 필드에 설정하려고 하면 오류가 발생합니다.
		// ranking.setTime(hiddenTimeParam); // 오류 발생

		// 따라서, String 값을 Time 타입으로 변환해야 합니다.
		if (hiddenTimeParam != null && !hiddenTimeParam.isEmpty()) {
			// hiddenTimeParam 값을 HH:mm:ss 형식의 Time 객체로 변환합니다.
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
				long ms = sdf.parse(hiddenTimeParam).getTime();
				Time hiddenTime = new Time(ms);

				// Ranking 객체에 설정합니다.
				ranking.setTime(hiddenTime);

			} catch (ParseException e) {
				e.printStackTrace();
			}

			request.setCharacterEncoding("UTF-8");

			if (ranking != null) {
				request.setAttribute("ranking", ranking);
				request.getRequestDispatcher("catchmind-ranking.jsp").forward(request, response);
				System.out.println("ranking간다!");
			} else {
				response.sendRedirect("TestGameBefore.jsp");
				System.out.println("ranking비었다 ㅜㅜ");
			}

		}
	}
}
