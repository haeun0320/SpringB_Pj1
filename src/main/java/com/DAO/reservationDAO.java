package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.VO.reservationVO;

public class reservationDAO {
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement psmt = null;
	ArrayList<reservationVO> list = new ArrayList<reservationVO>();
	reservationVO rsv_vo = null;
	int cnt =0;
	
	public void connection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "gjai_5_4_0822" ;
			String db_pw = "smhrd4";

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
	
	public ArrayList<reservationVO> ReservationSelect(String cls){
		try {
			connection();
			
			String sql = "select from lecture_reservation where rsv_class=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cls);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String rsv_cls = rs.getString(2);
				String rsv_id = rs.getString(3);
				String rsv_name = rs.getString(4);
				String checkout = rs.getString(5);
				String rsv_date = rs.getString(6);
				
				rsv_vo = new reservationVO(rsv_cls, rsv_id, rsv_name, checkout, rsv_date);
				list.add(rsv_vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
}
