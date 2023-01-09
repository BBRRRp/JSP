<%@page import="java.io.FileReader"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  1/7

	** out 태그 파라미터 c:out
	
	1. value     : JspWriter에 출력할 값을 지정, 일반적으로 value의 속성타입은 문자열
	2. escapeXml : 이 속성값이 true일 경우에 비교연산자를 아래와 같은 문자로 변환
	   (특수문자를 변환할지 안할지 여부를 지정)
	
	   < -> &lt
	   > -> &gt
	   & -> &amp
	   ' -> &#039
	   " -> &#034
	   
    3. default : value 속성에 값을 지정하지 않을 경우 default에 지정한 값이 출력
-->
<%
	out.println(20 > 10);
	out.println("<br>");
	out.println("20 > 10");
%>
<hr />
<!-- http://localhost:8088/jsp01_basic/jsp11_jstl/jsp07_out.jsp?path=jsp11_jstl/jsp02_if.jsp -->
<%
	FileReader reader = null;
	try {
		String path = request.getParameter("path");
		reader = new FileReader(getServletContext().getRealPath(path));
%>
		<pre>
			소스코드 : <%= path %><br>
 			<c:out value="<%= reader %>"></c:out>
 			<% reader = new FileReader(getServletContext().getRealPath(path)); %>
			<hr />
			<c:out value="<%= reader %>" escapeXml="true"></c:out>
			
		</pre>
<%
	} catch(Exception e) {
%>
		에러 : <%= e.getMessage() %>
<%		
	} finally {
		if(reader!=null) try { reader.close(); } catch(Exception e) {}
	}
%>
${path}