<% //Denajah %>

<%@page import="java.sql.*"%>
<%
String username = request.getParameter("username");
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String email = request.getParameter("email");
String streetadd = request.getParameter("streetadd");
String telnumber = request.getParameter("telnumber");
String zip = request.getParameter("zip");
String state = request.getParameter("state");
String city = request.getParameter("city");

try{
	
String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
String accountname="nandan3811"; 
String password="Swaminarayan1!";
Connection conn=DriverManager.getConnection(url, accountname, password);
Class.forName("com.mysql.jdbc.Driver");
Statement st=conn.createStatement();
st.executeUpdate("update Customers set firstname='"+firstname+"',lastname='"+lastname+"',email='"+email+"',streetadd='"+streetadd+"',telnumber="+telnumber+",zip='"+zip+"',state='"+state+"',city='"+city+"' where username='"+username+"'");
response.sendRedirect("adminDashboard.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>