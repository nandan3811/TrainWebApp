<% //Nandan %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Searches</title>
</head>
<body>	

	<% 
		String url = "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";	
		Connection conn = null;		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "nandan3811", "Swaminarayan1!");
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		 
		String searching = "SELECT * FROM Messages";
		ps = conn.prepareStatement(searching);
		rs = ps.executeQuery();
		
		int count = 0;
		
		if(rs.next()){ %> 
		<h1> Search Results: </h1>
		<table border = 1> 
			<tr>
				<th>Question</th>
				<th>Answer</th>
			</tr>				
			<% do { %>
				<tr>
					<% if ( request.getParameter("Search").equals(rs.getString("QuestionContent")) || request.getParameter("Search").equals(rs.getString("AnswerContent")) ) { %>
								<% count ++; %>
								<td><%= rs.getString("QuestionContent") %> </td> 
								<td><%= rs.getString("AnswerContent") %> </td> 
					<% } %>

				</tr>
			<% } while(rs.next()); %>
			
			<% if (count == 0) {%>
					<td> No matches. </td> 
					<td> No matches. </td> 
			<% }  %>
		</table>
<% } else {%>	
	<br><h2>No matches</h2>	
	
<%} %>
	

</body>
</html>