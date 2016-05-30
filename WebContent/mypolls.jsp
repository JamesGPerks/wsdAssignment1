<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="wsdassignment2.*"%>
<%@page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/wsdassignment2/wsdassignment2.css" type="text/css">
<title>My Polls</title>
</head>
<body>

<% String filePath = application.getRealPath("WEB-INF/users.xml");%>
<% String filePath1 = application.getRealPath("WEB-INF/polls.xml");%>

        <jsp:useBean id="userApp" class="wsdassignment2.userApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <jsp:useBean id="pollApp" class="wsdassignment2.PollApplication" scope="application">
            <jsp:setProperty name="pollApp" property="filePath" value="<%=filePath1%>"/>
        </jsp:useBean>

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

<h1> My Polls</h1>

<table border='1'>

 <tr> <td> <b> Poll Title </b> </td> <td> <b>Poll Description </b></td> <td> <b>Status </b> </td> </tr> 
<% 

User currentuser = (User)session.getAttribute("user");
String username = currentuser.getuserName();

for (int i = 0; i < pollApp.getPolls().getList().size(); i++) {
            if (pollApp.getPolls().getList().get(i).getUser().equals(username)) {
                out.println("<tr> <td>" + pollApp.getPolls().getList().get(i).getTitle() +
                		"</td> <td>"+ pollApp.getPolls().getList().get(i).getDescription()+ "</td> <td>"+ pollApp.getPolls().getList().get(i).getStatus()+ "</td> </tr>");
            }
}
%>

</table>

<br>
<button onClick="history.go(-1);return true;"> Back </button>
</body>
</html>
