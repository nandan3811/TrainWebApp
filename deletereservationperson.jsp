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
<title>Delete Information to Reservation of Person </title>
<table border="1">
<tr>
<th>Reservation Number</th>
<th>Trainid</th>
<th>Booking Fee</th>
<th>Total Fare</th>
<th>Class</th>
<th>Date</th>
<th>Username</th>
<th>Seat Number</th>
</tr>
<%
String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
String accountname="nandan3811"; 
String password="Swaminarayan1!";
PreparedStatement ps = null; 
PreparedStatement ps2 = null; 
PreparedStatement ps3 = null; 

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection(url, accountname, password);
	Statement stmt=conn.createStatement();
	
	 String resnumberADD = request.getParameter("resnumberadd");
	 //out.println("resnumberADD");
	 String trainidADD = request.getParameter("trainidadd");
	 String departureDATE = request.getParameter("dateadd");
	 String usernameADD = request.getParameter("usernameadd");
	 
	 Date departureDate2 = null; 
	 departureDate2 = new SimpleDateFormat("yyyy-MM-dd").parse(departureDATE);
	 
	 String deletereservation1 = "DELETE FROM Reservation_For_Schedule WHERE res_number = ? ";
	 ps3 = conn.prepareStatement(deletereservation1);
	 ps3.setString(1,resnumberADD);
	 ps3.executeUpdate(); 
	 
	 
	 String deletecustomereservation = "DELETE FROM Customer_Reserved_On WHERE res_number = ? ";
	 ps2 = conn.prepareStatement(deletecustomereservation);
	 ps2.setString(1, resnumberADD);
	 ps2.executeUpdate();
	 //out.println("delete works first part"); 
	 
	 
	 String deletereservation = "DELETE FROM Reservation_On_Train WHERE res_number = ? AND trainid = ? AND date = ? AND username = ? ";
	 //out.println("My brother mota"); 
	 ps = conn.prepareStatement(deletereservation);
	// out.println("My brother like cookies!"); 
	 ps.setString (1,resnumberADD);
	 ps.setString(2,trainidADD);
	 ps.setDate(3, new java.sql.Date(departureDate2.getTime()));
	 ps.setString(4,usernameADD);
	// out.println("My brother likes dosa!"); 
	 //ps.executeUpdate();
	// out.println("delete works"); 
	 int result = 0;
		result = ps.executeUpdate();
		//out.print("i am tired"); 
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
	 