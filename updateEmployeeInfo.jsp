<% //Denajah %>

<%@page import="java.sql.*"%>
<%
String username = request.getParameter("usernameER");
String firstnameER = request.getParameter("firstnameER");
String lastnameER = request.getParameter("lastnameER");

try{
	
String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
String accountname="nandan3811"; 
String password="Swaminarayan1!";
Connection conn=DriverManager.getConnection(url, accountname, password);
Class.forName("com.mysql.jdbc.Driver");
Statement st=conn.createStatement();
st.executeUpdate("update Employee_Rep set firstnameER='"+firstnameER+"',lastnameER='"+lastnameER+"' where usernameER='"+username+"'");
response.sendRedirect("adminDashboard.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>