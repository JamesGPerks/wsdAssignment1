<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="wsdassignment2.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoginAction</title>
</head>
<body>


<% String filePath = application.getRealPath("WEB-INF/users.xml"); %>

<jsp:useBean id="userApp" class="wsdassignment2.userApplication"
	scope="application">
	<jsp:setProperty name="userApp" property="filePath"
		value="<%=filePath%>" />
</jsp:useBean>

<%	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	Users users = userApp.getUsers();
	
	User user = users.login(username, password);
	
	if (user != null){
	session.setAttribute("user", user);
%>

<% 
response.sendRedirect("mainpage.jsp");
%>

<% } else { %>

<p>Password incorrect. Click <a href="login.jsp">here</a> to try
again.</p>

<% } %>
</body>
</html>