package com.lec.servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletLifeCyle
 */
@WebServlet("/lifecyle")
public class ServletLifeCyle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */	
    public ServletLifeCyle() {
	        super();
	        // TODO Auto-generated constructor stub
    }
    
    @PostConstruct
    public void initPosConstruct() {
    	System.out.println("0. initPosConstruct() 메서드실행");
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	System.out.println("1. init()메서드 실행");
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	System.out.println("2. doGet / doPost메서드 실행");
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	@Override
	public void destroy() {
		System.out.println("3. destroy()메서드 호출");
	}
	
	@PreDestroy
	public void destoryPreDestory() {
		System.out.println("4. destoryPreDestory()메서드 호출");
	}

}
























