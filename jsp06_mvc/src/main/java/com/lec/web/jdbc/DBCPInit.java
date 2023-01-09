package com.lec.web.jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.tomcat.dbcp.dbcp2.ConnectionFactory;
import org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory;
import org.apache.tomcat.dbcp.dbcp2.PoolableConnection;
import org.apache.tomcat.dbcp.dbcp2.PoolableConnectionFactory;
import org.apache.tomcat.dbcp.dbcp2.PoolingDriver;
import org.apache.tomcat.dbcp.pool2.impl.GenericObjectPool;
import org.apache.tomcat.dbcp.pool2.impl.GenericObjectPoolConfig;



public class DBCPInit extends HttpServlet {

	@Override
	public void init() throws ServletException {
		loadJDBCDriver();
		initConnectionPool();
	}

	private void loadJDBCDriver() {
		String driverClass = getInitParameter("jdbcdriver");                                      
		try {
			Class.forName(driverClass);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("JDBC 드라이버 로딩 실패!!!");
		}
		
	}

	private void initConnectionPool() {
		String url = getInitParameter("url");
		String usr = getInitParameter("user");
		String pwd = getInitParameter("pass");
		
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
			String poolName = getInitParameter("poolName");
			driver.registerPool(poolName, connPool);
		} catch (Exception e) {
			throw new RuntimeException();
		}		
	}
}
