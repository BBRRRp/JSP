package com.lec.servlet;

import java.io.IOException;
import java.io.StringReader;
import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInitListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// contextInitialized메서드는 web.xml의 <context-param>의 정보를 가져온다.
		String poolConfing = sce.getServletContext().getInitParameter("dbConnect");
		System.out.println(poolConfing);
		
		Properties prop = new Properties();
		try {
			prop.load(new StringReader(poolConfing));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		loadJDBCDriver(prop);
		initConnectionPool(prop);
	}
	private void loadJDBCDriver(Properties prop) {
		String driverClass = prop.getProperty("jdbcdriver"); 
		try {
			Class.forName(driverClass);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("JDBC 드라이버 로딩 실패!!!");
		}		
	}
	
	private void initConnectionPool(Properties prop) {
		
		String url = prop.getProperty("url");
		String usr = prop.getProperty("user");
		String pwd = prop.getProperty("pass");		

		ConnectionFactory connFactory = new DriverManagerConnectionFactory(url, usr, pwd);
		PoolableConnectionFactory poolFactory = new PoolableConnectionFactory(connFactory, null);
		poolFactory.setValidationQuery("select 1");
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		poolConfig.setTimeBetweenEvictionRunsMillis(1000l * 60l * 5l);
		poolConfig.setTestWhileIdle(true);
		poolConfig.setMinIdle(4);
		poolConfig.setMaxIdle(10);		
		GenericObjectPool<PoolableConnection> connPool = new GenericObjectPool<>(poolFactory, poolConfig);
		poolFactory.setPool(connPool);	

		try {
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			String poolName = prop.getProperty("poolName");
			driver.registerPool(poolName, connPool);
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// dummy
	}
}