<%@page import="java.util.ArrayList"%>
<%@page import="com.pack2.LeaveBean"%>

<%@page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    ArrayList<LeaveBean> al =
        (ArrayList<LeaveBean>) session.getAttribute("reportList");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Leave Report</title>

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

    padding:35px 20px;

}


/* =========================
   MAIN CONTAINER
========================= */

.container{

    width:96%;
    max-width:1450px;

    margin:auto;

    background:#ffffff;

    border-radius:20px;

    padding:30px;

    box-shadow:
    0 25px 60px rgba(0,0,0,0.30);

}


/* =========================
   HEADER
========================= */

.header{

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-bottom:25px;

    padding-bottom:20px;

    border-bottom:1px solid #e5e7eb;

}


.title-area{

    display:flex;

    align-items:center;

    gap:15px;

}


.icon{

    width:60px;
    height:60px;

    border-radius:15px;

    background:#dbeafe;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:30px;

}


.title-area h1{

    font-size:27px;

    color:#111827;

    margin-bottom:5px;

}


.subtitle{

    color:#6b7280;

    font-size:13px;

}


/* =========================
   RECORD COUNT
========================= */

.record-count{

    background:#eff6ff;

    color:#2563eb;

    padding:11px 16px;

    border-radius:10px;

    font-size:13px;

    font-weight:bold;

}


/* =========================
   TABLE WRAPPER
========================= */

.table-wrapper{

    width:100%;

    overflow-x:auto;

    border-radius:12px;

    border:1px solid #e5e7eb;

}


/* =========================
   TABLE
========================= */

table{

    width:100%;

    min-width:1050px;

    border-collapse:collapse;

    background:#ffffff;

}


/* =========================
   TABLE HEADER
========================= */

th{

    background:
    linear-gradient(135deg,#2563eb,#1d4ed8);

    color:white;

    padding:14px 12px;

    font-size:12px;

    text-align:center;

    white-space:nowrap;

}


/* =========================
   TABLE DATA
========================= */

td{

    padding:13px 12px;

    text-align:center;

    border-bottom:1px solid #e5e7eb;

    font-size:12px;

    color:#374151;

}


/* =========================
   ROW
========================= */

tbody tr:nth-child(even){

    background:#f8fafc;

}


tbody tr{

    transition:0.2s;

}


tbody tr:hover{

    background:#eff6ff;

}


/* =========================
   IDS
========================= */

.leave-id{

    color:#2563eb;

    font-weight:bold;

}


.emp-id{

    color:#374151;

    font-weight:bold;

}


/* =========================
   LEAVE TYPE
========================= */

.leave-type{

    display:inline-block;

    background:#eef2ff;

    color:#4338ca;

    padding:6px 11px;

    border-radius:7px;

    font-size:11px;

    font-weight:bold;

}


/* =========================
   DATE
========================= */

.date{

    white-space:nowrap;

    color:#4b5563;

}


/* =========================
   REASON
========================= */

.reason{

    max-width:250px;

    line-height:1.4;

    color:#6b7280;

}


/* =========================
   STATUS
========================= */

.status{

    display:inline-block;

    padding:7px 13px;

    border-radius:20px;

    font-size:11px;

    font-weight:bold;

}


/* =========================
   PENDING
========================= */

.pending{

    background:#fef3c7;

    color:#b45309;

}


/* =========================
   APPROVED
========================= */

.approved{

    background:#dcfce7;

    color:#15803d;

}


/* =========================
   REJECTED
========================= */

.rejected{

    background:#fee2e2;

    color:#dc2626;

}


/* =========================
   NO DATA
========================= */

.no-data{

    text-align:center;

    padding:60px 20px;

}


.no-data-icon{

    font-size:55px;

    margin-bottom:15px;

}


.no-data h3{

    color:#374151;

    font-size:20px;

    margin-bottom:8px;

}


.no-data p{

    color:#9ca3af;

    font-size:13px;

}


/* =========================
   FOOTER
========================= */

.footer{

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-top:25px;

    padding-top:20px;

    border-top:1px solid #e5e7eb;

}


.footer-text{

    color:#9ca3af;

    font-size:11px;

}


.back-btn{

    display:inline-block;

    text-decoration:none;

    background:#2563eb;

    color:white;

    padding:11px 20px;

    border-radius:8px;

    font-size:13px;

    font-weight:bold;

    transition:0.3s;

}


.back-btn:hover{

    background:#1d4ed8;

    transform:translateY(-2px);

}


/* =========================
   RESPONSIVE
========================= */

@media(max-width:800px){

    body{

        padding:20px 10px;

    }

    .container{

        width:100%;

        padding:20px 15px;

    }

    .header{

        flex-direction:column;

        align-items:flex-start;

        gap:15px;

    }

    .footer{

        flex-direction:column;

        align-items:flex-start;

        gap:15px;

    }

}

</style>

</head>


<body>


<div class="container">


    <!-- HEADER -->

    <div class="header">


        <div class="title-area">

            <div class="icon">
                📊
            </div>

            <div>

                <h1>
                    Leave Report
                </h1>

                <p class="subtitle">
                    Employee Leave Management System
                </p>

            </div>

        </div>


        <div class="record-count">

            📋 Total Records:
            <%= (al != null) ? al.size() : 0 %>

        </div>


    </div>


    <!-- REPORT -->

    <%
        if(al != null && !al.isEmpty())
        {
    %>


    <div class="table-wrapper">


        <table>


            <thead>

                <tr>

                    <th>LEAVE ID</th>

                    <th>EMPLOYEE ID</th>

                    <th>LEAVE TYPE</th>

                    <th>FROM DATE</th>

                    <th>TO DATE</th>

                    <th>REASON</th>

                    <th>STATUS</th>

                </tr>

            </thead>


            <tbody>


            <%
                for(LeaveBean lb : al)
                {
            %>


                <tr>


                    <!-- Leave ID -->

                    <td class="leave-id">

                        <%=lb.getaLEAVE_ID()%>

                    </td>


                    <!-- Employee ID -->

                    <td class="emp-id">

                        <%=lb.getaEMP_ID()%>

                    </td>


                    <!-- Leave Type -->

                    <td>

                        <span class="leave-type">

                            <%=lb.getaLEAVE_TYPE()%>

                        </span>

                    </td>


                    <!-- From Date -->

                    <td class="date">

                        <%=lb.getaFROM_DATE()%>

                    </td>


                    <!-- To Date -->

                    <td class="date">

                        <%=lb.getaTO_DATE()%>

                    </td>


                    <!-- Reason -->

                    <td class="reason">

                        <%=lb.getaREASON()%>

                    </td>


                    <!-- Status -->

                    <td>

                    <%
                        String status = lb.getaSTATUS();

                        if(status != null &&
                           status.equalsIgnoreCase("Pending"))
                        {
                    %>

                        <span class="status pending">
                            ⏳ Pending
                        </span>

                    <%
                        }
                        else if(status != null &&
                                status.equalsIgnoreCase("Approved"))
                        {
                    %>

                        <span class="status approved">
                            ✓ Approved
                        </span>

                    <%
                        }
                        else if(status != null &&
                                status.equalsIgnoreCase("Rejected"))
                        {
                    %>

                        <span class="status rejected">
                            ✕ Rejected
                        </span>

                    <%
                        }
                        else
                        {
                    %>

                        <span class="status pending">
                            <%=status%>
                        </span>

                    <%
                        }
                    %>

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
        else
        {
    %>


    <!-- NO RECORDS -->

    <div class="no-data">

        <div class="no-data-icon">
            📊
        </div>

        <h3>
            No Leave Records Found
        </h3>

        <p>
            There are currently no leave records available.
        </p>

    </div>


    <%
        }
    %>


    <!-- FOOTER -->

    <div class="footer">

        <div class="footer-text">

            🔐 Administrator Leave Report

        </div>


        <a href="LoginHome.jsp" class="back-btn">

            ← Back To Admin Home

        </a>

    </div>


</div>


</body>

</html>