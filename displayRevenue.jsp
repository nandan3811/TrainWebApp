<% //Denajah %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Revenue</title>
</head>
<body>

<table border="1">
<tr><th>Sum of Total Fare</th></tr>

<%
String itemname=request.getParameter("itemname");
String category = request.getParameter("category");
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
String query = "SELECT sum(total_fare) FROM Reservation_Schedule INNER JOIN Reservation_On_Train WHERE " + category + "='" + itemname+"'";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<%
while(rs.next()){
%>

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