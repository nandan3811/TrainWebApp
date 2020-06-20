<% //Denajah %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Customer</title>
</head>
<body>
<a href="adminDashboard.jsp">Go back.</a>
<br> <br>

<table border="1">
<tr><th>Username</th><th>Num. of Reservations</th></tr>
<%

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem","nandan3811", "Swaminarayan1!");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT username,COUNT(*) FROM Reservation_Schedule INNER JOIN Reservation_On_Train GROUP BY username ORDER BY COUNT(*) DESC LIMIT 1");

    %>
    
    <%
    while(rs.next()){
    %>
    <tr>
    <td><%=rs.getString("username")%></td>   
    <td><%=rs.getString("COUNT(*)")%></td>     
    </tr>
    <%
    
    }
    
    %>
</table>
</body>

</html>

