package com.aischool.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostDAO {
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
    
	//DB connect
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
    
    //DB close()
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

    //게시물의 모든 정보를 가져오는 메소드
    public ArrayList<Post> postSelectAll() {
    	
    	connect();
    	ArrayList<Post> posts = new ArrayList<Post>();

		try {
			String sql = "select * from post";

			pst = conn.prepareStatement(sql);

			rs = pst.executeQuery();

			while (rs.next()) {
				Post post = new Post(rs.getInt(1), rs.getString(2), rs.getString(3)
						, rs.getString(4), rs.getDate(5), rs.getInt(6), rs.getString(7)
						, rs.getString(8), rs.getString(9), rs.getString(10));
				posts.add(post);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}

		return posts;
	}
}
