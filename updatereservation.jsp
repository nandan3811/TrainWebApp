<% //Aarushi %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date,java.text.SimpleDateFormat"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<title>Update Information to Reservation </title>
<table border="1">
<tr>
<th>Transit Line</th>
<th>Number of Seats Available</th>
<th>Origin</th>
<th>Destination</th>
<th>Arrival Date</th>
<th>Arrival Time</th>
<th>Departure Date</th>
<th>Departure Time</th>
<th>Travel Time</th>
<th>NumberofStops</th>
<th>Child Senior Discount</th>
<th>Disabled Discount</th>
<th>Round Trip Fare</th>
<th>Monthly Fare</th>
<th>One way fare</th>

</tr>
<%
String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
String accountname="nandan3811"; 
String password="Swaminarayan1!";
PreparedStatement ps = null;
ResultSet rs = null;
ResultSet es = null;
		
 
try {
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection(url, accountname, password);
	Statement st=conn.createStatement();
	
	String transitlineADD = request.getParameter("transitlineadd"); 
	String trainidADD =  request.getParameter("trainidadd");
	String destinationADD = request.getParameter("destinationadd");
	int numberofseatsavailable = Integer.parseInt(request.getParameter("numberofseatsadd"));
	String originADD = request.getParameter("originadd");
	String arrivaldateADD = request.getParameter("arrivaldateadd"); 
	String arrivaltimeADD = request.getParameter("arrivaltimeadd"); 
	String departuredateADD = request.getParameter("departuredateadd");
	String departuretimeADD = request.getParameter("departuretimeadd");
	String traveltimeADD = request.getParameter("traveltimeadd");
	int numberofstopsadd = Integer.parseInt(request.getParameter("numofstopsadd"));
	double childseniordiscountADD= Double.valueOf(request.getParameter("childseniordiscountadd"));
	double disableddiscountADD = Double.valueOf(request.getParameter("disableddiscountadd"));
	double roundtripfareADD = Double.valueOf(request.getParameter("roundtripfareadd")); 
	double monthlyfareADD = Double.valueOf(request.getParameter("monthlyfareadd"));
	double onewayfareADD = Double.valueOf(request.getParameter("onewayfareadd")); 
	Date date2 = null;
	date2 = new SimpleDateFormat("HH:mm:ss").parse(arrivaltimeADD);
	Date departuretime = null;
	departuretime = new SimpleDateFormat("HH:mm:ss").parse(departuretimeADD);
	Date arrivaldate = null;
	arrivaldate = new SimpleDateFormat("yyyy-MM-dd").parse(arrivaldateADD);
	Date departuredate = null; 
	departuredate = new SimpleDateFormat("yyyy-MM-dd").parse(departuredateADD); 
	Date traveltime = null; 
	traveltime = new SimpleDateFormat("HH:mm:ss").parse(traveltimeADD); 
	
	if(transitlineADD != null  && trainidADD != null && arrivaltimeADD != null ) {
		
		String find = "(SELECT * FROM (Reservation_Schedule a, Reservation_For_Schedule b, Customer_Reserved_On c) WHERE c.res_number =  b.res_number AND (b.trainid, b.transit_line, b.origin) = (a.trainid, a.transit_line, a.origin) AND (a.trainid, a.transit_line, a.origin) = (?,?,?) AND ? > a.departure_time) UNION (SELECT * FROM (Reservation_Schedule a, Reservation_For_Schedule b, Customer_Reserved_On c) WHERE c.res_number =  b.res_number AND (b.trainid, b.transit_line, b.origin) = (a.trainid, a.transit_line, a.origin) AND (a.trainid, a.transit_line, a.origin) = (?,?,?) AND ? > a.arrival_time)";
		
		
		ps = conn.prepareStatement(find);
		ps.setString(1, trainidADD);
		ps.setString(2, transitlineADD);
		ps.setString(3, originADD);
		ps.setTime(4, new Time(departuretime.getTime()));
		ps.setString(5, trainidADD);
		ps.setString(6, transitlineADD);
		ps.setString(7, originADD);
		ps.setTime(8, new Time(date2.getTime()));
		rs = ps.executeQuery();
		
		if(rs.next()){
			do{
				
			String similar = "SELECT * FROM Updates a WHERE a.username = ? AND a.res_number = ?";
			ps = conn.prepareStatement(similar);
			
			String username1 = rs.getString("username");
			String resnum1 = rs.getString("res_number");
				
			ps.setString(1, username1);
			ps.setString(2, resnum1);
			
			es = ps.executeQuery();
			
				if(es.next()== false){
				
					String insert = "INSERT INTO Updates (username, res_number)" + "VALUES (?, ?)";
					ps = conn.prepareStatement(insert);
				
					String username = rs.getString("username");
					String resnum = rs.getString("res_number");
				
					ps.setString(1, username);
					ps.setString(2, resnum);
			
					ps.executeUpdate();
				}
			
			} while (rs.next());
		}
	String insertthree = "UPDATE Reservation_Schedule SET destination = ?, num_seats_available = ?, origin = ?, arrival_date = ?, arrival_time = ?, departure_date = ?, departure_time = ?, travel_time = ? ,number_of_stops= ?, child_senior_discount = ?, disabled_discount=?, round_trip_fare=?, monthly_fare=?, one_way_fare=? WHERE trainid =? AND transit_line = ?";
			//String insert = "UPDATE Reservation_Schedule SET arrival_time=? WHERE trainid=?";
	ps = conn.prepareStatement(insertthree);
	ps.setString(1,destinationADD);
	ps.setInt(2,numberofseatsavailable);
	ps.setString(3, originADD); 
	ps.setDate(4,  new java.sql.Date(arrivaldate.getTime())); 
	ps.setTime(5,new Time(date2.getTime()));
	//out.println("My borther!!"); 
	ps.setDate(6, new java.sql.Date(departuredate.getTime()));
	ps.setTime(7, new Time(departuretime.getTime())); 
	ps.setTime(8, new Time(traveltime.getTime())); 
	ps.setInt(9,  numberofstopsadd);
	ps.setDouble(10,childseniordiscountADD);
	ps.setDouble(11,disableddiscountADD); 
	ps.setDouble(12,roundtripfareADD);
	ps.setDouble(13,monthlyfareADD);
	ps.setDouble(14,onewayfareADD); 
	 ps.setString(15,trainidADD);
		ps.setString(16, transitlineADD);
	//out.println("lave");
	int result = 0;
	result = ps.executeUpdate();
	//out.print("i am tired"); 
	if(result<1) {
		out.println("error"); 
	}
	else
	{
		out.print("update succeeded");	
	}
	conn.close();
	} }catch (Exception ex) {
	out.print(ex);
	out.print("error in connection");
	}
	%>
	</body>
	</html>







