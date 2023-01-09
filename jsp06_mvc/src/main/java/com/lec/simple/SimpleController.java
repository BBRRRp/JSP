package com.lec.simple;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/simple")
public class SimpleController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		processRequest(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		processRequest(req, res);
	}
	
	private void processRequest(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
	
		String t = req.getParameter("t");
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<h1> Simple Controller = " + t + "</h1>");
		String view_jsp = "";
		
		if(t.equals("select")) {
			view_jsp = "/select.jsp";
		} else if(t.equals("insert")) {
			view_jsp = "/insert.jsp";
		} else {
			view_jsp = "/simple_view.jsp";
			req.setAttribute("result", "안녕하세요? 반갑습니다!!");
			req.setAttribute("now", new Date());
			req.setAttribute("id", "hong");
			req.setAttribute("name", "홍길동");
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view_jsp);
		dispatcher.forward(req, res);
	}
}















