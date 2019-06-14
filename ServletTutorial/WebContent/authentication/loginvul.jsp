<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.regex.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection connection = null; 
	try {
	    String user = request.getParameter("user");
		String pass = request.getParameter("pwd");
	    String connectionURL = "jdbc:mysql://localhost:3306/NorthWind";
	    String USER_NAME = "hunga";
	    String PASSWORD = "ABCabc.12"; 
	    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	    connection = DriverManager.getConnection(connectionURL, USER_NAME, PASSWORD);
// 	    if(!connection.isClosed())
// 	         out.println("Ket noi thanh cong website");

	    Statement st= connection.createStatement();
		ResultSet rs=st.executeQuery("select * from inforUser where user='"+user+"' and pass='"+pass+"' limit 0,1");
		
// 		PreparedStatement ps=(PreparedStatement) connection.prepareStatement("select * from inforUser where user=? and pass=? limit 0,1");
// 		ps.setString(1,user);
// 		ps.setString(2,pass);
// 		ResultSet rs=ps.executeQuery();
		
		if(rs.next())
		{
			out.println("Login success");
		}
		else
		{
			out.println("Login failed");
		}
	    
	    //connection.close();
	}catch(Exception ex){
	    out.println("Unable to connect to database" +ex);
	}
		finally{
	        if(connection != null) {
	            try {
	            	connection.close();
	                System.out.println("Dong ket noi");
	            }
	            catch(Exception e) {
	                
	            }
	        }
	    }	
	%>
</body>
</html>