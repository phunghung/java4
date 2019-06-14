<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello JSP index</h1>
 
  <%
      java.util.Date date = new java.util.Date();
  %>
 
  <h2>
      Now is
      <%=date.toString()%>
  </h2>
</body>
</html>