<% //Aarushi  %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date,java.text.SimpleDateFormat"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<title>Station Stuff </title>
<table border="1">
<tr>
<th>UniqueID</th>
<th>TransitLine</th>
<th>Train ID</th>
<th>Origin</th>
<th>Date Arrival Time</th>
</tr>
<%

String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
String accountname="nandan3811"; 
String password="Swaminarayan1!";
PreparedStatement ps = null; 
PreparedStatement ps2= null; 
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection(url, accountname, password);
Statement stmt=conn.createStatement();

String uniqueidADD = request.getParameter("uniqueidadd");
String transitlineADD = request.getParameter("transitlineadd");
String trainidADD = request.getParameter("traninidadd");
String originADD = request.getParameter("originadd");
String dataarrivaltimeADD = request.getParameter("datearrivaltimeadd");
String stationnameADD = request.getParameter("nameofstationadd");
String stateADD = request.getParameter("stateadd");
String cityADD = request.getParameter("cityadd");

Date date3 = null; 
date3 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(dataarrivaltimeADD);

String insertfour = "INSERT INTO Station_stops(unique_id,transit_line,trainid,origin,date_arrival_time)"
                     +"VALUES(?,?,?,?,?)";


ps = conn.prepareStatement(insertfour); 
ps.setString(1, uniqueidADD);
ps.setString(2,transitlineADD);
ps.setString(3,trainidADD);
ps.setString(4,originADD);
ps.setTimestamp(5,new java.sql.Timestamp(date3.getTime()));

ps.executeUpdate(); 


String insertwo = "INSERT INTO Station(unique_id,name,state,city)"
                  +"VALUES(?,?,?,?)";
ps2 = conn.prepareStatement(insertwo);
ps2.setString(1,uniqueidADD);
ps2.setString(2,stationnameADD);
ps2.setString(3,stateADD);
ps2.setString(4,cityADD);

ps2.executeUpdate();


conn.close();
out.print("insert succeeded:stationstops and station");

} catch (Exception ex) {
out.print(ex);
out.print("insert failed");
}
%>
<p> If your insert is successful, then you may go back add more stations if you want! </p>
<a href = "stationadd.jsp"><button >Click here to go back to add more stations! </button></a>
</body>
</html>






