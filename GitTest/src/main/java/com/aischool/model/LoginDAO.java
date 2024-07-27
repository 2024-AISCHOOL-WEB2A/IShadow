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
         String sql = "select * from users where email=? and pw=?";
         pst = conn.prepareStatement(sql);
         pst.setString(1, member.getEmail());
         pst.setString(2, member.getPw());
         rs = pst.executeQuery();
         if (rs.next()) {
            String	 email = rs.getString(1);
            String pw = rs.getString(2);
            
            mem = new Login(email, pw);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return mem;
   }
}

