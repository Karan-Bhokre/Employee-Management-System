```jsp
<%@page import="com.pack2.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
AdminBean abean = (AdminBean)session.getAttribute("adminbean");

if(abean == null){
    response.sendRedirect("AdminLogin.html");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Dashboard</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>

/* =========================
   RESET
========================= */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:Arial, Helvetica, sans-serif;
    background:#f4f7fb;
    color:#1f2937;
}


/* =========================
   SIDEBAR
========================= */

.sidebar{
    position:fixed;
    left:0;
    top:0;
    width:255px;
    height:100vh;

    background:linear-gradient(180deg,#111827,#1e3a8a);

    color:white;
    padding:25px 18px;

    box-shadow:4px 0 20px rgba(0,0,0,0.10);
}


/* LOGO */

.logo{
    text-align:center;
    padding-bottom:25px;

    border-bottom:1px solid rgba(255,255,255,0.15);
}

.logo-icon{
    width:65px;
    height:65px;

    margin:auto;

    border-radius:50%;

    background:white;
    color:#1d4ed8;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:30px;
    font-weight:bold;
}

.logo h2{
    margin-top:12px;
    font-size:20px;
}

.logo p{
    margin-top:5px;
    font-size:12px;
    color:#cbd5e1;
}


/* =========================
   MENU
========================= */

.menu{
    margin-top:30px;
}

.menu-title{
    font-size:11px;
    text-transform:uppercase;

    color:#94a3b8;

    margin:0 0 12px 10px;

    letter-spacing:1px;
}

.menu a{
    display:flex;
    align-items:center;

    gap:14px;

    text-decoration:none;

    color:white;

    padding:14px 15px;

    margin:6px 0;

    border-radius:9px;

    font-size:14px;

    transition:0.3s;
}

.menu a:hover{
    background:rgba(255,255,255,0.12);
    transform:translateX(4px);
}

.menu a.active{
    background:white;
    color:#1d4ed8;
    font-weight:bold;
}

.icon{
    width:25px;
    text-align:center;
    font-size:19px;
}


/* LOGOUT */

.logout{
    margin-top:25px !important;
    background:#dc3545 !important;
}

.logout:hover{
    background:#bb2d3b !important;
    transform:none !important;
}


/* =========================
   MAIN
========================= */

.main{
    margin-left:255px;
    min-height:100vh;
}


/* =========================
   TOP BAR
========================= */

.topbar{
    height:75px;

    background:white;

    border-bottom:1px solid #e5e7eb;

    display:flex;

    align-items:center;

    justify-content:space-between;

    padding:0 35px;
}

.topbar h1{
    font-size:22px;
    color:#111827;
}

.topbar p{
    margin-top:5px;
    font-size:13px;
    color:#6b7280;
}


/* ADMIN PROFILE */

.admin-profile{
    display:flex;
    align-items:center;
    gap:12px;
}

.admin-avatar{
    width:43px;
    height:43px;

    border-radius:50%;

    background:#2563eb;

    color:white;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:18px;
    font-weight:bold;
}

.admin-info strong{
    display:block;
    font-size:14px;
}

.admin-info span{
    font-size:12px;
    color:#6b7280;
}


/* =========================
   CONTENT
========================= */

.content{
    padding:35px;
}


/* =========================
   WELCOME
========================= */

.welcome{
    background:linear-gradient(135deg,#2563eb,#1e40af);

    color:white;

    border-radius:16px;

    padding:30px;

    display:flex;

    align-items:center;

    justify-content:space-between;

    margin-bottom:28px;

    box-shadow:0 8px 25px rgba(37,99,235,0.20);
}

.welcome h2{
    font-size:27px;
    margin-bottom:8px;
}

.welcome p{
    font-size:14px;
    opacity:0.9;
}

.welcome-icon{
    width:75px;
    height:75px;

    border-radius:50%;

    background:rgba(255,255,255,0.15);

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:35px;
}


/* =========================
   STAT CARDS
========================= */

.stats{
    display:grid;

    grid-template-columns:repeat(4,1fr);

    gap:20px;

    margin-bottom:30px;
}

.stat-card{
    background:white;

    border-radius:14px;

    padding:22px;

    display:flex;

    align-items:center;

    gap:16px;

    border:1px solid #edf0f5;

    box-shadow:0 4px 15px rgba(0,0,0,0.05);

    transition:0.3s;
}

.stat-card:hover{
    transform:translateY(-4px);

    box-shadow:0 8px 20px rgba(0,0,0,0.08);
}

.stat-icon{
    width:52px;
    height:52px;

    border-radius:12px;

    background:#e8f1ff;

    display:flex;

    align-items:center;
    justify-content:center;

    font-size:24px;
}

.stat-card h4{
    font-size:11px;

    color:#6b7280;

    text-transform:uppercase;

    margin-bottom:6px;
}

.stat-card h3{
    font-size:17px;

    color:#111827;
}


/* =========================
   DASHBOARD GRID
========================= */

.dashboard-grid{
    display:grid;

    grid-template-columns:1.3fr 1fr;

    gap:25px;
}


/* =========================
   CARD
========================= */

.card{
    background:white;

    border-radius:15px;

    padding:25px;

    border:1px solid #edf0f5;

    box-shadow:0 4px 15px rgba(0,0,0,0.05);
}

.card-header{
    display:flex;

    justify-content:space-between;

    align-items:center;

    padding-bottom:16px;

    margin-bottom:20px;

    border-bottom:1px solid #edf0f5;
}

.card-header h3{
    font-size:18px;
}

.card-header span{
    font-size:11px;

    color:#2563eb;

    font-weight:bold;
}


/* =========================
   ACTION BUTTONS
========================= */

.actions{
    display:grid;

    grid-template-columns:1fr 1fr;

    gap:15px;
}

.btn{
    text-decoration:none;

    padding:18px;

    border-radius:11px;

    display:flex;

    align-items:center;

    gap:13px;

    font-weight:bold;

    font-size:14px;

    transition:0.3s;

    border:1px solid #edf0f5;

    background:#f8fafc;

    color:#111827;
}

.btn:hover{
    transform:translateY(-3px);

    box-shadow:0 6px 15px rgba(0,0,0,0.08);
}

.btn-icon{
    width:42px;
    height:42px;

    border-radius:10px;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:20px;

    background:#e8f1ff;

    color:#2563eb;
}

.btn-text span{
    display:block;

    font-size:11px;

    font-weight:normal;

    color:#6b7280;

    margin-top:4px;
}


/* =========================
   ADMIN INFORMATION
========================= */

.admin-details{
    display:grid;

    grid-template-columns:1fr;

    gap:14px;
}

.detail{
    background:#f8fafc;

    padding:15px;

    border-radius:10px;

    border:1px solid #edf0f5;
}

.detail label{
    display:block;

    font-size:10px;

    text-transform:uppercase;

    color:#6b7280;

    font-weight:bold;

    margin-bottom:6px;
}

.detail p{
    font-size:14px;

    color:#111827;
}


/* =========================
   FOOTER
========================= */

.footer{
    text-align:center;

    color:#9ca3af;

    font-size:12px;

    padding:30px 0 10px;
}


/* =========================
   RESPONSIVE
========================= */

@media(max-width:1100px){

    .stats{
        grid-template-columns:1fr 1fr;
    }

    .dashboard-grid{
        grid-template-columns:1fr;
    }
}


@media(max-width:750px){

    .sidebar{
        width:70px;
        padding:20px 10px;
    }

    .logo h2,
    .logo p,
    .menu-title,
    .menu a span{
        display:none;
    }

    .logo-icon{
        width:45px;
        height:45px;
        font-size:21px;
    }

    .menu a{
        justify-content:center;
        padding:14px 5px;
    }

    .main{
        margin-left:70px;
    }

    .topbar{
        padding:0 20px;
    }

    .admin-info{
        display:none;
    }

    .content{
        padding:20px;
    }

    .welcome-icon{
        display:none;
    }
}


@media(max-width:500px){

    .stats{
        grid-template-columns:1fr;
    }

    .actions{
        grid-template-columns:1fr;
    }

    .topbar h1{
        font-size:18px;
    }

    .welcome h2{
        font-size:21px;
    }
}

</style>

</head>


<body>


<!-- =========================
     SIDEBAR
========================= -->

<div class="sidebar">

    <div class="logo">

        <div class="logo-icon">
            A
        </div>

        <h2>Admin Portal</h2>

        <p>Employee Leave Management</p>

    </div>


    <div class="menu">

        <div class="menu-title">
            Main Menu
        </div>


        <a href="AdminHome.jsp" class="active">

            <div class="icon">🏠</div>

            <span>Dashboard</span>

        </a>


        <a href="AddEmployee.html">

            <div class="icon">➕</div>

            <span>Add Employee</span>

        </a>


        <a href="ViewEmployee">

            <div class="icon">👥</div>

            <span>View Employees</span>

        </a>


        <a href="PendingLeave">

            <div class="icon">⏳</div>

            <span>Pending Leaves</span>

        </a>


        <a href="LeaveReport">

            <div class="icon">📊</div>

            <span>Leave Reports</span>

        </a>


        <a href="Logout" class="logout">

            <div class="icon">🚪</div>

            <span>Logout</span>

        </a>

    </div>

</div>



<!-- =========================
     MAIN
========================= -->

<div class="main">


    <!-- TOP BAR -->

    <div class="topbar">

        <div>

            <h1>Admin Dashboard</h1>

            <p>Manage employees and leave requests</p>

        </div>


        <div class="admin-profile">

            <div class="admin-avatar">
                A
            </div>

            <div class="admin-info">

                <strong>
                    <%=abean.getaUSERNAME()%>
                </strong>

                <span>Administrator</span>

            </div>

        </div>

    </div>



    <!-- CONTENT -->

    <div class="content">


        <!-- WELCOME -->

        <div class="welcome">

            <div>

                <h2>
                    Welcome, <%=abean.getaUSERNAME()%> 👋
                </h2>

                <p>
                    Manage employees, leave requests and reports from one place.
                </p>

            </div>


            <div class="welcome-icon">
                🛡️
            </div>

        </div>



        <!-- STAT CARDS -->

        <div class="stats">


            <div class="stat-card">

                <div class="stat-icon">
                    👥
                </div>

                <div>

                    <h4>Employees</h4>

                    <h3>Manage Employees</h3>

                </div>

            </div>



            <div class="stat-card">

                <div class="stat-icon">
                    ⏳
                </div>

                <div>

                    <h4>Requests</h4>

                    <h3>Pending Leaves</h3>

                </div>

            </div>



            <div class="stat-card">

                <div class="stat-icon">
                    📊
                </div>

                <div>

                    <h4>Reports</h4>

                    <h3>Leave Reports</h3>

                </div>

            </div>



            <div class="stat-card">

                <div class="stat-icon">
                    🔐
                </div>

                <div>

                    <h4>Access</h4>

                    <h3>Administrator</h3>

                </div>

            </div>

        </div>
            <!-- ADMIN INFORMATION -->

            <div class="card">

                <div class="card-header">

                    <h3>Admin Information</h3>

                    <span>ACCOUNT</span>

                </div>


                <div class="admin-details">


                    <div class="detail">

                        <label>Username</label>

                        <p>
                            <%=abean.getaUSERNAME()%>
                        </p>

                    </div>


                    <div class="detail">

                        <label>Role</label>

                        <p>
                            System Administrator
                        </p>

                    </div>


                    <div class="detail">

                        <label>Access Level</label>

                        <p>
                            Full Management Access
                        </p>

                    </div>


                    <div class="detail">

                        <label>System</label>

                        <p>
                            Employee Leave Management System
                        </p>

                    </div>


                </div>

            </div>


        </div>



        <!-- FOOTER -->

        <div class="footer">

            Employee Leave Management System
            &nbsp; | &nbsp;
            Admin Portal

        </div>


    </div>

</div>


</body>

</html>
```
