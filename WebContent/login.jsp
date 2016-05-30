<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="wsdassignment2.*"%>
<%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/wsdassignment2/wsdassignment2.css" type="text/css">
<title>Login</title>

<script>
	function goBack() {
		window.history.back();
	}
</script>

</head>
<body>

<%
//Save the current session user object into 'currentuser'
 Object currentuser = session.getAttribute("user");

//Checks to see if someone has logged in
	if (currentuser != null) {
%>

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
	
<h1>Login</h1>

<p> You are already logged in, please logout <a href="logout.jsp">here</a></p>

<button onClick="history.go(-1);return true;"> Back </button>

<%} else { %>

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

<h1>Login</h1>
<form action="loginAction.jsp" method="POST">
<table>
	<tr>
		<td>Username</td>
		<td><input name="username"></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="login" value="Login"></td>
	</tr>
</table>
</form>

<br>
<button onClick="history.go(-1);return true;"> Back </button>

<%}%>
</body>
</html>
