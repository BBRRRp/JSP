package com.lec.member.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.member.dto.Member;
import com.lec.member.jdbc.JDBCUtil;

@WebServlet("/list")
public class MemberListServlet  extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		 process(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		 process(req, res);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member order by id";
		String res_url = "";	
		
		ServletContext sct = getServletContext();
		String url = sct.getInitParameter("url");
		String usr = sct.getInitParameter("user");
		String pwd = sct.getInitParameter("pass");	
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			conn = DriverManager.getConnection(url, usr, pwd);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("password");
				String name = rs.getString("name");
				String ssn = rs.getString("regnumber");
				int mileage = rs.getInt("mileage");
				list.add(new Member(id, pw, name, ssn, mileage));
			}
			req.setAttribute("list", list);
			res_url = "/member_list.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error_message", e.getMessage());
			res_url = "/resources/error.jsp";
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}	
		RequestDispatcher dispatcher = req.getRequestDispatcher(res_url);
		dispatcher.forward(req, res);	
	}
}


























