<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Login</title>

<style>

body{
	font-family:Arial;
	background:#f4f6f9;
}

.container{
	width:350px;
	margin:80px auto;
	background:white;
	padding:20px;
	border-radius:8px;
	box-shadow:0px 0px 10px gray;
}

h2{
	text-align:center;
	color:#007bff;
}

input{
	width:100%;
	padding:10px;
	margin:10px 0;
}

button{
	width:100%;
	padding:10px;
	background:#007bff;
	color:white;
	border:none;
	font-size:16px;
	cursor:pointer;
}

button:hover{
	background:#0056b3;
}

.error{
	color:red;
	text-align:center;
}

</style>

</head>
<body>

<div class="container">

<h2>Employee Login</h2>

<%
String msg=(String)request.getAttribute("msg");
if(msg!=null)
{
%>

<p class="error"><%=msg %></p>

<%
}
%>

<form action="EmployeeLogin" method="post">

<input type="email"
name="email"
placeholder="Enter Email"
required>

<input type="password"
name="password"
placeholder="Enter Password"
required>

<button type="submit">Login</button>

</form>

<br>

<center>
<a href="Inpute.html">Back</a>


</div>

</body>
</html>