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
	
	public int lastPostId() {
		int lastPostID = 0;
		try {
			connection();
			
			String sql = "select * from freeboard order by post_id desc";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				lastPostID = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			close();
		}
		return lastPostID;
	}
	
	public ArrayList<freeboardVO> postSelect(int viewPage, int board_type){
		
		int postRange = lastPostId()-(viewPage-1)*5;
		
		try {
			connection();
			
			String sql = "select * from freeboard where post_id between ? and ? order by post_id desc ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,postRange-4);
			psmt.setInt(2,postRange);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				String post_id = rs.getString(1);
				String title = rs.getString(2);
				String writer = rs.getString(3);
				String content = rs.getString(4);
				String post_date = rs.getString(5);
				int views = rs.getInt(6);
				board_type = rs.getInt(7);
				
				freeboard_vo = new freeboardVO(post_id,title,writer,content,post_date,views,board_type);
				list.add(freeboard_vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			close();
		}
		return list;
	}
	
	public int write(String id, String title, String content, int board_type) {
		try {
			
			connection();
			
			String sql = "insert into freeboard values(freeboard_seq.nextval,?,?,?,sysdate,?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, id);
			psmt.setString(3, content);
			psmt.setInt(4, board_type);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public void viewsUpdate(int views, String post_id) {
		try {
			connection();
			
			String sql = "update freeboard set view=? where post_id=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, views);
			psmt.setString(2, post_id);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public int postUpdate(String post_id, String update_title, String update_content) {
		try {
			connection();
			
			String sql = "update freeboard set title=?,content=?,post_date=sysdate where post_id = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,update_title);
			psmt.setString(2,update_content);
			psmt.setString(3,post_id);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int postDelete(String post_id) {	
		try {
			connection();
			
			String sql = "delete freeboard where post_id = ?";
			
			psmt = conn.prepareStatement(sql);

			psmt.setString(1,post_id);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
}
