<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"   
%>

<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="wsdassignment2.*"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poll Action</title> 
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

        <%
        
        //Get current date 
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy");
        String todayWithoutTime = sdf.format(new Date());
        
        //Set variables from submitted form + current date
            String title = request.getParameter("title");
            User currentuser = (User)session.getAttribute("user");
            String user = currentuser.getuserName();
            String date = todayWithoutTime;
            String location = request.getParameter("location");
            String description = request.getParameter("description");
            String responses = "None";
            String times = request.getParameter("time[0]");
            String status = "OPEN";


         //Create a new poll of class Poll using the above variables
            Poll poll = new Poll(title, user, date, location, description, times, status, responses);
         
         //Add the new poll created above to the poll list
            pollApp.getPolls().addPoll(poll);
         
         //Save this new poll to the poll.xml file
            pollApp.savePolls();
         
         //Redirect back to the your polls page
            response.sendRedirect("mypolls.jsp");
        %>
    </body>
</html>