package com.aischool.model;

public class Login {
    private String u_id;
    private String u_pw;
    private String u_nick;
    private String u_type;

    public Login() {}

    public Login(String u_id, String u_pw, String u_nick, String u_type) {
        this.u_id = u_id;
        this.u_pw = u_pw;
        this.u_nick = u_nick;
        this.u_type = u_type;
    }

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }

    public String getU_pw() {
        return u_pw;
    }

    public void setU_pw(String u_pw) {
        this.u_pw = u_pw;
    }
    
    public String getU_nick() {
        return u_nick;
    }

    public void setU_nick(String u_nick) {
        this.u_nick = u_nick;
    }

    public String getU_type() {
        return u_type;
    }

    public void setU_type(String u_type) {
        this.u_type = u_type;
    }
}
