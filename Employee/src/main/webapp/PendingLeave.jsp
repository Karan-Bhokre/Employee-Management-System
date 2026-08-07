<%@page import="java.util.ArrayList"%>
<%@page import="com.pack2.LeaveBean"%>

<%@page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
ArrayList<LeaveBean> al =
    (ArrayList<LeaveBean>) session.getAttribute("pendingList");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Pending Leave Requests | Employee Leave Management System</title>


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

    color:#111827;

}


/* =========================
   MAIN CONTAINER
========================= */

.container{

    width:96%;

    max-width:1450px;

    margin:auto;

    background:rgba(255,255,255,0.97);

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


.title-section{

    display:flex;

    align-items:center;

    gap:15px;

}


.icon{

    width:60px;
    height:60px;

    border-radius:15px;

    background:#fef3c7;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:28px;

}


h2{

    color:#111827;

    font-size:27px;

    margin-bottom:5px;

}


.subtitle{

    color:#6b7280;

    font-size:13px;

}


/* =========================
   PENDING COUNT
========================= */

.count{

    background:#fff7ed;

    color:#ea580c;

    padding:10px 16px;

    border-radius:9px;

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

    min-width:1100px;

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
   LEAVE ID
========================= */

.leave-id{

    font-weight:bold;

    color:#2563eb;

}


/* =========================
   EMPLOYEE ID
========================= */

.emp-id{

    font-weight:bold;

    color:#374151;

}


/* =========================
   LEAVE TYPE
========================= */

.leave-type{

    display:inline-block;

    background:#eef2ff;

    color:#4338ca;

    padding:6px 10px;

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

    white-space:normal;

    line-height:1.4;

    color:#6b7280;

}


/* =========================
   STATUS
========================= */

.status{

    display:inline-block;

    padding:6px 11px;

    border-radius:20px;

    background:#fff7ed;

    color:#ea580c;

    font-size:11px;

    font-weight:bold;

}


/* =========================
   ACTION BUTTON
========================= */

.action{

    display:inline-block;

    padding:8px 13px;

    border-radius:7px;

    text-decoration:none;

    font-size:11px;

    font-weight:bold;

    transition:0.25s;

}


/* =========================
   APPROVE
========================= */

.approve{

    background:#dcfce7;

    color:#15803d;

}


.approve:hover{

    background:#bbf7d0;

    transform:translateY(-2px);

}


/* =========================
   REJECT
========================= */

.reject{

    background:#fee2e2;

    color:#dc2626;

}


.reject:hover{

    background:#fecaca;

    transform:translateY(-2px);

}


/* =========================
   NO DATA
========================= */

.no-data{

    text-align:center;

    padding:50px 20px;

}


.no-data-icon{

    font-size:50px;

    margin-bottom:12px;

}


.no-data h3{

    color:#374151;

    font-size:20px;

    margin-bottom:7px;

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


.info{

    color:#9ca3af;

    font-size:11px;

}


.back{

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


.back:hover{

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


    .count{

        align-self:flex-start;

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


    <!-- =========================
         HEADER
    ========================== -->

    <div class="header">


        <div class="title-section">


            <div class="icon">
                📝
            </div>


            <div>

                <h2>
                    Pending Leave Requests
                </h2>

                <p class="subtitle">
                    Review and manage employee leave applications
                </p>

            </div>


        </div>


        <div class="count">

            ⏳ Pending Requests:
            <%= (al != null) ? al.size() : 0 %>

        </div>


    </div>



    <!-- =========================
         LEAVE DATA
    ========================== -->

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

                    <th>APPROVE</th>

                    <th>REJECT</th>

                </tr>

            </thead>


            <tbody>


            <%
            for(LeaveBean lb : al)
            {
            %>


                <tr>


                    <!-- LEAVE ID -->

                    <td class="leave-id">

                        <%=lb.getaLEAVE_ID()%>

                    </td>


                    <!-- EMPLOYEE ID -->

                    <td class="emp-id">

                        <%=lb.getaEMP_ID()%>

                    </td>


                    <!-- LEAVE TYPE -->

                    <td>

                        <span class="leave-type">

                            <%=lb.getaLEAVE_TYPE()%>

                        </span>

                    </td>


                    <!-- FROM DATE -->

                    <td class="date">

                        <%=lb.getaFROM_DATE()%>

                    </td>


                    <!-- TO DATE -->

                    <td class="date">

                        <%=lb.getaTO_DATE()%>

                    </td>


                    <!-- REASON -->

                    <td class="reason">

                        <%=lb.getaREASON()%>

                    </td>


                    <!-- STATUS -->

                    <td>

                        <span class="status">

                            ⏳ <%=lb.getaSTATUS()%>

                        </span>

                    </td>


                    <!-- APPROVE -->

                    <td>

                        <a
                            class="action approve"
                            href="ApproveLeave?LEAVE_ID=<%=lb.getaLEAVE_ID()%>"
                            onclick="return confirm('Are you sure you want to approve this leave request?');">

                            ✓ Approve

                        </a>

                    </td>


                    <!-- REJECT -->

                    <td>

                        <a
                            class="action reject"
                            href="RejectLeave?LEAVE_ID=<%=lb.getaLEAVE_ID()%>"
                            onclick="return confirm('Are you sure you want to reject this leave request?');">

                            ✕ Reject

                        </a>

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


        <!-- =========================
             NO PENDING REQUESTS
        ========================== -->

        <div class="no-data">

            <div class="no-data-icon">
                ✅
            </div>

            <h3>
                No Pending Leave Requests
            </h3>

            <p>
                All employee leave requests have been processed.
            </p>

        </div>


    <%
    }
    %>



    <!-- =========================
         FOOTER
    ========================== -->

    <div class="footer">


        <div class="info">

            🔐 Administrator Leave Management Panel

        </div>


        <a href="LoginHome.jsp" class="back">

            ← Back To Admin Home

        </a>


    </div>


</div>


</body>

</html>