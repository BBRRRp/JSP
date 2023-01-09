package com.lec.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorld extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
		throws ServerException, IOException {
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<html>");
		out.println("<head><title>현재시간</title></head>");
		out.println("<body>");
		out.println("<h1> web.xml - get 방식 <h1>");
		out.println("안녕하세요? 현재시간은 <br>");
		out.println("<h1>get방식 " + new Date() + "</h1>");
		out.println("</body>");
		out.println("</html>");
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServerException, IOException {
			
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<html>");
			out.println("<head><title>현재시간</title></head>");
			out.println("<body>");
			out.println("<h1> web.xml - post 방식 <h1>");
			out.println("안녕하세요? 현재시간은 <br>");
			out.println("<h1>" + new Date() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
}
















