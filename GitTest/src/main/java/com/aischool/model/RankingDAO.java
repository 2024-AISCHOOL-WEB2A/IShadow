package com.aischool.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RankingDAO {
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	// DB connect
	public void connect() {
		try {
			// 1.OracleDriver 동적 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 2.Connection 객체 생성 (DB연결)
			// - url, user, password 필요
			String url = "jdbc:mysql://project-db-stu3.smhrd.com:3307/Insa5_SpringA_hacksim_2";
			String user = "Insa5_SpringA_hacksim_2";
			String password = "aischool2";

			conn = DriverManager.getConnection(url, user, password);

			if (conn == null) {
				System.out.println("DB연결 실패...");
			} else {
				System.out.println("DB연결 성공!");
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DB close()
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public ArrayList<Ranking> getRanking() {
		
		connect();
		
		ArrayList<Ranking> ranking = new ArrayList<Ranking>();
		try {
			
			String sql = "SELECT * FROM ranking ORDER BY rank_time LIMIT 5";
			
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery(sql);
			
			while(rs.next()) {
				Ranking rank = new Ranking(rs.getInt(1), rs.getString(2), rs.getTime(3), rs.getDate(4));
				ranking.add(rank);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return ranking;
	}
	
	
}
