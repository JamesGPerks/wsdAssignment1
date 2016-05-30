<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="wsdassignment2.*"%>
<%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/wsdassignment2/wsdassignment2.css" type="text/css">
<title>Main Page</title>
</head>
<body>
<%

//Save current user into currentuser object

 Object currentuser = session.getAttribute("user");

//If present will not return null
	if (currentuser != null) {

//Gets current user username
        User thisuser = (User)session.getAttribute("user");
        String user = thisuser.getuserName();
%> 

<!-- Displays a logged in functionality page -->

<!-- Navigation bar -->
	<ul>
	 	<li> <a href="createpoll.jsp">Create a Poll</a></li>
	 	<li> <a href="pollsummary.jsp">View Polls</a></li>
	 	<li> <a href="mypolls.jsp"> Your Polls </a> </li>
	 	<li> <a href="logout.jsp"> Logout </a> </li>
	 	<li id='back'> 
	 	
	 	<script>
	 		document.write('<a href="' + document.referrer + '"> Back</a>');
	 	</script>
	 	
	 	
	 	</li>
	</ul> 
	
	
<h1> Main Page </h1>

<p> Welcome <%=user%>, what would you like to do? </p>
<% } else {%>

<!-- Displays a guest functionality page -->



<ul> 
	<li> <a href="pollsummary.jsp">View Polls</a></li>
	<li> <a href="login.jsp">Login</a></li>
	<li id='back'> 
	 	
	 	<script>
	 		document.write('<a href="' + document.referrer + '"> Back</a>');
	 	</script>
	 	
	 	
	</li>
</ul>

<h1> Main Page </h1>
<p> Welcome guest, what would you like to do?</p>
<% } %>
</body>
</html>
