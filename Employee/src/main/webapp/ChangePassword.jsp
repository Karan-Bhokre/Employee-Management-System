<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String msg = (String)request.getAttribute("msg");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Change Password</title>

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

    display:flex;

    justify-content:center;

    align-items:center;

    background:
    linear-gradient(135deg,#0f172a,#1e3a8a,#2563eb);

    position:relative;

    overflow:hidden;

}


/* =========================
   BACKGROUND CIRCLES
========================= */

body::before{

    content:"";

    position:absolute;

    width:350px;
    height:350px;

    border-radius:50%;

    background:rgba(255,255,255,0.08);

    top:-150px;
    left:-120px;

}


body::after{

    content:"";

    position:absolute;

    width:400px;
    height:400px;

    border-radius:50%;

    background:rgba(255,255,255,0.06);

    bottom:-200px;
    right:-130px;

}


/* =========================
   MAIN CARD
========================= */

.container{

    width:390px;

    max-width:92%;

    background:white;

    padding:28px 30px;

    border-radius:18px;

    position:relative;

    z-index:2;

    box-shadow:
    0 20px 50px rgba(0,0,0,0.30);

}


/* =========================
   ICON
========================= */

.icon{

    width:60px;
    height:60px;

    margin:0 auto 12px;

    border-radius:50%;

    background:#dbeafe;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:28px;

}


/* =========================
   HEADING
========================= */

h2{

    text-align:center;

    color:#1e3a8a;

    font-size:24px;

    margin-bottom:5px;

}


.subtitle{

    text-align:center;

    color:#6b7280;

    font-size:13px;

    margin-bottom:20px;

}


/* =========================
   MESSAGE
========================= */

.msg{

    text-align:center;

    padding:10px;

    margin-bottom:15px;

    border-radius:7px;

    background:#fee2e2;

    color:#dc2626;

    font-size:13px;

    font-weight:bold;

}


/* =========================
   FORM
========================= */

label{

    display:block;

    margin-bottom:6px;

    color:#374151;

    font-size:13px;

    font-weight:bold;

}


input{

    width:100%;

    padding:11px 12px;

    margin-bottom:15px;

    border:1px solid #d1d5db;

    border-radius:7px;

    outline:none;

    font-size:14px;

    transition:0.3s;

}


input:focus{

    border-color:#2563eb;

    box-shadow:
    0 0 0 3px rgba(37,99,235,0.12);

}


/* =========================
   BUTTON
========================= */

button{

    width:100%;

    padding:11px;

    background:#2563eb;

    color:white;

    border:none;

    border-radius:7px;

    font-size:15px;

    font-weight:bold;

    cursor:pointer;

    transition:0.3s;

}


button:hover{

    background:#1d4ed8;

    transform:translateY(-1px);

    box-shadow:
    0 6px 15px rgba(37,99,235,0.25);

}


/* =========================
   BACK BUTTON
========================= */

.back{

    display:block;

    text-align:center;

    margin-top:16px;

    color:#2563eb;

    text-decoration:none;

    font-size:13px;

    font-weight:bold;

}


.back:hover{

    text-decoration:underline;

}


/* =========================
   FOOTER
========================= */

.footer{

    text-align:center;

    margin-top:18px;

    padding-top:14px;

    border-top:1px solid #e5e7eb;

    color:#9ca3af;

    font-size:10px;

}


/* =========================
   RESPONSIVE
========================= */

@media(max-width:500px){

    .container{

        width:350px;

        padding:25px 22px;

    }

    h2{

        font-size:22px;

    }

}

</style>

</head>


<body>


<!-- =========================
     MAIN CARD
========================= -->

<div class="container">


    <!-- ICON -->

    <div class="icon">
        🔐
    </div>


    <!-- TITLE -->

    <h2>
        Change Password
    </h2>


    <p class="subtitle">
        Keep your account secure
    </p>


    <!-- MESSAGE -->

    <%
    if(msg != null){
    %>

        <p class="msg">
            <%=msg%>
        </p>

    <%
    }
    %>


    <!-- FORM -->

    <form action="ChangePassword" method="post">


        <!-- OLD PASSWORD -->

        <label>
            Current Password
        </label>

        <input
            type="password"
            name="oldpass"
            placeholder="Enter current password"
            required>


        <!-- NEW PASSWORD -->

        <label>
            New Password
        </label>

        <input
            type="password"
            name="newpass"
            placeholder="Enter new password"
            required>


        <!-- CONFIRM PASSWORD -->

        <label>
            Confirm New Password
        </label>

        <input
            type="password"
            name="confirmpass"
            placeholder="Confirm new password"
            required>


        <!-- SUBMIT -->

        <button type="submit">
            Change Password
        </button>


    </form>


    <!-- BACK -->

    <a href="EmployeeHome.jsp" class="back">
        ← Back to Employee Home
    </a>


    <!-- FOOTER -->

    <div class="footer">

        Employee Leave Management System
        <br>

        © 2026 All Rights Reserved

    </div>


</div>


</body>

</html>