<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scriptlet</title>
</head>
<body>
	<%! int num = 69; %>
	<% if(num > 5){%>
	<h3>HI, valid</h3>
	<%} else{ %>
	<h3>num value should not be less than 6</h3>
	<%} %>
</body>
</html>