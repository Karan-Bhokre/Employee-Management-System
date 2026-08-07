<%@page import="com.pack2.LeaveBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
LeaveBean lb = (LeaveBean)request.getAttribute("lbean");

if(lb==null)
{
%>
<h2 align="center">Leave Record Not Found...</h2>
<%
return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Leave</title>

<style>
body{
	font-family:Arial;
	background:#f2f2f2;
}

.container{
	width:500px;
	margin:40px auto;
	background:white;
	padding:20px;
	border-radius:8px;
	box-shadow:0px 0px 10px gray;
}

table{
	width:100%;
}

td{
	padding:8px;
}

input,select,textarea{
	width:100%;
	padding:8px;
	box-sizing:border-box;
}

input[type=submit]{
	background:green;
	color:white;
	border:none;
	cursor:pointer;
}

input[type=submit]:hover{
	background:darkgreen;
}
</style>

</head>
<body>

<div class="container">

<h2 align="center">Edit Leave</h2>

<form action="UpdateLeave" method="post">

<table>

<tr>
<td>Leave ID</td>
<td>
<input type="text" name="lcode"
value="<%=lb.getaLEAVE_ID()%>" readonly>
</td>
</tr>

<tr>
<td>Employee ID</td>
<td>
<input type="text" name="empid"
value="<%=lb.getaEMP_ID()%>" readonly>
</td>
</tr>

<tr>
<td>Leave Type</td>
<td>
<select name="ltype">

<option value="Casual"
<%=lb.getaLEAVE_TYPE().equals("Casual")?"selected":""%>>
Casual
</option>

<option value="Sick"
<%=lb.getaLEAVE_TYPE().equals("Sick")?"selected":""%>>
Sick
</option>

<option value="Earned"
<%=lb.getaLEAVE_TYPE().equals("Earned")?"selected":""%>>
Earned
</option>

</select>
</td>
</tr>

<tr>
<td>From Date</td>
<td>
<input type="date" name="fdate"
value="<%=lb.getaFROM_DATE()%>">
</td>
</tr>

<tr>
<td>To Date</td>
<td>
<input type="date" name="tdate"
value="<%=lb.getaTO_DATE()%>">
</td>
</tr>

<tr>
<td>Reason</td>
<td>
<textarea name="reason"><%=lb.getaREASON()%></textarea>
</td>
</tr>

<tr>
<td>Status</td>
<td>
<input type="text" name="status" value="Pending" readonly>
</td>
</tr>

<tr>
<td colspan="2" align="center">
<input type="submit" value="Update Leave">
</td>
</tr>

</table>

</form>

</div>

</body>
</html>