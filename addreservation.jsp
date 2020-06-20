<% //Aarushi %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mydb.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date,java.text.SimpleDateFormat"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>


<title>Added a New Train Line Schedule </title>
<table border="1">
<tr>
<th>Transit Line</th>
<th>Train ID</th>
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
PreparedStatement ps2 = null; 



try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection(url, accountname, password);
Statement stmt=conn.createStatement();

String transitlineADD = request.getParameter("transitlineadd"); 
//out.println(transitlineADD); 
String trainidADD =  request.getParameter("trainidadd"); 
//out.println(trainidADD);
int numseatsADD = Integer.parseInt(request.getParameter("numseatsadd"));
//out.println(numseatsADD); 
int numcarsADD = Integer.parseInt(request.getParameter("numcarsadd"));
//out.println(numcarsADD); 
String destinationADD = request.getParameter("destinationadd");
//out.println(destinationADD); 
int numberofseatsavailable = Integer.parseInt(request.getParameter("numberofseatsadd"));
//out.println(numberofseatsavailable); 
String originADD = request.getParameter("originadd");
//out.println(originADD); 
String arrivaldateADD = request.getParameter("arrivaldateadd");
//out.println(arrivaldateADD); 
String arrivaltimeADD = request.getParameter("arrivaltimeadd"); 
//out.println(arrivaltimeADD); 
String departuredateADD = request.getParameter("departuredateadd");
//out.println(departuredateADD);
String departuretimeADD = request.getParameter("departuretimeadd");
//out.println(departuretimeADD);
String traveltimeADD = request.getParameter("traveltimeadd");
//out.println(traveltimeADD); 
int numberofstopsadd = Integer.parseInt(request.getParameter("numofstopsadd"));
//out.println(numberofstopsadd);
double childseniordiscountADD= Double.valueOf(request.getParameter("childseniordiscountadd"));
//out.println(childseniordiscountADD);
double disableddiscountADD = Double.valueOf(request.getParameter("disableddiscountadd"));
//out.println(disableddiscountADD); 
double roundtripfareADD = Double.valueOf(request.getParameter("roundtripfareadd"));
//out.println(roundtripfareADD); 
double monthlyfareADD = Double.valueOf(request.getParameter("monthlyfareadd"));
//out.println(monthlyfareADD); 
double onewayfareADD = Double.valueOf(request.getParameter("onewayfareadd")); 
//out.println(onewayfareADD); 


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


String insertwo = "INSERT INTO Train(trainid,numseats,numcars)"
                   + "VALUES(?, ?, ?)";
 ps2 = conn.prepareStatement(insertwo);
ps2.setString(1,trainidADD);
ps2.setInt(2,numseatsADD);
ps2.setInt(3,numcarsADD);
ps2.executeUpdate(); 
//out.println("Insert to train table works"); 

String insertone = "INSERT INTO Reservation_Schedule(transit_line,trainid, destination,num_seats_available, origin,arrival_date, arrival_time,departure_date,departure_time,travel_time,number_of_stops, child_senior_discount,disabled_discount,round_trip_fare,monthly_fare,one_way_fare)"
		+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//Create a Prepared SQL statement allowing you to introduce the parameters of the query

//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
ps = conn.prepareStatement(insertone); 
ps.setString(1, transitlineADD);
ps.setString(2,trainidADD);
ps.setString(3,destinationADD);
ps.setInt(4,numberofseatsavailable);
ps.setString(5, originADD); 
//out.println("I am here.");
ps.setDate(6,  new java.sql.Date(arrivaldate.getTime())); 
//out.println("printing stuff");
ps.setTime(7,new Time(date2.getTime()));
//out.println("My borther!!"); 
ps.setDate(8, new java.sql.Date(departuredate.getTime()));
ps.setTime(9, new Time(departuretime.getTime())); 
ps.setTime(10, new Time(traveltime.getTime())); 
ps.setInt(11,  numberofstopsadd);
ps.setDouble(12,childseniordiscountADD);
ps.setDouble(13,disableddiscountADD); 
ps.setDouble(14,roundtripfareADD);
ps.setDouble(15,monthlyfareADD);
ps.setDouble(16,onewayfareADD); 

ps.executeUpdate(); 
//out.println("Insert to reservation successful"); 
conn.close();
out.print("insert succeeded");

} catch (Exception ex) {
out.print(ex);
out.print("insert failed");
}
%>
<p> If your insert is successful, then you may add stations. </p>
<a href = "stationadd.jsp"><button >Click her to add stations! </button></a>
</body>
</html>

