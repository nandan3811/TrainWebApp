<% //Aarushi Srivastava %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.mydb.pkg.*"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<script>
document.getElementById("demo").innerHTML = "My First JavaScript";
</script>

<br>
    Add stations for your new line. Makesure to use your newly created TransitLine and TrainID. 
	<form action="stationstuff.jsp" method="POST">
       Unique ID: <input type="text" name="uniqueidadd"/> <br/>
       TransitLine: <input type="text" name="transitlineadd"/> <br/>
       TrainID: <input type="text" name="traninidadd"/> <br/>
       Origin: <input type="text" name="originadd"/> <br/>
       Date Arrival Time: <input type="text" name="datearrivaltimeadd"/> <br/>
       
       Name of Station it Stops at: <input type="text" name="nameofstationadd"/> <br/>
       City of station: <input type ="text" name = "cityadd"/> <br/>
       State of station: <input type = "text" name = "stateadd" /> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>