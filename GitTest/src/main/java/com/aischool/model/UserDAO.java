package com.aischool.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {

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

	// 사용자 정보를 가져오는 메소드
	public ArrayList<User> userSelectAll() {

		connect();
		ArrayList<User> users = new ArrayList<User>();

		try {
			String sql = "SELECT * FROM users WHERE u_type NOT IN ('A') AND u_exit = 'F'";
			pst = conn.prepareStatement(sql);

			rs = pst.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setId(rs.getString(1));
				user.setNick(rs.getString(3));
				user.setProfile_img(rs.getString(4));
				user.setExit(rs.getString(5).charAt(0));
				user.setJoindate(rs.getDate(6));
				user.setType(rs.getString(7).charAt(0));
				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return users;
	}

	public int userDelete(String deleteUser) {

		connect();
		int cnt = 0;

		try {
			String sql = "UPDATE users SET u_exit = 'T' WHERE u_id = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, deleteUser);
			cnt = pst.executeUpdate(); // UPDATE(탈퇴 여부)쿼리 실행
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println(cnt);
		return cnt;
	}

}
