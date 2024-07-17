package com.aischool.model;

import java.security.Timestamp;

public class Post {
	
	private int idx;
	private String title;
	private String content;
	private Timestamp create_at;
	private int views;
	private String answer;
	private String category;
	private String level;
	private String user_idx;
	
	public Post(int idx, String title, String content, Timestamp create_at, int views, String answer, String category,
			String level, String user_idx) {
		super();
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.create_at = create_at;
		this.views = views;
		this.answer = answer;
		this.category = category;
		this.level = level;
		this.user_idx = user_idx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Timestamp create_at) {
		this.create_at = create_at;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}
	
	
	
	
}
