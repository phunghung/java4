<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.regex.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEHE XSS</title>
</head>
<body>
	<form action="CodeXSS.jsp" method="post">
		Enter your name: <input type="text" name="name">
		<input type="submit">
	</form>
	<%
	Connection connection = null; 
try {
    String connectionURL = "jdbc:mysql://localhost:3306/NorthWind";
    String USER_NAME = "hunga";
    String PASSWORD = "ABCabc.12"; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, USER_NAME, PASSWORD);
    if(!connection.isClosed())
         out.println("Ket noi thanh cong website");
    
    Statement st = connection.createStatement();
    
    PreparedStatement pstatement = null;
    String queryString = "insert into TEN(ten) values(?)";
    pstatement = connection.prepareStatement(queryString);
    int updateQuery = 0;
    if(request.getMethod().equalsIgnoreCase("post"))
 	{
  		String name = request.getParameter("name");

		String patternName = "[a-zA-Z ]{1,45}";
		if(!name.matches(patternName)) {
			name = "";
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('invalid format name');");  
			out.println("</script>");
		}

 		if(!name.isEmpty())
 		{
 			pstatement.setString(1, name);
 			updateQuery = pstatement.executeUpdate();
			out.println("<br>Hi "+name+". Đã thêm tên của bạn vào database");
 		}
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