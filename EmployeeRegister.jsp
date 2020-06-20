<% //Nandan %>

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
	try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();

		String newUsername = request.getParameter("usernameER");
		String newPassword = request.getParameter("passwordER");
		String newFirstname = request.getParameter("firstnameER");
		String newLastname = request.getParameter("lastnameER");
		String newSSN = request.getParameter("SSN");


		String insert = "INSERT INTO Employee_Rep(usernameER, passwordER, firstnameER, lastnameER, SSN)"
				+ "VALUES (?, ?, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(insert);

		
		ps.setString(1, newUsername);
		ps.setString(2, newPassword);
		ps.setString(3, newFirstname);
		ps.setString(4, newLastname);
		ps.setString(5, newSSN);
		
		ps.executeUpdate();

		con.close();

		out.print("Insert succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
%>
</body>
</html>