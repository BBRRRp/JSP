<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String fileName = request.getParameter("f");
	
	String fromPath = "D:/lec_02/00.share/97.temp/upload/" + fileName;
	String toPath = "D:/lec_02/00.share/97.temp/download/" + fileName;
	
	
/* 	실제웹서버운영시에 관련된 경로
	ServletContext context = getServletContext(); // 현재웹컨테이너의 root폴더 즉 WebContent
	String downPath = context.getRealPath("upload");
	String saveFilePath = "D:/lec_02/05.jsp/jsp05_fileupload/WebContent/downlad/" + fileName;
	out.println("<h3>Context      = " + context + "</h3>");
	out.println("<h3>downPath     = " + downPath + "</h3>");
	out.println("<h3>saveFilePath = " + saveFilePath + "</h3>"); */
	
	byte[] b = new byte[4096];
	File f = new File(toPath);
	FileInputStream fis = new FileInputStream(fromPath);
	
	String sMimeType = getServletContext().getMimeType(fromPath); // mimetype = file type(pdf, exe, txt...)
	if(sMimeType==null) sMimeType = "application/octet-stream";
	
	String sEncodig = new String(fileName.getBytes("utf-8"), "8859_1");
	String sEncodig1 = URLEncoder.encode(fileName, "utf-8");
	
	response.setContentType(sMimeType);
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Content-Disposition", "attachment; filename = " + sEncodig1);
	
	ServletOutputStream os = response.getOutputStream();
	int numRead;
	
	while((numRead = fis.read(b, 0, b.length)) != -1) {
		os.write(b, 0, numRead);
	}
	
	os.flush();
	os.close();
	fis.close();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>
	<h1>파일다운로드하기</h1>
</body>
</html>