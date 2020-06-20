<% //Denajah %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checking</title>
</head>
<body>
<a href="adminDashboard.jsp">Go back.</a>
<br> <br>

<table border="1">
<tr><th>Transit Line</th><th>Train Num</th><th>Class</th><th>Reservation Number</th><th>Total Fare</th><th>Booking Fee</th><th>Date</th><th>Seat Num</th><th>Destination</th><th>Departure Date</th><th>Departure Time</th><th>Arrival Time</th></tr>
<%
    String transline = request.getParameter("transline");
	String trainid = request.getParameter("trainid");  
	String customer = null;
	if (transline.equals("Customer_Name")) {
		customer = transline;
	}
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem","nandan3811", "Swaminarayan1!");
    Statement st = con.createStatement();
    ResultSet rs;
    if (customer == null)
    rs = st.executeQuery("SELECT * FROM OnlineRailwayBookingSystem.Reservation_On_Train res INNER JOIN OnlineRailwayBookingSystem.Reservation_Schedule sched ON res.trainid = sched.trainid ORDER BY transit_line ASC, res.trainid ASC");
    else {
    	rs = st.executeQuery("SELECT * FROM OnlineRailwayBookingSystem.Reservation_On_Train res INNER JOIN OnlineRailwayBookingSystem.Reservation_Schedule sched ON res.trainid = sched.trainid ORDER BY username ASC");
    }
    %>
    
    <%
    while(rs.next()){
    String username = rs.getString("username");
    %>
    <tr>
    <td><%=rs.getString("transit_line")%></td>
    <td><%=rs.getString("trainid")%></td>
    <td><%=rs.getString("class")%></td>
    <td><%=rs.getString("res_number")%></td>
    <td><%=rs.getString("total_fare")%></td>
    <td><%=rs.getString("booking_fee")%></td>
    <td><%=rs.getString("date")%></td>
    <td><%=rs.getString("seatnum")%></td>
    <td><%=rs.getString("destination")%></td>
    <td><%=rs.getString("departure_date")%></td>
    <td><%=rs.getString("departure_time")%></td>
    <td><%=rs.getString("arrival_time")%></td>
    </tr>
    <%
    }
    %>
</table>
</body>
</html>
