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

<title>Apply Leave</title>


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

    padding:25px 15px;

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

    width:330px;
    height:330px;

    border-radius:50%;

    background:rgba(255,255,255,0.08);

    top:-150px;
    left:-120px;
}


body::after{

    content:"";

    position:fixed;

    width:360px;
    height:360px;

    border-radius:50%;

    background:rgba(255,255,255,0.06);

    bottom:-180px;
    right:-120px;
}


/* =========================
   MAIN CARD
========================= */

.container{

    width:480px;

    max-width:100%;

    background:#ffffff;

    padding:23px 27px;

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

    margin-bottom:14px;
}


/* =========================
   ICON
========================= */

.leave-icon{

    width:55px;
    height:55px;

    margin:0 auto 8px;

    border-radius:50%;

    background:#dbeafe;

    color:#2563eb;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:27px;
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

    padding:8px 10px;

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

    color:#374151;

    font-size:12px;

    font-weight:bold;

    margin-bottom:4px;
}


/* =========================
   INPUT / SELECT / TEXTAREA
========================= */

input,
select,
textarea{

    width:100%;

    border:1px solid #d1d5db;

    border-radius:7px;

    background:#f9fafb;

    color:#111827;

    font-size:13px;

    outline:none;

    transition:0.2s;
}


input,
select{

    height:37px;

    padding:8px 10px;
}


textarea{

    height:70px;

    padding:8px 10px;

    resize:vertical;
}


/* =========================
   FOCUS
========================= */

input:focus,
select:focus,
textarea:focus{

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
   SUBMIT BUTTON
========================= */

.apply-btn{

    width:100%;

    height:40px;

    margin-top:4px;

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


.apply-btn:hover{

    background:
    linear-gradient(135deg,#1d4ed8,#1e40af);

    transform:translateY(-1px);
}


/* =========================
   BACK BUTTON
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

        padding:18px 10px;

    }

    .container{

        padding:20px 17px;

    }

    h1{

        font-size:20px;

    }

}

</style>

</head>


<body>


<div class="container">


    <!-- HEADER -->

    <div class="header">

        <div class="leave-icon">
            📋
        </div>

        <h1>
            Apply for Leave
        </h1>

        <p class="subtitle">
            Submit your leave request
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

    <form action="ApplyLeave" method="post">


        <!-- EMPLOYEE ID -->

        <div class="form-group">

            <label for="empid">
                Employee ID
            </label>

            <input
                type="text"
                id="empid"
                name="empid"
                value="<%=eb.getaEMP_ID()%>"
                readonly>

        </div>


        <!-- LEAVE ID -->

        <div class="form-group">

            <label for="leaveid">
                Leave ID
            </label>

            <input
                type="text"
                id="leaveid"
                name="leaveid"
                placeholder="Enter Leave ID"
                required>

        </div>


        <!-- LEAVE TYPE -->

        <div class="form-group">

            <label for="leavetype">
                Leave Type
            </label>

            <select
                id="leavetype"
                name="leavetype"
                required>

                <option value="">
                    Select Leave Type
                </option>

                <option value="Casual Leave">
                    Casual Leave
                </option>

                <option value="Sick Leave">
                    Sick Leave
                </option>

                <option value="Earned Leave">
                    Earned Leave
                </option>

            </select>

        </div>


        <!-- FROM DATE -->

        <div class="form-group">

            <label for="fromdate">
                From Date
            </label>

            <input
                type="date"
                id="fromdate"
                name="fromdate"
                required>

        </div>


        <!-- TO DATE -->

        <div class="form-group">

            <label for="todate">
                To Date
            </label>

            <input
                type="date"
                id="todate"
                name="todate"
                required>

        </div>


        <!-- REASON -->

        <div class="form-group">

            <label for="reason">
                Reason for Leave
            </label>

            <textarea
                id="reason"
                name="reason"
                placeholder="Enter reason for leave..."
                required></textarea>

        </div>


        <!-- SUBMIT -->

        <input
            type="submit"
            value="Apply Leave"
            class="apply-btn">


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