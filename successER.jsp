<% //Aarushi and Nandan %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("user")%>  
<a href="logout.jsp">Log out</a>
<%
    }
%>
<br>
	Messages
	<form action="Message.jsp" method="POST">
       <input type="submit" value="Enter"/>
     </form>
<br>

<br>
	  Click here for a list of Train Schedules (Specific Origin/Destination) 
	<form action="trainschedule1.jsp" method="POST">
       Origin: <input type="text" name="origin1"/> <br/>
       Destination: <input type="text" name="destination1"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
     Click here for a list of Train Schedules for a given Station(origin/destination)
     <br>
     <form action="station1.jsp" method="POST">
       Station: <input type="text" name="station2"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
     Click here for list of all customers who have seats reserved on a given transit line.
     For Train Number: follow the format: tnumber.(Ex:t1,t2,etc) If no one is reserved on the particular line, nothing will be shown.
     <br>
     <form action="customersontrain.jsp" method="POST">
       Transit Line : <input type="text" name="transitline1"/> <br/>
       Train Number <input type="text" name="trainid1"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
      <br>
       Add a new train line schedule. If adding a new TrainID, then please fill out  numseats and numcars. Thanks!
     <br>
     <form action="addreservation.jsp" method="POST">
       Transit Line: <input type="text" name="transitlineadd"/> <br/>
       Train ID: <input type = "text" name = "trainidadd" /> <br/>
       NumSeats: <input type = "text" name = "numseatsadd"/><br/>
       NumCars: <input type = "text" name = "numcarsadd" /><br/>
       Destination: <input type = "text" name = "destinationadd" /><br/>
       NumberofSeatsAvailable: <input type = "text" name = "numberofseatsadd"  /><br/>
       Origin: <input type = "text" name = "originadd"  /><br/>
       Arrival Date <input type="text" name="arrivaldateadd"/> <br/>
       Arrival Time <input type= "text" name="arrivaltimeadd"/> <br/>
       Departure Date <input type="text" name="departuredateadd"/> <br/>
       Departure Time <input type="text" name="departuretimeadd"/> <br/>
       Travel Time <input type="text" name="traveltimeadd"/> <br/>
       NumberofStops  <input type="text" name="numofstopsadd"/> <br/>
       Child Senior Discount  <input type="text" name="childseniordiscountadd"/> <br/>
       Disabled Discount  <input type="text" name="disableddiscountadd"/> <br/>
       Round Trip Fare <input type="text" name="roundtripfareadd"/> <br/>
       Monthly Fare <input type="text" name="monthlyfareadd"/> <br/>
       One way Fare <input type="text" name="onewayfareadd"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
       Update an old train line schedule. I am not allowing the user to update trainID because trainID is foreign key. That would basically mean to add a new reservation then.  
     <br>
     <form action="updatereservation.jsp" method="POST">
       Transit Line: <input type="text" name="transitlineadd"/> <br/>
       Train ID: <input type = "text" name = "trainidadd" /> <br/>
       Destination: <input type = "text" name = "destinationadd" /><br/>
       NumberofSeatsAvailable: <input type = "text" name = "numberofseatsadd"  /><br/>
       Origin: <input type = "text" name = "originadd"  /><br/>
       Arrival Date <input type="text" name="arrivaldateadd"/> <br/>
       Arrival Time <input type= "text" name="arrivaltimeadd"/> <br/>
       Departure Date <input type="text" name="departuredateadd"/> <br/>
       Departure Time <input type="text" name="departuretimeadd"/> <br/>
       Travel Time <input type="text" name="traveltimeadd"/> <br/>
       NumberofStops  <input type="text" name="numofstopsadd"/> <br/>
       Child Senior Discount  <input type="text" name="childseniordiscountadd"/> <br/>
       Disabled Discount  <input type="text" name="disableddiscountadd"/> <br/>
       Round Trip Fare <input type="text" name="roundtripfareadd"/> <br/>
       Monthly Fare <input type="text" name="monthlyfareadd"/> <br/>
       One way Fare <input type="text" name="onewayfareadd"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
      Delete an train line schedule item. 
     <br>
     <form action="deletetrain.jsp" method="POST">
       Train ID : <input type="text" name="trainidadd"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
       <br>
       Add information for a Reservation for a Person. The person must be logged in, and registered as a Customer(FK username coming from Customer) and trainid the person wants to go must already be on the train schedule. The train's classes are Coach, Business, Economy. 
        Customer should use their username they created. 
     <br>
     <form action="addreservationperson.jsp" method="POST">
       Reservation Number : <input type="text" name="resnumberadd"/> <br/>
       TrainID: <input type="text" name="trainidadd"/> <br/>
       Booking fee: <input type="text" name="bookingfee"/> <br/>
       Total Fare: <input type = "text" name = "totalfare"/> <br/>
       Class: <input type = "text" name = "classadd"/> <br/>
       Date: <input type = "text" name = "dateadd"/> <br/>
       User Name: <input type = "text" name = "usernameadd"/> <br/>
       Seat Number: <input type = "text" name = "seatnumadd"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
      <br>
       Update information for a Reservation for a Person. The person must be logged in, registered as a Customer(FK username coming from Customer) and trainid the person wants must be on the train schedule. Then only an update can happen for a specific entry. 
     <br>
     <form action="updatereservationperson.jsp" method="POST">
       Reservation Number : <input type="text" name="resnumberadd"/> <br/>
       TrainID: <input type="text" name="trainidadd"/> <br/>
       Booking fee: <input type="text" name="bookingfee"/> <br/>
       Total Fare: <input type = "text" name = "totalfare"/> <br/>
       Class: <input type = "text" name = "classadd"/> <br/>
       Date: <input type = "text" name = "dateadd"/> <br/>
       User Name: <input type = "text" name = "usernameadd"/> <br/>
       Seat Number: <input type = "text" name = "seatnumadd"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
      <br>
       Delete information for a Reservation for a Person. Need to provide a Train ID that is there in train table and a username(FK coming from Customer) and a res_number.  
       <br>
     <form action="deletereservationperson.jsp" method="POST">
       Reservation Number : <input type="text" name="resnumberadd"/> <br/>
       TrainID: <input type="text" name="trainidadd"/> <br/>
       Date: <input type = "text" name = "dateadd"/> <br/>
       User Name: <input type = "text" name = "usernameadd"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
  


</body>
</html>