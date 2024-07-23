package com.aischool.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GamesDAO {

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
	
	// 랜덤으로 5개의 games 테이블의 모든 컬럼 가져오기
	public ArrayList<Games> startGame() {

		connect();
		ArrayList<Games> games = new ArrayList<Games>();
		try {
			// 랜덤으로 정렬 후 위에서 5개 잘라서 가져오기
			String sql = "SELECT * FROM games ORDER BY RAND() LIMIT 5";
			pst = conn.prepareStatement(sql);
			
			rs = pst.executeQuery();
			while (rs.next()) {
				Games game = new Games(rs.getInt(1), rs.getString(2), rs.getString(3));
				games.add(game);
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return games;
	}
}
