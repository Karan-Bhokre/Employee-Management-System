<%@page import="com.pack2.EmployeeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
EmployeeBean eb = (EmployeeBean)request.getAttribute("ebean");

if(eb == null)
{
%>
<h2 align="center">Employee Record Not Found...</h2>
<%
return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Employee</title>

<style>

body{
    font-family:Arial, Helvetica, sans-serif;
    background:#f4f6f9;
}

.container{
    width:500px;
    margin:40px auto;
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0 0 10px gray;
}

h2{
    text-align:center;
    color:#0d6efd;
}

table{
    width:100%;
}

td{
    padding:10px;
}

input{
    width:100%;
    padding:8px;
    border:1px solid #ccc;
    border-radius:5px;
    box-sizing:border-box;
}

input[type=submit]{
    background:#28a745;
    color:white;
    border:none;
    font-size:16px;
    cursor:pointer;
}

input[type=submit]:hover{
    background:#218838;
}

.back{
    text-align:center;
    margin-top:20px;
}

.back a{
    text-decoration:none;
    background:#0d6efd;
    color:white;
    padding:10px 20px;
    border-radius:5px;
}

</style>

</head>
<body>

<div class="container">

<h2>Edit Employee</h2>

<form action="UpdateEmployee" method="post">

<table>

<tr>
<td>Employee ID</td>
<td>
<input type="text" name="eid"
value="<%=eb.getaEMP_ID()%>" readonly>
</td>
</tr>

<tr>
<td>Name</td>
<td>
<input type="text" name="name"
value="<%=eb.getaNAME()%>" required>
</td>
</tr>

<tr>
<td>Email</td>
<td>
<input type="email" name="email"
value="<%=eb.getaEMAIL()%>" required>
</td>
</tr>

<tr>
<td>Mobile</td>
<td>
<input type="text" name="mobile"
value="<%=eb.getaMOBILE()%>" required>
</td>
</tr>

<tr>
<td>Department</td>
<td>
<input type="text" name="department"
value="<%=eb.getaDEPARTMENT()%>" required>
</td>
</tr>

<tr>
<td>Designation</td>
<td>
<input type="text" name="designation"
value="<%=eb.getaDESIGNATION()%>" required>
</td>
</tr>

<tr>
<td>Password</td>
<td>
<input type="text" name="password"
value="<%=eb.getaPASSWORD()%>" required>
</td>
</tr>

<tr>
<td colspan="2" align="center">
<input type="submit" value="Update Employee">
</td>
</tr>

</table>

</form>

<div class="back">
<a href="ViewEmployee">Back</a>
</div>

</div>

</body>
</html>