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
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("user")%>  
<a href="logout.jsp">Log out</a>
<%
    }
%>
<br>
	Messages
	<form action="Message.jsp" method="POST">
       <input type="submit" value="Enter"/>
     </form>
<br>
<br>
	Search for Train Schedule
	<form action="Search For Train Schedule.jsp" method="POST">
       <input type="submit" value="Enter"/>
     </form>
<br>
</body>
</html>