package com.aischool.model;


import java.sql.Date;
import java.sql.Time;


public class Ranking {
	private int idx;
	private String nickName;
	private Time time;
	private Date date;
	
	public Ranking() {}

    public Ranking(int idx, String nickName, Time time, Date date) {
        this.idx = idx;
        this.nickName = nickName;
        this.setTime(time);
        this.setDate(date);
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

    
}
