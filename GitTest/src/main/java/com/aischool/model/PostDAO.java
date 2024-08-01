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
	private void connect() {
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
    //게시물의 모든 정보 가져오기
    public ArrayList<Post> postSelectAll() {
    	ArrayList<Post> posts = new ArrayList<Post>();
		try {
			String sql = "select * from posts p join users u on p.u_idx = u.u_id where u.u_exit = 'F'"
					+ "order by post_idx desc";
			
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
//			close();
		}

		return posts;
	}

    //게시물의 모든 정보를 가져오는 메소드 : 페이징 테스트 int startRow, int pageSize  
    public ArrayList<Post> postSelectAll(CurPage curpage) {
    	ArrayList<Post> posts = new ArrayList<Post>();
		try {
			String sql = "select * from posts p join users u on p.u_idx = u.u_id where u.u_exit = 'F'"
					+ "order by p.post_idx desc limit "+curpage.getStartList()+","+curpage.getListSize()+";";
			
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
//			close();
		}

		return posts;
	}
    
    public ArrayList<Post> postSelectAll(CurPage curpage, String keyword) {
    	ArrayList<Post> posts = new ArrayList<Post>();
		try {
			String sql = "select * from posts p join users u on p.u_idx = u.u_id where u.u_exit = 'F'"
					+ " and p.post_title like '%"+keyword+"%' order by p.post_idx desc limit "
					+ curpage.getStartList()+","+curpage.getListSize()+";";
			
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
//			close();
		}

		return posts;
	}

    // 게시판 상세 보기
    public ArrayList<PostComments> PostsComments(int idx) {
    	plusBoardView(idx);
    	ArrayList<PostComments> postcomments = new ArrayList<PostComments>();
    	try {
			String sql = "SELECT post_idx, post_answer, u_idx, hint_1, hint_2, hint_3, post_file FROM posts WHERE post_idx = "+idx+";";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			PostComments postcomment;
			while (rs.next()) {
				postcomment = new PostComments();
				postcomment.setPost_idx(rs.getInt(1));
				postcomment.setPost_answer(rs.getString(2));
				postcomment.setU_id(rs.getString(3));
				postcomment.setHint_1(rs.getString(4));
				postcomment.setHint_2(rs.getString(5));
				postcomment.setHint_3(rs.getString(6));
				postcomment.setPost_file(rs.getString(7));
				postcomments.add(postcomment);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}

		return postcomments;
	}
    // 게시물 조회수 카운트
    public void plusBoardView(int idx) {
    	try {
			String sql = "update Insa5_SpringA_hacksim_2.posts trg,\n"
					+ "(select post_views+1 post_views\n"
					+ "   from Insa5_SpringA_hacksim_2.posts\n"
					+ "   where post_idx = "+idx+") src\n"
					+ "set trg.post_views = src.post_views\n"
					+ "where trg.post_idx = "+idx+";";
			pst = conn.prepareStatement(sql);
			pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
//			close();
		}

    }
    //게시물 개수 카운트
    public int getPostsCount() {
    	int postCnt = 0;
    	try {
			String sql = "SELECT count(post_idx) FROM posts p JOIN users u ON p.u_idx = u.u_id WHERE u.u_exit = 'F';";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
		
			while (rs.next()) {
				postCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
//			close();
		}
    	
    	return postCnt;
    	
    }
    //게시물 개수 카운트 ( 검색어 존재 )
    public int getPostsCount(String search) {
    	int postCnt = 0;
    	try {
			String sql = "SELECT count(post_idx) FROM posts p JOIN users u ON p.u_idx = u.u_id "
					+ "WHERE u.u_exit = 'F' and p.post_title like '%"+search+"%';";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
		
			while (rs.next()) {
				postCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
//			close();
		}
    	
    	return postCnt;
    	
    }
    
    //게시판 번호 확인
    public int getBoardNumber() {
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
//			close();
		}
    	return boardNum;
    }
    //게시물 등록 메소드
    public int postInsert(Post post) {
    	int cnt = 0;
    	try {
			String sql = "insert into Insa5_SpringA_hacksim_2.posts values("
					+post.getIdx()+",'"+post.getTitle()+"','PostImg/"+post.getFile()+"',"+
					"now()"+","+post.getViews()+",'"+post.getAnswer()+"','"+post.getUser()+"','"+
					post.getHint1()+"','"+post.getHint2()+"','"+post.getHint3()+"');";

			pst = conn.prepareStatement(sql);
			cnt = pst.executeUpdate();			

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
//			close();
		}

		return cnt;

	}
    // 게시물 검색
    public ArrayList<Post> postSearch(String s) {
    	ArrayList<Post> posts = new ArrayList<Post>();
    	try {
			String sql = "select * from posts p join users u on p.u_idx = u.u_id where post_title like '%"+s+"%'"
					+ "and u.u_exit = 'F' order by post_idx desc;";

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

		}
    	return posts;
	}
	public int postDlete(String deletePost) {
		
		int cnt = 0;
		connect();
		
		try {
			String sql = "DELETE FROM posts WHERE post_idx = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, deletePost);
			cnt = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	// 게시물 정답 맞추기
	public int postAnswer(int idx, String ans) {
		int rowcount = 0;
		try {
			String sql = "select count(*) from Insa5_SpringA_hacksim_2.posts \n"
					+ "where post_idx = "+idx+" and post_answer = '"+ans+"';";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next()) rowcount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
//			close();
		}
		return rowcount;
	}
}
