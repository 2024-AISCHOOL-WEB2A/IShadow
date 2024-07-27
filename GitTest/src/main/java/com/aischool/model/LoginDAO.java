package com.aischool.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {

    private Connection conn;
    private PreparedStatement pst;
    private ResultSet rs;

    public void connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://project-db-stu3.smhrd.com:3307/Insa5_SpringA_hacksim_2";
            String user = "Insa5_SpringA_hacksim_2";
            String password = "aischool2";
            conn = DriverManager.getConnection(url, user, password);

            if (conn == null) {
                System.out.println("DB연결 실패...");
            } else {
                System.out.println("DB연결 성공!");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (rs != null)
                rs.close();
            if (pst != null)
                pst.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Login login_member(Login member) {
        Login mem = null;
        connect();
        try {
            String sql = "SELECT * FROM users WHERE u_id=? AND u_pw=?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, member.getU_id());
            pst.setString(2, member.getU_pw());
            rs = pst.executeQuery();
            if (rs.next()) {
                String u_id = rs.getString("u_id");
                String u_pw = rs.getString("u_pw");
                String u_nick = rs.getString("u_nick");

                mem = new Login(u_id, u_pw, u_nick);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return mem;
    }
}
