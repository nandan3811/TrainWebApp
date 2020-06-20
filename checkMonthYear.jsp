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
<%
    String month = request.getParameter("month");   
    String year = request.getParameter("year");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem","nandan3811", "Swaminarayan1!");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select year(date),month(date),sum(total_fare) from Reservation_On_Train WHERE MONTH(date) =" + month + " AND YEAR(date) =" + year + " group by year(date),month(date) order by year(date),month(date);");
    
    if (rs.next()) {
    	session.setAttribute("month", month);
    	session.setAttribute("year", year);
        response.sendRedirect("salesReport.jsp");
    } else {
        out.println("Invalid month and year or no sales data reported. Must be 05 2020 format. <a href='adminDashboard.jsp'> Try again </a>");
    }
%>
</body>
</html>
