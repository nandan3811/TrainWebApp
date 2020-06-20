<% //Nandan %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		
<% 
	String url = "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
	Connection conn = null;
	PreparedStatement ps = null;
			
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "nandan3811", "Swaminarayan1!");
			
		String username = (session.getAttribute("user")).toString();
		String question = request.getParameter("Question");
		
		if(username != null  && question != null){
			String insert = "INSERT INTO Messages (username, QuestionContent, AnswerContent)" + "VALUES (?, ?, ?)";
			
			ps = conn.prepareStatement(insert);
				
			ps.setString(1, username);
			ps.setString(2, question);
			ps.setString(3, "We will get answer shortly");
				
			int num = 0;
			num = ps.executeUpdate();
			if (num < 1) {
		        out.println("Error");
			} else {
		        response.sendRedirect("Message.jsp?submit=success");
		        return;
			}
		}     
	} catch(Exception e) {
	  	out.print("<p>Cannot get MYSQL server.</p>");
	    e.printStackTrace();
	} 
		        		        
	%>

</body>
</html>