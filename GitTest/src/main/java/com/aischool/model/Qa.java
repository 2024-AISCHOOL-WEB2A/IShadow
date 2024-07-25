package com.aischool.model;

public class Qa {
    private int qa_idx;
    private String qa_title;
    private String qa_content;
    private String qa_d_at;
    private String u_id;
    private String admin_comment;

    public Qa(int qa_idx, String qa_title, String qa_content, String qa_d_at, String u_id, String admin_comment) {
        this.qa_idx = qa_idx;
        this.qa_title = qa_title;
        this.qa_content = qa_content;
        this.qa_d_at = qa_d_at;
        this.u_id = u_id;
        this.admin_comment = admin_comment;
    }

    public int getQa_idx() {
        return qa_idx;
    }

    public void setQa_idx(int qa_idx) {
        this.qa_idx = qa_idx;
    }

    public String getQa_title() {
        return qa_title;
    }

    public void setQa_title(String qa_title) {
        this.qa_title = qa_title;
    }

    public String getQa_content() {
        return qa_content;
    }

    public void setQa_content(String qa_content) {
        this.qa_content = qa_content;
    }

    public String getQa_d_at() {
        return qa_d_at;
    }

    public void setQa_d_at(String qa_d_at) {
        this.qa_d_at = qa_d_at;
    }

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }

    public String getAdmin_comment() {
        return admin_comment;
    }

    public void setAdmin_comment(String admin_comment) {
        this.admin_comment = admin_comment;
    }
}
