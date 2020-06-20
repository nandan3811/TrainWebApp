<% //Aarushi %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date,java.text.SimpleDateFormat"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<title>Delete Information of Train </title>
<table border="1.0">
<tr>
<th> Train ID </th>
</tr>
<%
String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
String accountname="nandan3811"; 
String password="Swaminarayan1!";
PreparedStatement ps = null; 
PreparedStatement ps1 = null; 
PreparedStatement ps2 = null; 
PreparedStatement ps3 = null;
PreparedStatement ps4 = null; 
PreparedStatement ps5 = null; 

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection(url, accountname, password);
	Statement stmt=conn.createStatement();
	
	String trainidADD = request.getParameter("trainidadd");
	
	String deletetrain1 = "DELETE FROM Reservation_On_Train WHERE trainid = ? ";
	ps2 = conn.prepareStatement(deletetrain1);
	ps2.setString(1, trainidADD);
	ps2.executeUpdate();
	//out.println("delete works first part"); 
	
	String deletetrain5 = "DELETE FROM Station WHERE unique_id IN (SELECT s.unique_id FROM Station_stops s WHERE trainid = ?)";
	ps5 = conn.prepareStatement(deletetrain5);
	ps5.setString(1, trainidADD);
	ps5.executeUpdate();
	//out.println("delete station part wokrs");
	

	String deletetrain2 = "DELETE FROM Station_stops WHERE trainid = ? ";
	ps1 = conn.prepareStatement(deletetrain2);
	ps1.setString(1, trainidADD);
	ps1.executeUpdate();
	//out.println("delete works second part"); 
	
	
	String deletetrain3 = "DELETE FROM Reservation_For_Schedule WHERE trainid = ? ";
	ps2 = conn.prepareStatement(deletetrain3);
	ps2.setString(1,trainidADD);
	ps2.executeUpdate();
	//out.println("delete works third part");
	
	String deletetrain4 = "DELETE FROM Reservation_Schedule WHERE trainid = ? "; 
	ps3 = conn.prepareStatement(deletetrain4);
	ps3.setString(1,trainidADD);
	ps3.executeUpdate();
	//out.println("delete works fourth part");
	
	String deletetrain6 = "DELETE FROM Train WHERE trainid = ? ";
	ps4 = conn.prepareStatement(deletetrain6);
	ps4.setString(1,trainidADD);
	//ps4.executeUpdate();
	//out.println("delete works fifth part");
	
	
	int result = 0;
	result = ps4.executeUpdate();
	if(result<1) {
		out.println("deletion error"); 
	}
	else
	{
		out.print("delete succeeded ");	
	}
	conn.close();

 } catch (Exception ex) {
 out.print(ex);
 //out.print("sleep");
 out.print("Error connecting to mySQL database");
 }
 %>
 </body>
 </html>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	