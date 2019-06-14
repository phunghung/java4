<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Expression tag example</title>
</head>
<body>
	<%int a = 10;
	int b = 69;
	int c = 6;%>
	<%= a + " + " + b + "+ " + c + " = "%> <%= a+b+c %> </br>
	<%= a %> + <%= b %> + <%= c %> = <%= a+b+c %>	
</body>
</html>