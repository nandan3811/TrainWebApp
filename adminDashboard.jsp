<% //Denajah Tarver %>

<%@ page import="java.sql.*" %>
<html>
<head>
<title>Admin Dashboard</title>
</head>
<body>
<%
    if ((session.getAttribute("admin") == null)) {
%>
<br>You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%
    } else {
%>
    Welcome <%=session.getAttribute("admin")%>  
<a href="logout.jsp">Log out</a>
  <br>
  <br>
<%
    }
%>

<form method="post" name="formCustomer">
<table border="1">
<tr><th>First Name</th><th>Last Name</th><th>Tel Number</th><th>Email</th><th>Street Add</th><th>Zip</th><th>State</th><th>City</th></tr>
<%
Connection con = null;
String driver = "com.mysql.jdbc.Driver";
String url= "jdbc:mysql://mydb.czh06bdxwjjn.us-east-2.rds.amazonaws.com:3306/OnlineRailwayBookingSystem";
String userName="nandan3811"; 
String password="Swaminarayan1!";

Statement st;
try{
Class.forName(driver);
con = DriverManager.getConnection(url,userName,password);
String query = "select * from Customers";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<%
while(rs.next()){
String username = rs.getString("username");
%>
<tr><td><%=rs.getString("firstname")%></td>
<td><%=rs.getString("lastname")%></td>
<td><%=rs.getString("telnumber")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("streetadd")%></td>
<td><%=rs.getString("zip")%></td>
<td><%=rs.getString("state")%></td>
<td><%=rs.getString("city")%></td>
<td><button id="button" type="button" onclick="editCustomer('<%=username%>');">Edit</button></td>
</tr>
<%
}
%>
<%
}
catch(Exception e){
e.printStackTrace();
}
%>
</table>
</form>

<form method="post" name="formEmployee">
<table border="1">
<tr><th>First Name</th><th>Last Name</th><th>Edit</th></tr>
<%

try{
Class.forName(driver);
con = DriverManager.getConnection(url,userName,password);
String query = "select * from Employee_Rep";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<%
while(rs.next()){
String usernameER = rs.getString("usernameER");
%>

<tr><td><%=rs.getString("firstnameER")%></td>
<td><%=rs.getString("lastnameER")%></td>
<td><button id="button" type="button" onclick="editEmployee('<%=usernameER%>');">Edit</button></td>
</tr>

<%
}
%>
<%
}
catch(Exception e){
e.printStackTrace();
}
%>
</table>
</form>

<h4>Sales Reports </h4>
<form action="checkMonthYear.jsp" method="POST">
       Month: <input type="text" name="month" value = "04"/> <br/>
       Year: <input type="text" name="year" value = "2020"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
 
     
     <%
    try{
    	Class.forName(driver);
    	con = DriverManager.getConnection(url,userName,password);
    	String query = "select * from Reservation_Schedule";
    	st = con.createStatement();
    	ResultSet rs = st.executeQuery(query);
	%>

     <label for="order by">List Reservations By:</label>
        <select onchange="listReservation(this);">
        <option value = "1" data-trainID = " " data-transLine = " " selected> </option>
        <option value = "2" data-trainID = "Customer_Name" data-transLine = "Customer_Name">Customer Name</option>
        <%  while(rs.next()){ %>
            <option value = '3' data-trainID = "<%=rs.getString("trainid")%>" data-transLine = "<%=rs.getString("transit_line")%>"><%= rs.getString("transit_line") + " #" + rs.getString ("trainid")%></option>	
        <% } %>
        </select><br>  
<%
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>

	<br>
	<form method="get" action="listRevenue.jsp">
	<label for="revenue by">List Revenue By:</label>
		<select id="revenueBy" name="revenueBy" size=3>
			<option value="transit_line">Transit Line</option>
			<option value="destination">Destination</option>
			<option value="username">Customer Name</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
		</form>
		
	<br>
	
	<button id="button" type="button" onclick="bestCustomer();">Best Customer</button>
	
	<br>
	<br>
	
	<button id="button" type="button" onclick="fiveTrains();">Most Active Trains</button>
     
     
</body>


<script type="text/javascript">
function editCustomer(username){
    window.location.replace("editCustomer.jsp?username="+username);
}

function editEmployee(username) {
	window.location.replace("editEmployee.jsp?usernameER="+username);
}

function listReservation(obj) {
	var item = obj.options[obj.selectedIndex];
    var transline =  item.getAttribute('data-transLine'); 
    var trainNum =  item.getAttribute('data-trainID'); 
    if (transline != " " & trainNum != " " ) 
    window.location.replace("listReservations.jsp?transline="+transline+"&trainid="+trainNum);
}

function bestCustomer(username) {
	window.location.replace("bestCustomer.jsp");
}

function fiveTrains(username) {
	window.location.replace("fiveTrains.jsp");
}

</script>
</html>