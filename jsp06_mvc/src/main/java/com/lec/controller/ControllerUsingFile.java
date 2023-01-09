package com.lec.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.security.sasl.SaslException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.command.CommandHandler;
import com.lec.command.NullHandler;

/*
	커맨트패턴 기반의 프로그램
	
	MVC(Model View Controller)패턴에서 Contorller역활을 하는 Servlet이 수행하는 작업은 사용자가 요청한
	내용을 분석해서 요청에 맞는 작업(응답)이 무엇인지를 분석하는 역할을 한다. 사용자의 요청을 판단하기
	위해서 사용하는 방법이 여러가지가 있는데 가장 일반적인 방법은 명령어를 사용하는 것이다.
	
	예를 들어 사용자가 게시판목록보기, 글쓰기 등의 명령을 서블릿에 전송하고 컨트롤러 서블릿은 사용자가
	전송한 용청에 해당하는 기능을 수행한 후에 View(jsp or html)를 통해 결과를 보여주는 패턴을 커맨드패
	턴이라고 한다.
	
	커맨트패턴에서 파라미터에 명령을 전달하는 방법은 2가지가 있다.
	
	1. 특정이름의 파라미터에 명령어정보를 전달하는 방법(ControllerUsingFile.java)
	
	   localhost:8088/mvc/file?cmd=hello
	   
	2. 요청되는 URI자체를 명령어로 사용하는 방법(ControllerUsingURI.java)
	
	   localhost:8088/mvc/member.do
	
*/
public class ControllerUsingFile extends HttpServlet {
	
	// 커맨트패턴 Map<key, value>형태로 key는 커맨드(요청), value는 컨트롤러(핸들러)역할의 객체
	private Map<String, CommandHandler> handler = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		String controllerFile = getInitParameter("controllerFile");
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
		
		// localhost:8088/file?cmd=hello
		String cmd = req.getParameter("cmd");
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


























