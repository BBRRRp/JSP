<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.io.File"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String fileName = request.getParameter("f");
	
	String srcPath = "D:/lec_02/00.share/97.temp/upload/" + fileName;
	String desPath = "D:/lec_02/00.share/97.temp/download/";
	
	File srcFile = new File(srcPath);
	File tarFile = new File(desPath);
	
	FileUtils.copyFileToDirectory(srcFile, tarFile);
	
	out.println("<h3>파일이 정성적으로 다운로드 되었습니다!!</h3>");
%>