package com.aischool.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class RankingDAO {
    
    private Connection connect() {
        Connection conn = null;
        try {
            // 1. OracleDriver 동적 로딩
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. Connection 객체 생성 (DB연결)
            String url = "jdbc:mysql://project-db-stu3.smhrd.com:3307/Insa5_SpringA_hacksim_2";
            String user = "Insa5_SpringA_hacksim_2";
            String password = "aischool2";

            conn = DriverManager.getConnection(url, user, password);

            if (conn == null) {
                System.out.println("DB 연결 실패...");
            } else {
                System.out.println("DB 연결 성공!");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    // DB close()
    private void close(Connection conn, PreparedStatement pst, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 비어있는 인덱스를 찾는 메서드
    private Integer findMissingIndex(Connection conn) throws SQLException {
        String findMissingIndexQuery = "SELECT t1.ranking_idx + 1 AS missing_idx " +
                                       "FROM ranking t1 " +
                                       "LEFT JOIN ranking t2 ON t1.ranking_idx + 1 = t2.ranking_idx " +
                                       "WHERE t2.ranking_idx IS NULL " +
                                       "ORDER BY t1.ranking_idx " +
                                       "LIMIT 1";
        try (PreparedStatement pst = conn.prepareStatement(findMissingIndexQuery);
             ResultSet rs = pst.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("missing_idx");
            } else {
                return null; // No missing index found
            }
        }
    }

    // 가장 큰 인덱스를 찾는 메서드
    private int findMaxIndex(Connection conn) throws SQLException {
        String findMaxIndexQuery = "SELECT MAX(ranking_idx) AS max_idx FROM ranking";
        try (PreparedStatement pst = conn.prepareStatement(findMaxIndexQuery);
             ResultSet rs = pst.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("max_idx");
            } else {
                throw new SQLException("Failed to find the maximum index");
            }
        }
    }

    public ArrayList<Ranking> getRanking() {
        Connection conn = connect();
        ArrayList<Ranking> ranking = new ArrayList<>();
        try {
            String sql = "SELECT * FROM ranking ORDER BY rank_time LIMIT 10";
            try (PreparedStatement pst = conn.prepareStatement(sql);
                 ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    Ranking rank = new Ranking(rs.getInt(1), rs.getString(2), rs.getTime(3), rs.getDate(4));
                    ranking.add(rank);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, null, null);
        }
        return ranking;
    }

    public int insertRanking(String nickName, String timeString, Date date) {
        Connection conn = connect();
        int cnt = 0;
        try {
            Integer missingIdx = findMissingIndex(conn);

            int newIdx;
            if (missingIdx != null) {
                newIdx = missingIdx;
            } else {
                newIdx = findMaxIndex(conn) + 1;
            }

            // String 형식을 Time 형식으로 변환
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            Time time = new Time(sdf.parse(timeString).getTime());

            // Date 객체를 java.sql.Date로 변환
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());

            String insertQuery = "INSERT INTO ranking (ranking_idx, rank_nickname, rank_time, rank_date) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pst = conn.prepareStatement(insertQuery)) {
                pst.setInt(1, newIdx);
                pst.setString(2, nickName);
                pst.setTime(3, time);
                pst.setDate(4, sqlDate);
                cnt = pst.executeUpdate();
            }

            System.out.println("New ranking data inserted successfully.");
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        } finally {
            close(conn, null, null);
        }
        return cnt;
    }
}
