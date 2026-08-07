<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leave Rejecte</title>

<style>
body{
    font-family: Arial, Helvetica, sans-serif;
    background:#f4f6f9;
}

.container{
    width:450px;
    margin:80px auto;
    background:white;
    padding:30px;
    text-align:center;
    border-radius:10px;
    box-shadow:0 0 10px gray;
}

h2{
    color:green;
}

a{
    text-decoration:none;
    color:white;
    background:#0d6efd;
    padding:10px 20px;
    border-radius:5px;
    margin:5px;
    display:inline-block;
}

.home{
    background:#198754;
}
</style>

</head>
<body>

<div class="container">

<%
String msg = (String)request.getAttribute("msg");

if(msg != null)
{
%>

<h2><%=msg %></h2>

<%
}
else
{
%>

<h2>Leave Reject Successfully...</h2>

<%
}
%>

<br><br>

<a href="ViewLeaveStatus">View Leave Status</a>

<a href="EmployeeHome.jsp" class="back">Back to Home</a>

</div>

</body>
</html>