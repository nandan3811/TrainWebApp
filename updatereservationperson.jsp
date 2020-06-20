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
<title>Update Information to Reservation </title>
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
try {
     Class.forName("com.mysql.jdbc.Driver");
	 Connection conn=DriverManager.getConnection(url, accountname, password);
	 Statement st=conn.createStatement();
	 String resnumberADD = request.getParameter("resnumberadd");
	 String trainidADD = request.getParameter("trainidadd");
	 double bookingfeeADD = Double.valueOf(request.getParameter("bookingfee"));
	 double totalfareADD = Double.valueOf(request.getParameter("totalfare"));
	 String classADD = request.getParameter("classadd");
	 String departureDATE = request.getParameter("dateadd");
	 String usernameADD = request.getParameter("usernameadd");
	 String seatnumADD = request.getParameter("seatnumadd");
	 
	 Date departureDate2 = null; 
	 departureDate2 = new SimpleDateFormat("yyyy-MM-dd").parse(departureDATE);
	 
	 String updatetwo = "UPDATE Reservation_On_Train SET booking_fee = ?, total_fare = ?, class = ?, date = ?, seatnum = ? WHERE res_number = ? AND trainid = ? AND username = ? ";
	 
	 ps = conn.prepareStatement(updatetwo);
			            
	 ps.setDouble(1,bookingfeeADD);
	 ps.setDouble(2,totalfareADD);
	 ps.setString(3,classADD);
	 ps.setDate(4,  new java.sql.Date(departureDate2.getTime()));
	 ps.setString(5,seatnumADD);
	 ps.setString(6,resnumberADD);
	 ps.setString(7,trainidADD);
	 ps.setString(8, usernameADD);
	
	 ps.executeUpdate();
	 int result = 0;
		result = ps.executeUpdate();
		//out.print("i am tired"); 
		if(result<1) {
			out.println("update error"); 
		}
		else
		{
			out.print("update succeeded");	
		}
		conn.close();
	 } catch (Exception ex) {
	 out.print(ex);
	 //out.print("sleep");
	 out.print("update failed");
	 }
	 %>
	 </body>
	 </html>
	 		            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
		