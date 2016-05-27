<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/wsdassignment2/wsdassignment2.css" type="text/css">
<title>Current Open Polls</title>
</head>
<body>
<%
//Save the current session user object into 'currentuser'
 Object currentuser = session.getAttribute("user");

//Sets the filepath of polls.xml used in pollApp bean
String filePath1 = application.getRealPath("WEB-INF/polls.xml");

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

<% } %>    

        <jsp:useBean id="pollApp" class="wsdassignment2.PollApplication" scope="application">
            <jsp:setProperty name="pollApp" property="filePath" value="<%=filePath1%>"/>
        </jsp:useBean>
        
<h1> Current Open Polls </h1>

<table border='1'>

 <tr> <td> <b> Poll Title </b> </td> <td> <b>Poll Description </b></td> <td> <b>Creator </b> </td> </tr> 
<% 

for (int i = 0; i < pollApp.getPolls().getList().size(); i++) {
    if (pollApp.getPolls().getList().get(i).getStatus().equals("OPEN")) {
        out.println("<tr> <td> <a href='details.jsp'>" + pollApp.getPolls().getList().get(i).getTitle() +
        		"</a></td> <td>"+ pollApp.getPolls().getList().get(i).getDescription()+ "</td> <td>" + pollApp.getPolls().getList().get(i).getUser()+ " </td> </tr>");
    }
}
%>

</table>
<br>
<button onClick="history.go(-1);return true;"> Back </button>
</body>
</html>