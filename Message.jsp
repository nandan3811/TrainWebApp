<% //Nandan %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Messages</title>
</head>
<body>	
	<div class="content">
	
	<% 
		String url = "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";	
		Connection conn = null;		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "nandan3811", "Swaminarayan1!");
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		%> <br>Search questions and answers:<br>
			<form action="checkSearches.jsp" method="post">
				<textarea cols="100" maxlength="300" name="Search" ></textarea> 
				<input type="submit" value="submit">			
			</form>		
		
		<% 
		try {   
			
			String feedback = "We will get answer shortly";
			
			if  (Boolean.parseBoolean(session.getAttribute("isRepLoggedIn").toString()) == false){	
				%>
				<br>Ask a new question:<br>
				<form action="checkQuestions.jsp" method="post">
					<textarea cols="100" maxlength="300" name="Question" ></textarea> 
					<input type="submit" value="submit">					
				</form>	
				
				<%	if (request.getParameter("submit") != null && (request.getParameter("submit")).toString().equals("success")) { %>
					<h3>Question has been submitted.</h3>
			<%	} %>	
				<% 
				String Allquestions = "SELECT * FROM Messages WHERE username =?";
				String username = (session.getAttribute("user")).toString();
				ps = conn.prepareStatement(Allquestions);
				ps.setString(1, username);
				rs = ps.executeQuery();
			}
			
			else{
				String Allquestions = "SELECT * FROM Messages WHERE AnswerContent =?";
				ps = conn.prepareStatement(Allquestions);
				ps.setString(1, feedback);
				rs = ps.executeQuery();
			}
			
			if(rs.next()){ %> 
				<h1> Question Results: </h1>
				<table border = 1> 
					<tr>
						<th>Question</th>
						<th>Answer</th>
					</tr>				
					<% do { %>
						<tr>
							<td><%= rs.getString("QuestionContent") %> </td> 
							<% if (feedback.equals(rs.getString("AnswerContent")) && Boolean.parseBoolean(session.getAttribute("isRepLoggedIn").toString()) == true) { %>
									<form action= "checkAnswers.jsp?QuestionID= <%= rs.getInt("QuestionID") %>"method = "POST">
									<td>
										<textarea type="textarea" name="Answer"></textarea>
										<input type="submit" value="Submit Answer">
									</td>
									</form>
							<% } 	else { %>
							
							<td><%= rs.getString("AnswerContent") %> </td>
							<% } %>
						</tr>
					<% } while(rs.next()); %>
				</table>
		<% } else {%>	
			<br><h2>No questions have been asked.</h2>	
			
		<%} %>
		
		<% if  (Boolean.parseBoolean(session.getAttribute("isRepLoggedIn").toString()) == false){	%>
		
		<h2> Updates: </h2>
		<% 
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		String Alerts = "SELECT * FROM Updates WHERE username =?";
				String username = (session.getAttribute("user")).toString();
				ps = conn.prepareStatement(Alerts);
				ps.setString(1, username);
				rs = ps.executeQuery();
		%>
		<%} %>
<%
	  if(rs.next()){
		do{ %>
		
		<tr>
			<th>Reservation <%= rs.getString("res_number") %> is delayed </th><br>
		</tr>	
		
		<% } while (rs.next());
	}
		} catch (SQLException e){
			out.print("<p> Cannot connect to MYSQL</p>");
		    e.printStackTrace();    			
		} finally {
			try { rs.close(); } catch (Exception e) {} 
			try { conn.close(); } catch (Exception e) {} 	
		}
		%>
			
		
		
	</div>
</body>
</html>