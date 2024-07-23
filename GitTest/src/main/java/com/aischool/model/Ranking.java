package com.aischool.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class Ranking {
	private int idx;
	private String nickName;
	private LocalTime time;
	private LocalDate date;
	
	public Ranking() {}

    public Ranking(int idx, String nickName, LocalTime time, LocalDate date) {
        this.idx = idx;
        this.nickName = nickName;
        this.time = time;
        this.date = date;
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

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}
