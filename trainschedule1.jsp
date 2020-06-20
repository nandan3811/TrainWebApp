<% //Aarushi %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding= "ISO-8859-1" import ="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">>
<html>
<head>
         <meta charset="UTF-8">
          <title>Train Schedule with specific origin and destination</title>
</head>
<body>
<table border="1">
<tr>
<th>Transit Line</th>
<th>Trainid</th>
<th>Destination</th>
<th>Origin</th>
<th>Arrival Date</th>
<th>Arrival Time</th>
<th>Departure Date</th>
<th>Departure Time</th>
<th>Travel Time</th>
<th>Number of Stops</th>
</tr>
<%
String originone=request.getParameter("origin1");
String destinationone = request.getParameter("destination1");
try {
Class.forName("com.mysql.jdbc.Driver");
String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
String accountname="nandan3811"; 
String password="Swaminarayan1!";
String queryone = "select * from Reservation_Schedule where origin='"+originone+"' and destination = '" +destinationone+ "' "; 
Connection conn=DriverManager.getConnection(url, accountname, password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(queryone);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("transit_line")%></td>
<td><%=rs.getString("trainid")%></td>
<td><%=rs.getString("destination")%></td>
<td><%=rs.getString("origin")%></td>
<td><%=rs.getDate("arrival_date")%></td>
<td><%=rs.getTime("arrival_time")%></td>
<td><%=rs.getDate("departure_date")%></td>
<td><%=rs.getTime("departure_time")%></td>
<td><%=rs.getTime("travel_time")%></td>
<td><%=rs.getInt("number_of_stops")%></td>
</tr>
<%
}
%>
<%
}
catch(Exception e){
e.printStackTrace();
out.println("I like my brother");
}
%>
</table>
</body>
</html>