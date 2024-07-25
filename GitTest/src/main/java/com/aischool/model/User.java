package com.aischool.model;

import java.sql.Date;

public class User {
	private String id;
	private String pw;
	private String email;
	private String nick;
	private String profile_img;
	private char exit;
	private Date joindate;
	private char type;
	
	public User() {};
	
	public User(String id, String pw, String email, String nick, String profile_img, char exit, Date joindate,
			char type) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.nick = nick;
		this.profile_img = profile_img;
		this.exit = exit;
		this.joindate = joindate;
		this.type = type;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public char getExit() {
		return exit;
	}
	public void setExit(char exit) {
		this.exit = exit;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public char getType() {
		return type;
	}
	public void setType(char type) {
		this.type = type;
	}
	
}
