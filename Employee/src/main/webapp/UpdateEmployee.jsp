<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Updated</title>

<style>
body{
    font-family: Arial, Helvetica, sans-serif;
    background:#f4f6f9;
}

.container{
    width:450px;
    margin:100px auto;
    background:#fff;
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
    background:#0d6efd;
    color:white;
    padding:10px 20px;
    border-radius:5px;
    display:inline-block;
    margin-top:20px;
}
</style>

</head>
<body>

<div class="container">

<h2>
<%=request.getAttribute("msg")%>
</h2>

<a href="ViewEmployee">
Back To Employee List
</a>

</div>

</body>
</html>