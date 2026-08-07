<%@page import="java.util.ArrayList"%>
<%@page import="com.pack2.LeaveBean"%>

<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Leave History</title>


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

    z-index:0;
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

    z-index:0;
}


/* =========================
   MAIN CARD
========================= */

.container{

    width:1100px;

    max-width:100%;

    margin:auto;

    background:#ffffff;

    padding:25px;

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

    margin-bottom:20px;
}


/* =========================
   ICON
========================= */

.history-icon{

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

    font-size:24px;

    color:#111827;

    margin-bottom:5px;
}


.subtitle{

    color:#6b7280;

    font-size:12px;
}


/* =========================
   TABLE WRAPPER
========================= */

.table-wrapper{

    width:100%;

    overflow-x:auto;

    border:1px solid #e5e7eb;

    border-radius:10px;
}


/* =========================
   TABLE
========================= */

table{

    width:100%;

    min-width:900px;

    border-collapse:collapse;

    background:white;
}


/* =========================
   TABLE HEADER
========================= */

th{

    background:
    linear-gradient(135deg,#2563eb,#1d4ed8);

    color:white;

    padding:11px 8px;

    font-size:12px;

    white-space:nowrap;
}


/* =========================
   TABLE DATA
========================= */

td{

    padding:10px 8px;

    text-align:center;

    border-bottom:1px solid #e5e7eb;

    font-size:12px;

    color:#374151;
}


/* =========================
   ROW HOVER
========================= */

tbody tr{

    transition:0.2s;
}


tbody tr:hover{

    background:#eff6ff;
}


/* =========================
   STATUS
========================= */

.status{

    display:inline-block;

    padding:5px 11px;

    border-radius:20px;

    font-size:11px;

    font-weight:bold;
}


/* PENDING */

.pending{

    background:#fef3c7;

    color:#b45309;
}


/* APPROVED */

.approved{

    background:#dcfce7;

    color:#15803d;
}


/* REJECTED */

.rejected{

    background:#fee2e2;

    color:#dc2626;
}


/* =========================
   NO DATA
========================= */

.no-data{

    text-align:center;

    padding:40px 10px;

    color:#6b7280;

    font-size:14px;
}


.no-data-icon{

    font-size:38px;

    margin-bottom:10px;
}


.no-data h3{

    color:#374151;

    margin-bottom:5px;
}


/* =========================
   BACK BUTTON
========================= */

.back{

    display:inline-block;

    margin-top:18px;

    padding:9px 18px;

    background:#198754;

    color:white;

    text-decoration:none;

    border-radius:7px;

    font-size:12px;

    font-weight:bold;

    transition:0.2s;
}


.back:hover{

    background:#157347;

    transform:translateY(-1px);
}


/* =========================
   FOOTER
========================= */

.footer{

    text-align:center;

    margin-top:18px;

    padding-top:12px;

    border-top:1px solid #e5e7eb;

    color:#9ca3af;

    font-size:9px;

    line-height:1.5;
}


/* =========================
   MOBILE
========================= */

@media(max-width:700px){

    body{

        padding:15px 8px;

    }

    .container{

        padding:18px 12px;

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

        <div class="history-icon">
            🕘
        </div>

        <h1>
            Employee Leave History
        </h1>

        <p class="subtitle">
            View your previous leave requests and their status
        </p>

    </div>


<%

ArrayList<LeaveBean> hl =
(ArrayList<LeaveBean>)request.getAttribute("leaveList");


if(hl == null || hl.size() == 0)
{

%>


    <!-- NO DATA -->

    <div class="no-data">

        <div class="no-data-icon">
            📭
        </div>

        <h3>
            No Leave History Found
        </h3>

        <p>
            There are no previous leave requests to display.
        </p>

    </div>


<%

}
else
{

%>


    <!-- TABLE -->

    <div class="table-wrapper">

        <table>

            <thead>

                <tr>

                    <th>Leave ID</th>

                    <th>Employee ID</th>

                    <th>Leave Type</th>

                    <th>From Date</th>

                    <th>To Date</th>

                    <th>Reason</th>

                    <th>Status</th>

                </tr>

            </thead>


            <tbody>


<%

for(LeaveBean lb : hl)
{

    String status = lb.getaSTATUS();

    String statusClass = "pending";

    if(status != null &&
       status.equalsIgnoreCase("Approved"))
    {
        statusClass = "approved";
    }
    else if(status != null &&
            status.equalsIgnoreCase("Rejected"))
    {
        statusClass = "rejected";
    }

%>


                <tr>

                    <td>
                        <%=lb.getaLEAVE_ID()%>
                    </td>


                    <td>
                        <%=lb.getaEMP_ID()%>
                    </td>


                    <td>
                        <%=lb.getaLEAVE_TYPE()%>
                    </td>


                    <td>
                        <%=lb.getaFROM_DATE()%>
                    </td>


                    <td>
                        <%=lb.getaTO_DATE()%>
                    </td>


                    <td>
                        <%=lb.getaREASON()%>
                    </td>


                    <td>

                        <span class="status <%=statusClass%>">

                            <%=status%>

                        </span>

                    </td>

                </tr>


<%

}

%>


            </tbody>

        </table>

    </div>


<%

}

%>


    <!-- BACK BUTTON -->

    <div style="text-align:center;">

        <a href="EmployeeHome.jsp" class="back">
            ← Back to Employee Home
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