package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.freeboardVO;
import com.VO.memberVO;

public class freeboardDAO {

	ArrayList<freeboardVO> list = new ArrayList<freeboardVO>();
	memberVO vo = null;
	freeboardVO freeboard_vo = null;
	int cnt = 0;
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	
	public void connection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "gjai_5_4_0822" ;
			String db_pw = "smhrd4";
			
			conn = DriverManager.getConnection(db_url,db_id,db_pw);
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
	
	public int postTotal() {
		
		int total=0;
		
		try {
			
			connection();
			
			String sql = "select * from freeboard";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while(rs.next()) {
				total += 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return total;
	}
	
	public ArrayList<freeboardVO> postSelect(int viewPage){
		
		String sql = "select * from freeboard where post_id between ? and ? order by post_id desc";
		
		list.add(freeboard_vo);
		return list;
	}
	
	public int write(String id, String title, String content) {
		try {
			
			connection();
			
			String sql = "insert into freeboard values(freeboard_seq.nextval,?,?,?,sysdate,0)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, id);
			psmt.setString(3, content);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
}
