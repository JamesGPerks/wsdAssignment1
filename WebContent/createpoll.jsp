<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="wsdassignment2.*"%>
<%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/wsdassignment2/wsdassignment2.css" type="text/css">
<title> Create Poll </title>
</head>
<body>

<%
 String filePath = application.getRealPath("WEB-INF/users.xml");
%>
<jsp:useBean id="userApp" class="wsdassignment2.userApplication" scope="application">
<jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<%

//Save the current session user object into 'currentuser'
 Object currentuser = session.getAttribute("user");

//Checks to see if someone has logged in
	if (currentuser != null) {
%>

<!-- Someone has logged in -->

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

<h1> Create Poll </h1>

	<form action="pollAction.jsp" method="post">
		<table>
			<tr> <td> Title: </td> <td> <input type="text" name="title"> </td></tr>
			<tr> <td> Location: </td> <td> <input type="text" name="location"> </td> </tr>
			<tr> <td> Description: </td> <td> <input type="text" name="description"> </td></tr>
			<tr> <td> Content: </td> <td> <input type="text" name="content"> </td></tr>
			<tr> <td> </td><td> <input type="submit" id="createpoll" value="Create Poll"> </td></tr>
		</table>
		
	</form>

	<button onClick="history.go(-1);return true;"> Back </button>
<%} else { %>

<!--  No logged in user found, return to either login page or mainpage -->

<!-- Navigation Bar -->
<ul> 
	<li> <a href="pollsummary.jsp">View Polls</a></li>
	<li> <a href="login.jsp">Login</a></li>
	<li id='back'> 
	 	
	 	<script>
	 		document.write('<a href="' + document.referrer + '"> Back</a>');
	 	</script>
	 	
	 	
	</li>
</ul>

<p> You are not logged in. Please click <a href="login.jsp">here</a> to login before proceeding. Or <a href="mainpage.jsp">here</a> to return to the mainpage. </p>
	
<% }%>
</body>
</html>
