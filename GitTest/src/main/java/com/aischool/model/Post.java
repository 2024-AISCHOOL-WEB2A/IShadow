package com.aischool.model;

import java.sql.Date;

public class Post {
	
	private int idx;
	private String title;
	private String file;
	private Date create_at;
	private int views;
	private String answer;
	private String user;
	private String hint1;
	private String hint2;
	private String hint3;
	
	public Post() {};
	public Post(int idx, String title, String file, Date create_at, int views, String answer, String user, String hint1,
			String hint2, String hint3) {
		super();
		this.idx = idx;
		this.title = title;
		this.file = file;
		this.create_at = create_at;
		this.views = views;
		this.answer = answer;
		this.user = user;
		this.hint1 = hint1;
		this.hint2 = hint2;
		this.hint3 = hint3;
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

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
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

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getHint1() {
		return hint1;
	}

	public void setHint1(String hint1) {
		this.hint1 = hint1;
	}

	public String getHint2() {
		return hint2;
	}

	public void setHint2(String hint2) {
		this.hint2 = hint2;
	}

	public String getHint3() {
		return hint3;
	}

	public void setHint3(String hint3) {
		this.hint3 = hint3;
	}
	
}
