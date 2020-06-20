<% //Denajah %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<title>Edit Employee</title>

<form method="post" action="updateEmployeeInfo.jsp">
<table border="1">
<tr>
<th>First Name</th>
<th>Last Name</th>
</tr>
<%
String username=request.getParameter("usernameER");
try {
Class.forName("com.mysql.jdbc.Driver");
String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
String accountname="nandan3811"; 
String password="Swaminarayan1!";
String query = "select * from Employee_Rep where usernameER='"+username+"'";
Connection conn=DriverManager.getConnection(url, accountname, password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><input type="text" name="firstnameER" value="<%=rs.getString("firstnameER")%>"/></td>
<td><input type="text" name="lastnameER" value="<%=rs.getString("lastnameER")%>"/></td>
<td><input type="hidden" name="id" value="<%=rs.getString(1)%>"/></td>
</tr>
<tr>
<td><input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
</tr>
<%
}
}
catch(Exception e){}
%>
</table>
</form>