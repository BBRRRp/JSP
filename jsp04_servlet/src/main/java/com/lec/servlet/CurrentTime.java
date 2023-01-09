package com.lec.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/now")
// www.localhost:8088/now
@WebServlet(urlPatterns={"/now", "/time", "/curr", "/zzz/*"},
	       initParams= {@WebInitParam(name="user", value="root"), 
	    		        @WebInitParam(name="pass", value="12345"), 
                       })
public class CurrentTime extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<html>");
		out.println("<head><title>현재시간</title></head>");
		out.println("<body>");
		out.println("<h1> user = " + getInitParameter("user") + "</h1>");
		out.println("<h1> pass = " + getInitParameter("pass") + "</h1>");
		out.println("<h1> xxxx = " + req.getParameter("xxxx") + "</h1>");
		out.println("<h1>@애너테이션방식(@WebServlet) </h1>");
		out.println("안녕하세요? 현재시간은 <br>");
		out.println("<h1>" + new Date() + "</h1>");
		out.println("</body>");
		out.println("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doGet(req, res);
	}
}
