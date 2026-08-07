<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Leave Approved</title>

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
   BODY - BLUE BACKGROUND
========================= */

body{

    min-height:100vh;

    display:flex;

    align-items:center;

    justify-content:center;

    background:
    linear-gradient(135deg,#0f172a,#1d4ed8,#2563eb);

    padding:20px;

    position:relative;

    overflow:hidden;

}


/* =========================
   BACKGROUND CIRCLES
========================= */

body::before{

    content:"";

    position:absolute;

    width:400px;
    height:400px;

    border-radius:50%;

    background:rgba(255,255,255,0.08);

    top:-180px;
    left:-120px;

}


body::after{

    content:"";

    position:absolute;

    width:450px;
    height:450px;

    border-radius:50%;

    background:rgba(255,255,255,0.06);

    bottom:-220px;
    right:-150px;

}


/* =========================
   MAIN CONTAINER
========================= */

.container{

    width:500px;

    max-width:95%;

    position:relative;

    z-index:2;

    background:white;

    padding:40px 35px;

    text-align:center;

    border-radius:22px;

    box-shadow:
    0 25px 60px rgba(0,0,0,0.30);

}


/* =========================
   SUCCESS ICON
========================= */

.success-icon{

    width:90px;
    height:90px;

    margin:0 auto 22px;

    border-radius:50%;

    background:#dcfce7;

    color:#16a34a;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:48px;

    font-weight:bold;

    box-shadow:
    0 10px 25px rgba(22,163,74,0.20);

}


/* =========================
   HEADING
========================= */

h1{

    color:#15803d;

    font-size:28px;

    margin-bottom:12px;

}


.message{

    color:#4b5563;

    font-size:15px;

    line-height:1.6;

    margin-bottom:25px;

}


/* =========================
   SUCCESS BOX
========================= */

.success-box{

    background:#f0fdf4;

    border:1px solid #bbf7d0;

    border-radius:12px;

    padding:15px;

    margin-bottom:25px;

}


.success-box p{

    color:#166534;

    font-size:13px;

    font-weight:bold;

}


/* =========================
   BUTTONS
========================= */

.buttons{

    display:flex;

    justify-content:center;

    gap:12px;

    flex-wrap:wrap;

}


.buttons a{

    text-decoration:none;

    padding:12px 20px;

    border-radius:9px;

    font-size:13px;

    font-weight:bold;

    display:inline-block;

    transition:0.3s;

}


/* =========================
   VIEW BUTTON
========================= */

.view{

    background:#2563eb;

    color:white;

}


.view:hover{

    background:#1d4ed8;

    transform:translateY(-2px);

}


/* =========================
   HOME BUTTON
========================= */

.home{

    background:#111827;

    color:white;

}


.home:hover{

    background:#374151;

    transform:translateY(-2px);

}


/* =========================
   FOOTER
========================= */

.footer{

    margin-top:25px;

    padding-top:18px;

    border-top:1px solid #e5e7eb;

    color:#9ca3af;

    font-size:11px;

    line-height:1.6;

}


/* =========================
   RESPONSIVE
========================= */

@media(max-width:500px){

    .container{

        padding:30px 20px;

    }

    h1{

        font-size:24px;

    }

    .success-icon{

        width:75px;

        height:75px;

        font-size:40px;

    }

    .buttons{

        flex-direction:column;

    }

    .buttons a{

        width:100%;

    }

}

</style>

</head>


<body>


<!-- MAIN CONTAINER -->

<div class="container">


    <!-- SUCCESS ICON -->

    <div class="success-icon">
        ✓
    </div>


    <%
        String msg = (String)request.getAttribute("msg");

        if(msg != null)
        {
    %>


        <!-- MESSAGE FROM SERVLET -->

        <h1>
            Leave Approved
        </h1>

        <p class="message">
            <%=msg%>
        </p>


    <%
        }
        else
        {
    %>


        <!-- DEFAULT MESSAGE -->

        <h1>
            Leave Approved Successfully
        </h1>

        <p class="message">
            The employee leave request has been successfully approved.
        </p>


    <%
        }
    %>


    <!-- SUCCESS INFORMATION -->

    <div class="success-box">

        <p>
            ✓ Leave request has been updated successfully.
        </p>

    </div>


    <!-- BUTTONS -->

    <div class="buttons">


        <a href="PendingLeave" class="view">
            📋 View Pending Leaves
        </a>


        <a href="LoginHome.jsp" class="home">
            🏠 Back to Admin Home
        </a>


    </div>


    <!-- FOOTER -->

    <div class="footer">

        Employee Leave Management System
        <br>

        © 2026 All Rights Reserved

    </div>


</div>


</body>

</html>