package com.aischool.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RankingDAO {
    
    private Connection conn;
    private PreparedStatement pst;
    private ResultSet rs;

    // DB connect
    public void connect() {
        try {
            // 1.OracleDriver 동적 로딩
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2.Connection 객체 생성 (DB연결)
            // - url, user, password 필요
            String url = "jdbc:mysql://project-db-stu3.smhrd.com:3307/Insa5_SpringA_hacksim_2";
            String user = "Insa5_SpringA_hacksim_2";
            String password = "aischool2";

            conn = DriverManager.getConnection(url, user, password);

            if (conn == null) {
                System.out.println("DB연결 실패...");
            } else {
                System.out.println("DB연결 성공!");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // DB close()
    public void close() {
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
    public Integer findMissingIndex() {
        connect();
        try {
            String findMissingIndexQuery = "SELECT t1.ranking_idx + 1 AS missing_idx " +
                                           "FROM ranking t1 " +
                                           "LEFT JOIN ranking t2 ON t1.ranking_idx + 1 = t2.ranking_idx " +
                                           "WHERE t2.ranking_idx IS NULL " +
                                           "ORDER BY t1.ranking_idx " +
                                           "LIMIT 1";
            pst = conn.prepareStatement(findMissingIndexQuery);
            rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt("missing_idx");
            } else {
                return null; // No missing index found
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            close();
        }
    }

    // 가장 큰 인덱스를 찾는 메서드
    public int findMaxIndex() {
        connect();
        try {
            String findMaxIndexQuery = "SELECT MAX(ranking_idx) AS max_idx FROM ranking";
            pst = conn.prepareStatement(findMaxIndexQuery);
            rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt("max_idx");
            } else {
                throw new SQLException("Failed to find the maximum index");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1; // Error indicator
        } finally {
            close();
        }
    }

    public ArrayList<Ranking> getRanking() {
        
        connect();
        
        ArrayList<Ranking> ranking = new ArrayList<Ranking>();
        try {
            
            String sql = "SELECT * FROM ranking ORDER BY rank_time LIMIT 5";
            
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery(sql);
            
            while(rs.next()) {
                Ranking rank = new Ranking(rs.getInt(1), rs.getString(2), rs.getTime(3), rs.getDate(4));
                ranking.add(rank);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close();
        }
        return ranking;
    }

    public int insertRanking(Ranking ranking) {
        
        connect();
        int cnt = 0;
        try {
            Integer missingIdx = findMissingIndex();

            int newIdx;
            if (missingIdx != null) {
                newIdx = missingIdx;
            } else {
                newIdx = findMaxIndex() + 1;
            }

            String insertQuery = "INSERT INTO ranking (ranking_idx, rank_nickname, rank_time, rank_date) VALUES (?, ?, ?, ?)";
            pst = conn.prepareStatement(insertQuery);
            pst.setInt(1, newIdx);
            pst.setString(2, ranking.getNickName());
            pst.setTime(3, ranking.getTime());
            pst.setDate(4, ranking.getDate());
            cnt = pst.executeUpdate();
            
            System.out.println("New ranking data inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return cnt;
    }
}
