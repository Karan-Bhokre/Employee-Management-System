<%@page import="com.pack2.EmployeeBean"%>

<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
EmployeeBean eb = (EmployeeBean)session.getAttribute("employee");

if(eb == null)
{
    response.sendRedirect("EmployeeLogin.html");
    return;
}

String msg = (String)request.getAttribute("msg");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Update Profile</title>


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

    align-items:flex-start;

    justify-content:center;

    padding:30px 15px;

    background:
    linear-gradient(135deg,#0f172a,#1e3a8a,#2563eb);

    position:relative;

    overflow-x:hidden;
}


/* =========================
   BACKGROUND CIRCLES
========================= */

body::before{

    content:"";

    position:fixed;

    width:350px;
    height:350px;

    border-radius:50%;

    background:rgba(255,255,255,0.08);

    top:-160px;
    left:-120px;

}


body::after{

    content:"";

    position:fixed;

    width:380px;
    height:380px;

    border-radius:50%;

    background:rgba(255,255,255,0.06);

    bottom:-190px;
    right:-120px;

}


/* =========================
   MAIN CARD
========================= */

.container{

    width:450px;

    max-width:100%;

    background:#ffffff;

    padding:24px 28px;

    border-radius:18px;

    position:relative;

    z-index:2;

    box-shadow:
    0 20px 45px rgba(0,0,0,0.28);
}


/* =========================
   HEADER
========================= */

.header{

    text-align:center;

    margin-bottom:16px;
}


/* =========================
   PROFILE ICON
========================= */

.profile-icon{

    width:55px;
    height:55px;

    margin:0 auto 8px;

    border-radius:50%;

    background:#dbeafe;

    color:#2563eb;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:26px;

}


/* =========================
   TITLE
========================= */

h1{

    color:#111827;

    font-size:22px;

    margin-bottom:4px;
}


.subtitle{

    color:#6b7280;

    font-size:12px;
}


/* =========================
   SUCCESS MESSAGE
========================= */

.success{

    background:#dcfce7;

    border:1px solid #bbf7d0;

    color:#15803d;

    padding:8px;

    border-radius:7px;

    text-align:center;

    font-size:12px;

    font-weight:bold;

    margin-bottom:12px;
}


/* =========================
   FORM GROUP
========================= */

.form-group{

    margin-bottom:10px;
}


/* =========================
   LABEL
========================= */

label{

    display:block;

    margin-bottom:4px;

    color:#374151;

    font-size:12px;

    font-weight:bold;
}


/* =========================
   INPUT
========================= */

input{

    width:100%;

    height:37px;

    padding:8px 11px;

    border:1px solid #d1d5db;

    border-radius:7px;

    background:#f9fafb;

    color:#111827;

    font-size:13px;

    outline:none;

    transition:0.2s;
}


input:focus{

    border-color:#2563eb;

    background:#ffffff;

    box-shadow:
    0 0 0 2px rgba(37,99,235,0.12);
}


/* =========================
   EMPLOYEE ID
========================= */

input[readonly]{

    background:#eef2f7;

    color:#6b7280;

    cursor:not-allowed;
}


/* =========================
   UPDATE BUTTON
========================= */

.update-btn{

    width:100%;

    height:39px;

    margin-top:5px;

    border:none;

    border-radius:7px;

    background:
    linear-gradient(135deg,#2563eb,#1d4ed8);

    color:white;

    font-size:14px;

    font-weight:bold;

    cursor:pointer;

    transition:0.25s;

    box-shadow:
    0 6px 15px rgba(37,99,235,0.25);
}


.update-btn:hover{

    background:
    linear-gradient(135deg,#1d4ed8,#1e40af);

    transform:translateY(-1px);
}


/* =========================
   BACK LINK
========================= */

.back{

    display:block;

    text-align:center;

    margin-top:12px;

    padding-top:10px;

    border-top:1px solid #e5e7eb;

    text-decoration:none;

    color:#2563eb;

    font-size:12px;

    font-weight:bold;
}


.back:hover{

    color:#1d4ed8;

    text-decoration:underline;
}


/* =========================
   FOOTER
========================= */

.footer{

    text-align:center;

    margin-top:10px;

    color:#9ca3af;

    font-size:9px;

    line-height:1.4;
}


/* =========================
   MOBILE
========================= */

@media(max-width:500px){

    body{

        padding:20px 10px;

    }

    .container{

        padding:22px 18px;

    }

    h1{

        font-size:21px;

    }

}

</style>

</head>


<body>


<div class="container">


    <!-- HEADER -->

    <div class="header">

        <div class="profile-icon">
            👤
        </div>

        <h1>
            Update Profile
        </h1>

        <p class="subtitle">
            Update your employee information
        </p>

    </div>


    <!-- SUCCESS MESSAGE -->

    <%
    if(msg != null)
    {
    %>

        <div class="success">
            ✓ <%=msg%>
        </div>

    <%
    }
    %>


    <!-- FORM -->

    <form action="UpdateProfile" method="post">


        <!-- EMPLOYEE ID -->

        <div class="form-group">

            <label for="eid">
                Employee ID
            </label>

            <input
                type="text"
                id="eid"
                name="eid"
                value="<%=eb.getaEMP_ID()%>"
                readonly>

        </div>


        <!-- NAME -->

        <div class="form-group">

            <label for="name">
                Employee Name
            </label>

            <input
                type="text"
                id="name"
                name="name"
                value="<%=eb.getaNAME()%>"
                required>

        </div>


        <!-- EMAIL -->

        <div class="form-group">

            <label for="email">
                Email Address
            </label>

            <input
                type="email"
                id="email"
                name="email"
                value="<%=eb.getaEMAIL()%>"
                required>

        </div>


        <!-- MOBILE -->

        <div class="form-group">

            <label for="mobile">
                Mobile Number
            </label>

            <input
                type="text"
                id="mobile"
                name="mobile"
                value="<%=eb.getaMOBILE()%>"
                maxlength="10"
                pattern="[0-9]{10}"
                required>

        </div>


        <!-- DEPARTMENT -->

        <div class="form-group">

            <label for="department">
                Department
            </label>

            <input
                type="text"
                id="department"
                name="department"
                value="<%=eb.getaDEPARTMENT()%>"
                required>

        </div>


        <!-- DESIGNATION -->

        <div class="form-group">

            <label for="designation">
                Designation
            </label>

            <input
                type="text"
                id="designation"
                name="designation"
                value="<%=eb.getaDESIGNATION()%>"
                required>

        </div>


        <!-- UPDATE -->

        <input
            type="submit"
            value="Update Profile"
            class="update-btn">


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