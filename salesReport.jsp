<% //Denajah %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Reports</title>
</head>
<body>

<table border="1">
<tr><th>Month</th><th>Year</th><th>Total Revenue</th></tr>

<%

Connection con = null;
String driver = "com.mysql.jdbc.Driver";
String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
String userName="nandan3811"; 
String password="Swaminarayan1!";

out.println("<a href='adminDashboard.jsp'>Go back.</a>");
out.println("<br>");
out.println("<br>");

try{
Class.forName(driver);
con = DriverManager.getConnection(url,userName,password);
String month = (String) session.getAttribute("month");
String year = (String) session.getAttribute("year");
String query = "select year(date),month(date),sum(total_fare) from Reservation_On_Train WHERE MONTH(date) =" + month + " AND YEAR(date) =" + year + " group by year(date),month(date) order by year(date),month(date);";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<%
while(rs.next()){
%>

<tr><td><%=rs.getString("month(date)")%></td>
<td><%=rs.getString("year(date)")%></td>
<td><%=rs.getString("sum(total_fare)")%></td>
</tr>

<%
}
%>
<%
}
catch(Exception e){
e.printStackTrace();
}
%>
</table>

</body>
</html>