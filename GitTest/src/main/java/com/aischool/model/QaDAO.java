package com.aischool.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QaDAO {

    private static final String SELECT_ALL_QA = "SELECT * FROM QA";
    private static final String INSERT_QA_SQL = "INSERT INTO QA (qa_title, qa_content, u_id, qa_d_at, admin_comment) VALUES (?, ?, ?, ?, ?)";

    private Connection connect() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://project-db-stu3.smhrd.com:3307/Insa5_SpringA_hacksim_2";
            String user = "Insa5_SpringA_hacksim_2";
            String password = "aischool2";

            conn = DriverManager.getConnection(url, user, password);
            System.out.println("DB 연결 성공!");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("DB 연결 실패...");
        }
        return conn;
    }

    private void close(Connection conn, PreparedStatement pst, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Qa> selectAllQa() {
        List<Qa> qaList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        try {
            connection = connect();
            preparedStatement = connection.prepareStatement(SELECT_ALL_QA);
            rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
                int qa_idx = rs.getInt("qa_idx");
                String qa_title = rs.getString("qa_title");
                String qa_content = rs.getString("qa_content");
                String qa_d_at = rs.getTimestamp("qa_d_at").toString(); // Timestamp를 문자열로 변환
                String u_id = rs.getString("u_id");
                String admin_comment = rs.getString("admin_comment");
                qaList.add(new Qa(qa_idx, qa_title, qa_content, qa_d_at, u_id, admin_comment));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(connection, preparedStatement, rs);
        }
        return qaList;
    }
    
    public void insertQa(Qa qa) throws SQLException {
        try (Connection connection = connect();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_QA_SQL)) {
            preparedStatement.setString(1, qa.getQa_title());
            preparedStatement.setString(2, qa.getQa_content());
            preparedStatement.setString(3, qa.getU_id());
            preparedStatement.setTimestamp(4, Timestamp.valueOf(qa.getQa_d_at())); // Timestamp 사용
            preparedStatement.setString(5, "");  // admin_comment를 빈 문자열로 설정
            
            preparedStatement.executeUpdate();
        }
    }
}
