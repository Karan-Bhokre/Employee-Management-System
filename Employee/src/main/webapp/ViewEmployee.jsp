<%@page import="java.util.ArrayList"%>
<%@page import="com.pack2.EmployeeBean"%>

<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
ArrayList<EmployeeBean> al =
    (ArrayList<EmployeeBean>) session.getAttribute("employeeList");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>View Employees | Employee Leave Management System</title>


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

    max-width:1400px;

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

    background:#dbeafe;

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
   EMPLOYEE COUNT
========================= */

.count{

    background:#eff6ff;

    color:#2563eb;

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

    font-weight:bold;

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

    white-space:nowrap;

}


/* =========================
   ROW HOVER
========================= */

tbody tr{

    transition:0.2s;

}


tbody tr:nth-child(even){

    background:#f8fafc;

}


tbody tr:hover{

    background:#eff6ff;

}


/* =========================
   EMPLOYEE ID
========================= */

.emp-id{

    font-weight:bold;

    color:#2563eb;

}


/* =========================
   NAME
========================= */

.emp-name{

    font-weight:bold;

    color:#111827;

}


/* =========================
   EMAIL
========================= */

.email{

    color:#2563eb;

}


/* =========================
   DEPARTMENT
========================= */

.department{

    display:inline-block;

    background:#f3f4f6;

    padding:5px 9px;

    border-radius:6px;

    font-size:11px;

    font-weight:bold;

}


/* =========================
   DESIGNATION
========================= */

.designation{

    color:#4b5563;

    font-weight:600;

}


/* =========================
   PASSWORD
========================= */

.password{

    color:#6b7280;

    letter-spacing:2px;

}


/* =========================
   ACTION BUTTONS
========================= */

.action{

    display:inline-block;

    padding:7px 12px;

    border-radius:6px;

    text-decoration:none;

    font-size:11px;

    font-weight:bold;

    transition:0.25s;

}


/* EDIT */

.edit{

    background:#dcfce7;

    color:#15803d;

}


.edit:hover{

    background:#bbf7d0;

    transform:translateY(-2px);

}


/* DELETE */

.delete{

    background:#fee2e2;

    color:#dc2626;

}


.delete:hover{

    background:#fecaca;

    transform:translateY(-2px);

}


/* =========================
   NO DATA
========================= */

.no-data{

    text-align:center;

    padding:45px 20px;

}


.no-data-icon{

    font-size:45px;

    margin-bottom:12px;

}


.no-data h3{

    color:#374151;

    font-size:19px;

    margin-bottom:6px;

}


.no-data p{

    color:#9ca3af;

    font-size:13px;

}


/* =========================
   FOOTER BUTTONS
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

        gap:15px;

        align-items:flex-start;

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
                👥
            </div>


            <div>

                <h2>
                    Employee List
                </h2>

                <p class="subtitle">
                    Manage all registered employees
                </p>

            </div>


        </div>


        <div class="count">

            👤 Total Employees:
            <%= (al != null) ? al.size() : 0 %>

        </div>


    </div>



    <!-- =========================
         EMPLOYEE DATA
    ========================== -->

    <%
    if(al != null && !al.isEmpty())
    {
    %>


    <div class="table-wrapper">


        <table>


            <thead>

                <tr>

                    <th>EMPLOYEE ID</th>

                    <th>NAME</th>

                    <th>EMAIL</th>

                    <th>MOBILE</th>

                    <th>DEPARTMENT</th>

                    <th>DESIGNATION</th>

                    <th>PASSWORD</th>

                    <th>EDIT</th>

                    <th>DELETE</th>

                </tr>

            </thead>


            <tbody>


            <%
            for(EmployeeBean eb : al)
            {
            %>


                <tr>


                    <!-- EMPLOYEE ID -->

                    <td class="emp-id">

                        <%=eb.getaEMP_ID()%>

                    </td>


                    <!-- NAME -->

                    <td class="emp-name">

                        <%=eb.getaNAME()%>

                    </td>


                    <!-- EMAIL -->

                    <td class="email">

                        <%=eb.getaEMAIL()%>

                    </td>


                    <!-- MOBILE -->

                    <td>

                        <%=eb.getaMOBILE()%>

                    </td>


                    <!-- DEPARTMENT -->

                    <td>

                        <span class="department">

                            <%=eb.getaDEPARTMENT()%>

                        </span>

                    </td>


                    <!-- DESIGNATION -->

                    <td class="designation">

                        <%=eb.getaDESIGNATION()%>

                    </td>


                    <!-- PASSWORD -->

                    <td class="password">

                        ••••••••

                    </td>


                    <!-- EDIT -->

                    <td>

                        <a
                            class="action edit"
                            href="EditEmployee?EMP_ID=<%=eb.getaEMP_ID()%>">

                            ✏ Edit

                        </a>

                    </td>


                    <!-- DELETE -->

                    <td>

                        <a
                            class="action delete"
                            href="DeleteEmployee?EMP_ID=<%=eb.getaEMP_ID()%>"
                            onclick="return confirm('Are you sure you want to delete this employee?');">

                            🗑 Delete

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


        <!-- NO EMPLOYEE -->

        <div class="no-data">

            <div class="no-data-icon">
                👥
            </div>

            <h3>
                No Employees Found
            </h3>

            <p>
                There are currently no employees registered in the system.
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

            🔐 Administrator Employee Management Panel

        </div>


        <a href="LoginHome.jsp" class="back">

            ← Back To Admin Home

        </a>


    </div>


</div>


</body>

</html>