package com.lec.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.command.CommandHandler;
import com.lec.command.NullHandler;

public class ControllerUsingURI extends HttpServlet {
	
	// 커맨트패턴 Map<key, value>형태로 key는 커맨드(요청), value는 컨트롤러(핸들러)역할의 객체
	private Map<String, CommandHandler> handler = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		String controllerFile = getInitParameter("controllerURI");
		Properties prop = new Properties();
		String controllerFilePath = getServletContext().getRealPath(controllerFile);
		
		try(FileReader fis = new FileReader(controllerFilePath)) {
			prop.load(fis);
		} catch(Exception e) {
			throw new ServletException();
		}
		
		Iterator key = prop.keySet().iterator();
		while(key.hasNext()) {
			String command = (String) key.next(); // hello, board, member
			String className = prop.getProperty(command); // Handler 클래스
			
			try {
				Class<?> handlerClass = Class.forName(className);
				CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
				handler.put(command, handlerInstance);
				// { hello=HelloHandler(객체), board=BoardHandler, member=Member}
			} catch (Exception e) {
				throw new ServletException();
			}
		}
	}
	
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
		
		// localhost:8088/hello.do
		String cmd = req.getRequestURI(); // hello.do
		if(cmd.indexOf(req.getContextPath()) == 0) {
			cmd = cmd.substring(req.getContextPath().length());
		}
		
		CommandHandler command = handler.get(cmd);
		
		if(command == null) command = new NullHandler();
		
		String view_page = "";
		
		try {
			view_page = command.process(req, res);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(view_page!=null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher(view_page);
			dispatcher.forward(req, res);
		}		
	}
	
}





















