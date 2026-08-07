<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leave Deleted</title>

<style>
body {
    font-family: Arial;
    text-align: center;
    margin-top: 100px;
}

h2 {
    color: green;
}

a {
    text-decoration: none;
    padding: 10px 20px;
    background-color: blue;
    color: white;
    border-radius: 5px;
}
</style>

</head>

<body>

<%
String msg = (String)request.getAttribute("msg");

if(msg != null)
{
%>

<h2><%=msg%></h2>

<%
}
else
{
%>

<h2>Leave Deleted Successfully</h2>

<%
}
%>


<br><br>

<a href="EmployeeHome.jsp" class="back">Back to Home</a>



</body>
</html>