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
			
			String Question = request.getParameter("QuestionID");
			Question = Question.trim();
			int QuestionID = Integer.parseInt(Question);
			String answer = request.getParameter("Answer");
			if(!answer.isEmpty()){
				
				String insert = "UPDATE Messages SET AnswerContent=? WHERE QuestionID=?";
				
				ps = conn.prepareStatement(insert);
				
				ps.setString(1, answer);
				ps.setInt(2, QuestionID);
				
				int result = 0;
		        result = ps.executeUpdate();
		        if (result < 1) {
		        	out.println("Error: Question did not enter.");
		        } else { %>
		        	<jsp:include page="Message.jsp" flush="true"/>
					<div>
						<h2>Question was answered.</h2>
					</div>
		    <%  }
		        
			}    
		} catch(Exception e) {
	        out.print("<p> Cannot get MYSQL server.</p>");
	        e.printStackTrace();
	    }       
		        
	%>

</body>
</html>