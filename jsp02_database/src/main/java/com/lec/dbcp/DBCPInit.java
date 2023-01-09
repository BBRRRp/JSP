package com.lec.dbcp;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {

	@Override
	public void init() throws ServletException {
		laodJDBCDriver();
		initConnectionPool();
	}

	private void laodJDBCDriver() {
		//driverClass= org.mariadb.jdbc.Driver
		String driverClass = getInitParameter("jdbcdriver");
		
		try {
			Class.forName(driverClass);
		} catch(ClassNotFoundException e) {
			throw new RuntimeException("JDBC 드라이버 로딩실패 -" +
					"web.xml 초기화 파라미터 jdbcdriver를 확인하세요");	
		}
	}
	
	private void initConnectionPool() {
	
		String url = getInitParameter("url"); //jdbc:mariadb://localhost:3306/lec_jsp
		String usr = getInitParameter("user"); //root
		String pwd = getInitParameter("pass"); //12345
		
		// A. Connection Factory 생성
		
		//1.커넥션풀이 새로운 커넥션을 생성할 때 사용하는 커넥션 팩토리를 생성
		ConnectionFactory cf = new DriverManagerConnectionFactory(url, usr, pwd);
		//2.PoolableConnectionFactory을 생성 - 팩토리 생성 DBCP는 커넥션 풀에 커넥션을 보관할때 
		//	PoolableConnectionFactory을 사용한다. 이 클래스는 내부적으로 커넥션을 보관하고 있으며, 커넥션 풀을 관리하는데
		//  필요한 기능을 제공한다.예를 들면, connection을 close하면 connection을 삭제하는 것이 아니라
		//  connection pool에 connection을 반환한다.
		PoolableConnectionFactory pcf = new PoolableConnectionFactory(cf, null);
	
		//3. connection이 유효한지 여부를 검사하기 위한 SQL을 지정
		pcf.setValidationQuery("select 1"); // connection 유효성을 검사 : Maridb, mySQL
		//오라클 : pcf.setValidationQuery("select * from dual");
		
		// B. Connection Pool 설정정보
		//1. 설정정보를 관리할 객체를 생성
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		//2. 커넥션의 검사주기
		poolConfig.setTimeBetweenEvictionRunsMillis(1000l*60l*5l);
		//3. 풀에 보관중인 커넥션의 유효여부를 검사할지 안할지 여부를 설정
		poolConfig.setTestWhileIdle(true);
		//4. 사용할 connection의 최소 갯수를 설정
		poolConfig.setMinIdle(4);
		//5. 사용할 connection의 최대 갯수를 설정
		poolConfig.setMaxIdle(5);
		
		// C. Connection Pool 설정정보 이용해서 생성
		//1. PoolableConnection을 생성할때 사용할 커넥션 팩토리와 설정정보를 이용해서
		// 커넥션 풀을 생성
		GenericObjectPool<PoolableConnection> cp = new GenericObjectPool<>(pcf, poolConfig);
		//2. 생성할 커넥션 풀을 연결
		pcf.setPool(cp);
		
		// D. Connection Pool에 제공할 JDBC 드라이버를 등록
		try {
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp");
			String poolName = getInitParameter("poolName");
			driver.registerPool(poolName, cp);
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
	}
}
