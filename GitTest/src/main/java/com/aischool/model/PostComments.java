package com.aischool.model;

import java.security.Timestamp;

public class PostComments {
	private int idx;
	private int post_idx;
	private Timestamp created_at;
	private int cmt_likes;
	private String user_id;
	
	public PostComments() {};
	
	public PostComments(int idx, int post_idx, Timestamp created_at, int cmt_likes, String user_id) {
		super();
		this.idx = idx;
		this.post_idx = post_idx;
		this.created_at = created_at;
		this.cmt_likes = cmt_likes;
		this.user_id = user_id;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getPost_idx() {
		return post_idx;
	}

	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public int getCmt_likes() {
		return cmt_likes;
	}

	public void setCmt_likes(int cmt_likes) {
		this.cmt_likes = cmt_likes;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
}
