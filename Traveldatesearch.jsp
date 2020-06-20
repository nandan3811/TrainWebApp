<% //Anne %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Train Schedule Determined By Station of Departure Date</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			Connection con = null;
			String driver = "com.mysql.jdbc.Driver";
			String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
			String userName="nandan3811"; 
			String password="Swaminarayan1!";
			//Get the database connection
			Class.forName(driver);
			con = DriverManager.getConnection(url,userName,password);		
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String entity = request.getParameter("departure_date");
			String entity2=request.getParameter("order by");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			//Run the query against the database.

			ResultSet result = stmt.executeQuery("Select ss.transit_line, ss.trainid, ss.origin, rs.departure_date, rs.departure_time, s.name, ss.date_arrival_time, rs.destination, rs.arrival_date, rs.arrival_time From Station_stops ss, Reservation_Schedule rs, Station s where ss.unique_id=s.unique_id and ss.transit_line=rs.transit_line and ss.trainid=rs.trainid and ss.origin=rs.origin and ss.trainid in(Select rs.trainid From Reservation_Schedule rs Where rs.departure_date='"+entity+"') order by rs."+entity2+", rs.trainid, ss.date_arrival_time");

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Transit Line");
			out.print("</td>");
			out.print("<td>");
			out.print("Train ID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Station of Origin");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Departure Date");
			out.print("</td>");
			out.print("<td>");
			out.print("Departure Time");
			out.print("</td>");
			out.print("<td>");
			out.print("Station Stops At");
			out.print("</td>");
			out.print("<td>");
			out.print("Date and Time of Arrival At Station");
			out.print("</td>");
			out.print("<td>");
			out.print("Destination");
			out.print("</td>");
			out.print("<td>");
			out.print("Date of Arrival at Destination");
			out.print("</td>");
			out.print("<td>");
			out.print("Time of Arrival at Destination");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out transit line name:
				out.print(result.getString("transit_line"));
				out.print("</td>");
				out.print("<td>");
				//Print out current trainid:
				out.print(result.getString("trainid"));
				out.print("</td>");
				out.print("<td>");
				//Print out station of origin
				out.print(result.getString("origin"));
				out.print("</td>");
				out.print("<td>");
				//print departure date
				out.print(result.getString("departure_date"));
				out.print("</td>");
				out.print("<td>");
				//print departure time
				out.print(result.getString("departure_time"));
				out.print("</td>");
				out.print("<td>");
				//print out Station train stops at
				out.print(result.getString("name"));
				out.print("</td>");
				out.print("<td>");
				//print out date and time of arrival at station
				out.print(result.getString("date_arrival_time"));
				out.print("</td>");
				out.print("<td>");
				//print out destination
				out.print(result.getString("destination"));
				out.print("</td>");
				out.print("<td>");
				//print out date of arrival at destination
				out.print(result.getString("arrival_date"));
				out.print("</td>");
				out.print("<td>");
				//print out time of arrival at destination
				out.print(result.getString("arrival_time"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>
