package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.commentVO;
import com.VO.memberVO;

public class commentDAO {
	
	ArrayList<commentVO> list = new ArrayList<commentVO>();
	memberVO vo = null;
	commentVO comment_vo = null;
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
	
	public int commentNum(String post_id) {
		int cnt=0;
		
		try {
			connection();
			
			String sql = "select * from comments where post_id = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, post_id);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				cnt+=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int commentWriter(String post_id, String content, String comment_writer) {
		
		
		
		return cnt;
	}
}
