<%@page import="com.pack2.AdminBean"%>
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
AdminBean abean = (AdminBean) session.getAttribute("adminbean");

if (abean == null) {
    response.sendRedirect("AdminLogin.html");
    return;
}

String msg = (String) request.getAttribute("msg");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Employee Status | Employee Leave Management System</title>


<style>

/* =========================
   RESET
========================= */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}


/* =========================
   BODY
========================= */

body{

    min-height:100vh;

    background:
    linear-gradient(135deg,#0f172a,#1e3a8a,#2563eb);

    display:flex;

    align-items:center;

    justify-content:center;

    padding:25px;

    position:relative;

    overflow:hidden;
}


/* =========================
   BACKGROUND CIRCLES
========================= */

.circle-one{

    position:absolute;

    width:400px;
    height:400px;

    border-radius:50%;

    background:rgba(255,255,255,0.06);

    top:-180px;
    left:-130px;
}


.circle-two{

    position:absolute;

    width:450px;
    height:450px;

    border-radius:50%;

    background:rgba(255,255,255,0.05);

    bottom:-220px;
    right:-150px;
}


/* =========================
   MAIN CONTAINER
========================= */

.container{

    width:500px;

    max-width:100%;

    background:rgba(255,255,255,0.97);

    padding:38px;

    border-radius:22px;

    position:relative;

    z-index:5;

    text-align:center;

    box-shadow:
    0 25px 60px rgba(0,0,0,0.30);
}


/* =========================
   STATUS ICON
========================= */

.status-icon{

    width:75px;
    height:75px;

    margin:0 auto 18px;

    border-radius:50%;

    background:#dbeafe;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:36px;

    box-shadow:
    0 8px 20px rgba(37,99,235,0.15);
}


/* =========================
   HEADING
========================= */

h2{

    color:#111827;

    font-size:27px;

    margin-bottom:8px;
}


.subtitle{

    color:#6b7280;

    font-size:13px;

    margin-bottom:25px;
}


/* =========================
   MESSAGE BOX
========================= */

.message{

    padding:18px;

    border-radius:12px;

    font-size:16px;

    font-weight:bold;

    margin:20px 0 28px;

    line-height:1.5;
}


/* =========================
   SUCCESS
========================= */

.success{

    color:#166534;

    background:#dcfce7;

    border:1px solid #86efac;
}


/* =========================
   ERROR
========================= */

.error{

    color:#991b1b;

    background:#fee2e2;

    border:1px solid #fca5a5;
}


/* =========================
   NO MESSAGE
========================= */

.no-message{

    color:#6b7280;

    background:#f3f4f6;

    border:1px solid #e5e7eb;

    padding:18px;

    border-radius:12px;

    margin:20px 0 28px;

    font-size:14px;
}


/* =========================
   MENU
========================= */

.menu{

    display:flex;

    flex-direction:column;

    gap:12px;
}


/* =========================
   BUTTON
========================= */

.menu a{

    display:block;

    width:100%;

    padding:13px 15px;

    border-radius:9px;

    text-decoration:none;

    color:white;

    font-size:14px;

    font-weight:bold;

    transition:0.3s;
}


/* ADD EMPLOYEE */

.add{

    background:#2563eb;

}


.add:hover{

    background:#1d4ed8;

    transform:translateY(-2px);
}


/* VIEW EMPLOYEE */

.view{

    background:#198754;

}


.view:hover{

    background:#157347;

    transform:translateY(-2px);
}


/* LOGOUT */

.logout{

    background:#dc3545;

}


.logout:hover{

    background:#bb2d3b;

    transform:translateY(-2px);
}


/* =========================
   ADMIN INFO
========================= */

.admin-info{

    margin-top:25px;

    padding-top:18px;

    border-top:1px solid #e5e7eb;

    color:#6b7280;

    font-size:11px;

}


/* =========================
   RESPONSIVE
========================= */

@media(max-width:550px){

    body{

        padding:18px;

        overflow:auto;

    }


    .container{

        padding:30px 22px;

    }


    h2{

        font-size:24px;

    }

}

</style>

</head>


<body>


<!-- BACKGROUND -->

<div class="circle-one"></div>

<div class="circle-two"></div>



<!-- =========================
     MAIN CONTAINER
========================= -->

<div class="container">


    <!-- STATUS ICON -->

    <div class="status-icon">
        👥
    </div>


    <!-- TITLE -->

    <h2>
        Employee Status
    </h2>


    <p class="subtitle">
        Employee Leave Management System
    </p>



    <!-- =========================
         MESSAGE
    ========================== -->

    <%
    if(msg != null)
    {
        if(msg.contains("Successfully"))
        {
    %>

        <p class="message success">
            ✅ <%=msg%>
        </p>

    <%
        }
        else
        {
    %>

        <p class="message error">
            ❌ <%=msg%>
        </p>

    <%
        }
    }
    else
    {
    %>

        <p class="no-message">
            ℹ️ No employee status message available.
        </p>

    <%
    }
    %>



    <!-- =========================
         MENU
    ========================== -->

    <div class="menu">


        <a href="AddEmployee.html" class="add">
            ➕ Add Employee
        </a>


        <a href="ViewEmployee" class="view">
            👥 View Employees
        </a>


        <a href="Logout.jsp" class="logout">
            🚪 Logout
        </a>


    </div>



    <!-- ADMIN INFO -->

    <div class="admin-info">

        🔐 Administrator Panel
        <br>
        © 2026 Employee Leave Management System

    </div>


</div>


</body>

</html>