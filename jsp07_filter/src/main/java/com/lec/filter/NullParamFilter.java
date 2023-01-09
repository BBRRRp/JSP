package com.lec.filter;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/*
	필터(filter)란?
	
	filter는 JSP/Servlet에서 요청이 들어오면 요청을 처리하기 이전에 이 요청이 올바른지 또는 특정자원에 접근
	권한이 있는지등을 사전에 처리할 수 있도록 한다. 또한 응답하느는 데이터를 변경하거나 응답을 취소할 수가 
	있다. 즉, HTTP의 request와 response의 내용을 변경할 수 있도록 지원하는 class(객체)이다.
	
	필터는 객체형태로 클라이언트에서 요구하는 요청과 웹서버(jsp, servlet...)의 사이에 위치하여 클라이언트의
	요청을 제어할 수 있도록 한다. 또한 웹서버와 응답처리 사잉에 위치하여 응답을 제어할 수 있도록 한다.
	
	필터는 요청, 응답정보를 변경할 수 있을 뿐만 아니라 요청,응답의 흐름도 제어할 수 있다. 즉, 필터는 웹브라우
	저의 요청을 필터의 체인으로 연결해서 다음단계로 보낼 수도 있고 다른 형태의 결과를 웹브라우저에 전송할 수
	도 있다.
	
	A. 필터를 구현하기 위해서는 3개의 핵심 class가 필요하다.
	
	   1. javax.servlet.Filter 인터페이스      : 웹브라우저와 최종자원사이에 위치하는 필터를 구현하는 객체가
	      상속하는 인터페이스
	   2. javax.servlet.ServletRequestWrapper  : 필터가 요청한 결과를 저장하는 클래스
	   3. javax.servlet.ServletResponseWrapper : 필터가 응답한 결과를 저장하는 클래스
	
	B. Filter인터페이스의 추상메서드
	
	   1. init()     : 필터를 초기화할 때 호출
	   2. doFilter() : 필터기능을 수행하는 메서드, chain()메서드를 이용해서 다음 filter로 이동
	   3. destory()  : 필터가 웹컨테이너에서 삭제될 때 호출
	   
	C. 필터 구현절차
	
	   1. init()메서드를 호출해서 초기화작업을 수행
	   2. doFilter()
	   
	      a. request파라미터를 이용해서 요청의 필터작업을 수행 
	      b. chain.doFilter(req, res)를 이용하여 체인의 다음 필터를 수행
	      c. response를 이용해서 응답의 필터링 작업을 수행
	      
	   3. destory() : 필터가 사요하는 자원들을 반납
	
*/
public class NullParamFilter implements Filter {
	
	private String[] paramNames = null;
	
	@Override
	public void init(FilterConfig conf) throws ServletException {
		String params = conf.getInitParameter("parameterNames");
		StringTokenizer st = new StringTokenizer(params, ",");
		paramNames = new String[st.countTokens()];
		for(int i=0;st.hasMoreTokens();i++) {
			paramNames[i] = st.nextToken();
			// System.out.println(paramNames[i]);
		}
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		NullParamReqWrapper reqWrapper = new NullParamReqWrapper((HttpServletRequest) req);
		reqWrapper.checkNull(paramNames);
		chain.doFilter(reqWrapper, res);
	}
	
	@Override
	public void destroy() {
		Filter.super.destroy();
	}
}
















