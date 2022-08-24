package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.VO.memberVO;

public class memberDAO {
	
	Connection conn = null;
	PreparedStatement psmt= null;
	ResultSet rs = null;
	memberVO vo = null;
	int cnt = 0;
	ArrayList<memberVO> list = new ArrayList<memberVO>();
	
	public void getConn() {
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
//	연결순서 역순으로 닫아주기
	public void close() {
		try {
			if(conn != null) {
				conn.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(rs != null) {
				rs.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	
	public int join(String cls, String id, String pw, String email, String name, String birth, String tel,char m_type) {
		
		try {
			getConn();  //db연결
			String sql = "INSERT INTO SCHOOL_MEMBER VALUES(?,?,?,?,?,?,?,SYSDATE.?)"; 
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cls);
			psmt.setString(2, id);
			psmt.setString(3, pw);
			psmt.setString(4, email);
			psmt.setString(5, name);
			psmt.setString(6, birth);
			psmt.setString(7, tel);
			psmt.setString(8, String.valueOf(m_type));
			
			cnt = psmt.executeUpdate();   //sql 실행(실패하면 cnt=0)
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;    // 성공 실패 여부 리턴
	}
	
	public memberVO Login(String id, String pw) {
		try {
			getConn();
			
			String sql = "SELECT * FROM SCHOOL_MEMBER WHERE ID= ? AND PW= ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();	//select 문에서는 excutequery사용
			if(rs.next()) {
				String getCls = rs.getString(1);
				String getId = rs.getString(2);
				String getEmail = rs.getString(4);
				String getName = rs.getString(5);
				
				vo = new memberVO(getCls, getId, getEmail, getName);
			}else {
				System.out.println("로그인 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

}
