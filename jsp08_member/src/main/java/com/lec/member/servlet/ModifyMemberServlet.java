package com.lec.member.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.member.dto.Member;
import com.lec.member.jdbc.JDBCUtil;

@WebServlet("/modify")
public class ModifyMemberServlet extends HttpServlet {

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
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		String ssn = req.getParameter("ssn");
		int mileage = Integer.parseInt(req.getParameter("mileage"));
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member set password=?, name=?, regnumber=?, mileage=? " 
				   + " where id = ?";
		int cnt = 0;
		String res_url = "";
		
		ServletContext sct = getServletContext();
		String url = sct.getInitParameter("url");
		String usr = sct.getInitParameter("user");
		String pwd = sct.getInitParameter("pass");
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("login_info");
		if(member!=null) {
			try {
				conn = DriverManager.getConnection(url, usr, pwd);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pw);
				pstmt.setString(2, name);
				pstmt.setString(3, ssn);
				pstmt.setInt(4, mileage);
				pstmt.setString(5, id);
				cnt = pstmt.executeUpdate();
				res_url = "/list";
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error_message", e.getMessage());
				res_url = "/resources/error.jsp";
			} finally {
				JDBCUtil.close(conn, pstmt, null);
			}
		} else {
			req.setAttribute("error_message", "???????????? ?????? ???????????????!! ??????????????? ??????????????? ????????? ??? ????????????!");
			res_url = "/login_form.jsp";
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher(res_url);
		dispatcher.forward(req, res);
	}
}


















