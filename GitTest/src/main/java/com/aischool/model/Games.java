package com.aischool.model;

public class Games {
	private int idx;
	private String qes_img;
	private String ans;
	
	public Games() {};
	
	public Games(int idx, String qes_img, String ans) {
		super();
		this.idx = idx;
		this.qes_img = qes_img;
		this.ans = ans;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getQes_img() {
		return qes_img;
	}

	public void setQes_img(String qes_img) {
		this.qes_img = qes_img;
	}

	public String getAns() {
		return ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}
	
	
	
	
}
