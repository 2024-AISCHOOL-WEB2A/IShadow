package com.aischool.model;

public class PostLike {
	
	private int idx;
	private int post_idx;
	private String user_idx;
	
	public PostLike() {};
	
	public PostLike(int idx, int post_idx, String user_idx) {
		super();
		this.idx = idx;
		this.post_idx = post_idx;
		this.user_idx = user_idx;
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

	public String getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}
	
	
	
	
	
}
