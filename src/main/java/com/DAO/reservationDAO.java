package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class reservationDAO {
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement psmt = null;
	int cnt =0;
	
	public void connection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	
	public int ReservationCount(String cls) {
		
		try {
			cnt=0;
			connection();
		
			String sql = "SELECT * FROM LECTURE_RESERVATION WHERE RSV_CLASS=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cls);
			
			rs = psmt.executeQuery();
			//매개변수로 받은 cls의 행이 몇개인지 count 
			while(rs.next()) {
				cnt++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	// 중복체크
	public int repetitionCheck(String id) {
		try {
			cnt=0;
			connection();
			
			String sql = "SELECT FROM LECTURE_RESERVATION WHERE RSV_ID=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) { // 테이블에 예약돼있으면 cnt 1 증가
				cnt++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
}
