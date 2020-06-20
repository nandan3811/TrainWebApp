<% //Aarushi %>

  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<title>Customers on Train</title>
<table border="1">
<tr>
<th>First Name</th>
<th>Last Name</th>
<th>Transit Line</th>
<th>Train ID</th>
<th>Origin</th>
<th>Destination</th>

</tr>
<%
String transitlineone = request.getParameter("transitline1"); 
String trainidone = request.getParameter("trainid1"); 
try {
Class.forName("com.mysql.jdbc.Driver");
String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
String accountname="nandan3811"; 
String password="Swaminarayan1!";
String querytwo = "SELECT * FROM  Customers c INNER JOIN OnlineRailwayBookingSystem.Reservation_On_Train res INNER JOIN  OnlineRailwayBookingSystem.Reservation_Schedule sched ON res.trainid= sched.trainid AND c.username = res.username WHERE sched.trainid ='"+trainidone+"' and sched.transit_line = '" +transitlineone+ "'";   
Connection conn=DriverManager.getConnection(url, accountname, password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(querytwo);
while(rs.next()){
%>
<tr>

<td><%=rs.getString("firstname") %></td>
<td><%=rs.getString("lastname") %></td>
<td><%=rs.getString("transit_line")%></td>
<td><%=rs.getString("trainid")%></td>
<td><%=rs.getString("origin")%></td>
<td><%=rs.getString("destination")%></td>

</tr>
<%
}
%>
<%
}
catch(Exception e){
e.printStackTrace();
out.println("connection error");
}
%>
</table>
</body>
</html>