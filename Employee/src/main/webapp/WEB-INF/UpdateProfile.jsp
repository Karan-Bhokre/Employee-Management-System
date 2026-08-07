<%@page import="com.pack2.EmployeeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%
EmployeeBean eb = (EmployeeBean)session.getAttribute("employee");

if(eb == null){
    response.sendRedirect("EmployeeLogin.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Profile</title>

<style>
body{
    font-family:Arial;
    background:#f4f6f9;
}

.container{
    width:450px;
    margin:40px auto;
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 0 10px gray;
}

input{
    width:100%;
    padding:8px;
    margin:8px 0;
}

input[type=submit]{
    background:#007bff;
    color:white;
    border:none;
    cursor:pointer;
}
</style>

</head>
<body>

<div class="container">

<h2>Update Profile</h2>

<form action="UpdateProfile" method="post">

Employee ID
<input type="text" name="eid"
value="<%=eb.getaEMP_ID()%>" readonly>

Name
<input type="text" name="name"
value="<%=eb.getaNAME()%>">

Email
<input type="email" name="email"
value="<%=eb.getaEMAIL()%>">

Mobile
<input type="text" name="mobile"
value="<%=eb.getaMOBILE()%>">

Department
<input type="text" name="department"
value="<%=eb.getaDEPARTMENT()%>">

Designation
<input type="text" name="designation"
value="<%=eb.getaDESIGNATION()%>">

<input type="submit" value="Update Profile">

</form>

</div>

</body>
</html>