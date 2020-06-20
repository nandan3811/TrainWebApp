<% //Anne %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search For Train Schedule</title>
	</head>
<body>
Find a Train Schedule Below Based on Origin, Destination, or Departure Date:

<br>
									  
<br>



Find A Train Schedule by Origin:
<br>
<br>
	<form method="get" action="Originsearch.jsp">
	<label for="origin">Please Select Your Train's Station of Origin:</label>
		<select name="origin" size=1>
			<option value="Bay Head">Bay Head</option>
			<option value="Long Branch">Long Branch</option>
			<option value="Penn Station">Penn Station</option>
			<option value="Rahway">Rahway</option>
			<option value="Trenton Transit Center">Trenton Transit Center</option>
			<option value="30th Street">30th Street</option>
			<option value="Atlantic City Rail Terminal">Atlantic City Rail Terminal</option>
		</select>
	<br>
	<label for="order by">Please Select How You Would Like The Train Schedule To Be Sorted:</label>
	<br>
		<select name="order by" size=1>
			<option value="arrival_time">Arrival Time</option>
			<option value="departure_time">Departure Time</option>
			<option value="origin">Origin</option>
			<option value="destination">Destination</option>
			<option value="one_way_fare">One Way Fare</option>
			<option value="round_trip_fare">Round Trip Fare</option>
			<option value="monthly_fare">Monthly Fare</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Find A Train Schedule by Destination:
<br>
<br>
	<form method="get" action="Destinationsearch.jsp">
	<label for="destination">Please Select the Destination of Your Train:</label>
		<select name="destination" size=1>
			<option value="Bay Head">Bay Head</option>
			<option value="Long Branch">Long Branch</option>
			<option value="Penn Station">Penn Station</option>
			<option value="Rahway">Rahway</option>
			<option value="Trenton Transit Center">Trenton Transit Center</option>
			<option value="30th Street">30th Street</option>
			<option value="Atlantic City Rail Terminal">Atlantic City Rail Terminal</option>
			</select>
<br>
	<label for="order by">Please Select How You Would Like The Train Schedule To Be Sorted:</label>
		<select name="order by" size=1>
			<option value="arrival_time">Arrival Time</option>
			<option value="departure_time">Departure Time</option>
			<option value="origin">Origin</option>
			<option value="destination">Destination</option>
			<option value="one_way_fare">One Way Fare</option>
			<option value="round_trip_fare">Round Trip Fare</option>
			<option value="monthly_fare">Monthly Fare</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>
<br>
Find A Train Schedule by Departure Date (Day You Are Traveling to Your Destination):

<br>
<br>

	<form method="get" action="Traveldatesearch.jsp">
	<label for="departure date">Please Select Your Departure Date:</label>
		<select name="departure_date" size=1>
			<option value="2020-04-22">2020-04-22</option>
			<option value="2020-04-23">2020-04-23</option>
		</select>
<br>
	<label for="order by">Please Select How You Would Like The Train Schedule To Be Sorted:</label>
		<select name="order by" size=1>
			<option value="arrival_time">Arrival Time</option>
			<option value="departure_time">Departure Time</option>
			<option value="origin">Origin</option>
			<option value="destination">Destination</option>
			<option value="one_way_fare">One Way Fare</option>
			<option value="round_trip_fare">Round Trip Fare</option>
			<option value="monthly_fare">Monthly Fare</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

</body>
</html>
