package com.lec.member.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DBConnectListener implements ServletContextListener {

	public DBConnectListener() {}
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		// web.xml context가져오기
		ServletContext context = sce.getServletContext();
		String driverClass = context.getInitParameter("driverClass");
		
		// DB driver로딩
		try {
			Class.forName(driverClass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		ServletContextListener.super.contextDestroyed(sce);
	}
}
