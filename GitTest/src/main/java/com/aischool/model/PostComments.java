package com.aischool.model;

import java.security.Timestamp;
import java.sql.Date;

public class PostComments {
	private int cmt_idx;
	private int post_idx;
	private String cmt_content;
	private Date created_at;
	private String u_id;
	private String hint_1;
	private String hint_2;
	private String hint_3;
	private String post_answer;
	private String post_file;
	
	public int getCmt_idx() {
		return cmt_idx;
	}
	public void setCmt_idx(int cmt_idx) {
		this.cmt_idx = cmt_idx;
	}
	public int getPost_idx() {
		return post_idx;
	}
	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getHint_1() {
		return hint_1;
	}
	public void setHint_1(String hint_1) {
		this.hint_1 = hint_1;
	}
	public String getHint_2() {
		return hint_2;
	}
	public void setHint_2(String hint_2) {
		this.hint_2 = hint_2;
	}
	public String getHint_3() {
		return hint_3;
	}
	public void setHint_3(String hint_3) {
		this.hint_3 = hint_3;
	}
	public String getPost_answer() {
		return post_answer;
	}
	public void setPost_answer(String post_answer) {
		this.post_answer = post_answer;
	}
	public String getPost_file() {
		return post_file;
	}
	public void setPost_file(String post_file) {
		this.post_file = post_file;
	}
	
}
