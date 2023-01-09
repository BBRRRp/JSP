package com.lec.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.lec.web.entity.Notice;

public class NoticeService {

	public List<Notice> getNoticeList() {
		return getNoticeList("title", "", 1);
	}
	
	public List<Notice> getNoticeList(int page){
		return getNoticeList("title", "", page);
	}

	public List<Notice> getNoticeList(String field, String query, int page) {
	
		List<Notice> list = new ArrayList<Notice>();
		
		String sql = "select * "
					+ " from (select rownum rn, n.*"
					+ "		from (select notice.* from notice"
					+ "      	where" + field + " like ? order by num desc) n)"
					+ " where rn between ? and ? ";
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection(url, "scott", "tiger");
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + query + "%");
				pstmt.setInt(2, 1 + (page - 1) * 10);
				pstmt.setInt(3, page * 10);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					int num = rs.getInt("num");
					String title = rs.getString("title");
					String writer = rs.getString("writer");
					Date regdate = rs.getDate("regdate");
					String content = rs.getString("content");
					int hit = rs.getInt("hit");
					String files = rs.getString("files");
			
					Notice notice = new Notice(num, title, writer, regdate, content, hit, files);			
					list.add(notice);
					
					}
				
					rs.close();
					pstmt.close();
					conn.close();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getNoticeCount() {
		return getNoticeCount("title", "");
	}

	public int getNoticeCount(String field, String query) {

		int count = 0;
		String sql = "select count(num) count"
					+ "  from (select rownum rn, n.*"
					+ "			from(select notice.* from notice "
					+ "				where " + field + " like ? order by num desc) n)";
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(url, "scott", "tiger");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + query + "%");
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			count = rs.getInt("count");
			
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return count;
	}

	public Notice getNotice(int _num) {
		
		Notice notice = null;
		String sql = "select * from notice where num = ?";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(url, "scott", "tiger");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, _num);			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int num = rs.getInt("num");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				Date regdate = rs.getDate("regdate");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				String files = rs.getString("files");
				
				notice = new Notice(num, title, writer, regdate, content, hit, files);				
			};
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}				
		return notice;
	}
	
	//다음 데이터
	public Notice getNextNotice(int _num) {
		
			Notice notice = null;
			
			String sql = "select * from notice "
					   + " where num = (select num from notice"
					   + "                from num > (select num from notice where num = ?) "
					   + "   and rownum = 1);";
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection(url, "scott", "tiger");
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, _num);			
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					int num = rs.getInt("num");
					String title = rs.getString("title");
					String writer = rs.getString("writer");
					Date regdate = rs.getDate("regdate");
					String content = rs.getString("content");
					int hit = rs.getInt("hit");
					String files = rs.getString("files");
					
					notice = new Notice(num, title, writer, regdate, content, hit, files);				
				};
				
				rs.close();
				pstmt.close();
				conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}				
			return notice;
			
	}
	
	public Notice getPrevNotice(int _num) {
			
			Notice notice = null;
			String sql = "select num from (select * from notice order by num desc) "
					   + " where num < (select num from notice where num = ?) "
					   + "   and rownum = 1);";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection(url, "scott", "tiger");
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, _num);			
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					int num = rs.getInt("num");
					String title = rs.getString("title");
					String writer = rs.getString("writer");
					Date regdate = rs.getDate("regdate");
					String content = rs.getString("content");
					int hit = rs.getInt("hit");
					String files = rs.getString("files");
					
					notice = new Notice(num, title, writer, regdate, content, hit, files);				
				};
				
				rs.close();
				pstmt.close();
				conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
			return notice;			
	}
	
}