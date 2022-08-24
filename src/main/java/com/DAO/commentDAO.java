package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		try {
		connection();
		
		String sql = "insert into comments values(comments_seq.nextval,?,?,?,sysdate)";
		
		psmt = conn.prepareStatement(sql);
			psmt.setString(1, post_id);
			psmt.setString(2, content);
			psmt.setString(3, comment_writer);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<commentVO> commentSelect(String post_id2){
		try {
			connection();
			
			String sql = "select * from comments where post_id=? order by comment_date desc";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, post_id2);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String comment_id = rs.getString(1);
				String post_id = rs.getString(2);
				String content = rs.getString(3);
				String comment_writer = rs.getString(4);
				String comment_date = rs.getString(5);
				
				comment_vo = new commentVO(comment_id, post_id, content, comment_writer, comment_date);
				list.add(comment_vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public int commentUpdate(String comment_id, String update_content) {
		try {
			connection();
			
			String sql = "update comments set content=? where comment_id=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, update_content);
			psmt.setString(2, comment_id);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int commentDelete(String comment_id) {
		try {
			connection();
			
			String sql = "delete comments where comment_id=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,comment_id);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
