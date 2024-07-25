package com.aischool.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostDAO {
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
    
	public PostDAO() {
		connect();
	}
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
//    	connect();
    	ArrayList<Post> posts = new ArrayList<Post>();
		try {
			String sql = "select * from Insa5_SpringA_hacksim_2.posts order by post_idx desc";
			
//			"select post_idx, post_title, post_file, created_at, "
//			+ "post_views, post_answer, u_idx from Insa5_SpringA_hacksim_2.posts order by post_idx desc";
			
			
			pst = conn.prepareStatement(sql);

			rs = pst.executeQuery();
			Post post;
			while (rs.next()) {
				post = new Post();
				post.setIdx(rs.getInt(1)); 
				post.setTitle(rs.getString(2)); 
				post.setFile(rs.getString(3));
				post.setCreate_at(rs.getDate(4));
				post.setViews(rs.getInt(5));;
				post.setAnswer(rs.getString(6));
				post.setUser(rs.getString(7));
				posts.add(post);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}

		return posts;
	}
    
    // 게시판 상세 보기
    public ArrayList<PostComments> PostsComments() {
//    	connect();
    	ArrayList<PostComments> postcomments = new ArrayList<PostComments>();
    	try {
			String sql = "SELECT cmt.cmt_idx, cmt.post_idx, cmt.cmt_content, cmt.created_at,\n"
					+ "cmt.u_id, post.hint_1, post.hint_2, post.hint_3, post.post_answer  \n"
					+ "FROM Insa5_SpringA_hacksim_2.post_comments cmt join Insa5_SpringA_hacksim_2.posts post\n"
					+ "on cmt.post_idx = post.post_idx;";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			PostComments postcomment;
			while (rs.next()) {
				postcomment = new PostComments();
				postcomment.setCmt_idx(rs.getInt(1)); 
				postcomment.setPost_idx(rs.getInt(2));
				postcomment.setCmt_content(rs.getString(3));
				postcomment.setCreated_at(rs.getDate(4));
				postcomment.setU_id(rs.getString(5));
				postcomment.setHint_1(rs.getString(6));
				postcomment.setHint_2(rs.getString(7));
				postcomment.setHint_3(rs.getString(8));
				postcomment.setPost_answer(rs.getString(9));
				postcomments.add(postcomment);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}

		return postcomments;
	}
    //게시판 번호 확인
    public int getBoardNumber() {
//    	connect();
    	int boardNum=0;
    	try {
			String sql = "SELECT post_idx+1 FROM Insa5_SpringA_hacksim_2.posts order by post_idx desc limit 1;";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
		
			while (rs.next()) {
				boardNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
    	return boardNum;
    }
    //게시물 등록 메소드
    public void postInsert(Post post) {
//    	System.out.println("here~"+post.getIdx());
		/* 파라미터 값 을 query문에 작성 후 쿼리 실행 */
    	/*
    	try {
			String sql = "insert into Insa5_SpringA_hacksim_2.posts values("
					+ ") values(post.getIdx(), post.);";

			pst = conn.prepareStatement(sql);

			rs = pst.executeQuery();
			Post post;
			while (rs.next()) {
				post = new Post();
				post.setIdx(rs.getInt(1)); 
				post.setTitle(rs.getString(2)); 
				post.setFile(rs.getString(3));
				post.setCreate_at(rs.getDate(4));
				post.setViews(rs.getInt(5));;
				post.setAnswer(rs.getString(6));
				post.setUser(rs.getString(7));
				posts.add(post);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}

		 */
	}
}
