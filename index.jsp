<% //Everyone %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<br>
	LOGIN (Please Register Before Logging In)
	<form action="checkLoginDetails.jsp" method="POST">
       Username: <input type="text" name="username"/> <br/>
       Password: <input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
     Register Here!
     <br>
     <form action="register.jsp" method="POST">
       Create Username: <input type="text" name="username"/> <br/>
       Create Password: <input type="password" name="password"/> <br/>
       First Name: <input type="text" name="firstname"/> <br/>
       Last Name: <input type="text" name="lastname"/> <br/>
       Phone Number: <input type="text" name="phonenumber"/> <br/>
       Email: <input type="text" name="email"/> <br/>
       Address: <input type="text" name="address"/> <br/>
       State: <input type="text" name="state"/> <br/>
       City: <input type="text" name="city"/> <br/>
       Zipcode: <input type="text" name="zipcode"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
     Admin access.
     <br>
     <form action="checkAdminLoginDetails.jsp" method="POST">
       Admin Username: <input type="text" name="username"/> <br/>
       Admin Password: <input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
	 CUSTOMER REP LOGIN (Please Register Before Logging In)
	<form action="EmployeeLoginDetails.jsp" method="POST">
       Username: <input type="text" name="usernameER"/> <br/>
       Password: <input type="password" name="passwordER"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
     CUSTOMER REP Register Here!
     <br>
     <form action="EmployeeRegister.jsp" method="POST">
       Create Username: <input type="text" name="usernameER"/> <br/>
       Create Password: <input type="password" name="passwordER"/> <br/>
       First Name: <input type="text" name="firstnameER"/> <br/>
       Last Name: <input type="text" name="lastnameER"/> <br/>
       SSN: <input type="text" name="SSN"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
</body>
</html>

