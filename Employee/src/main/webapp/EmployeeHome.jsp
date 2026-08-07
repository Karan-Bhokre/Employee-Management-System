<%@page import="com.pack2.EmployeeBean"%>
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
EmployeeBean eb = (EmployeeBean) session.getAttribute("employee");

if(eb == null)
{
    response.sendRedirect("EmployeeLogin.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Employee Dashboard</title>

<style>

/* =====================================================
   RESET
===================================================== */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}


/* =====================================================
   BODY
===================================================== */

body{
    font-family:Arial, Helvetica, sans-serif;
    background:#f5f7fb;
    color:#1f2937;
}


/* =====================================================
   SIDEBAR
===================================================== */

.sidebar{
    position:fixed;
    left:0;
    top:0;
    width:250px;
    height:100vh;

    background:linear-gradient(180deg,#0d6efd,#084298);

    padding:25px 18px;

    color:white;

    z-index:1000;
}


/* Logo */

.logo{
    text-align:center;
    padding-bottom:25px;

    border-bottom:1px solid rgba(255,255,255,0.25);
}

.logo .icon{
    width:65px;
    height:65px;

    margin:auto;

    border-radius:50%;

    background:white;
    color:#0d6efd;

    display:flex;
    justify-content:center;
    align-items:center;

    font-size:30px;
}

.logo h2{
    margin-top:12px;
    font-size:20px;
}

.logo p{
    margin-top:5px;
    font-size:12px;
    opacity:0.8;
}


/* =====================================================
   MENU
===================================================== */

.menu{
    margin-top:30px;
}

.menu-title{
    font-size:11px;

    text-transform:uppercase;

    letter-spacing:1px;

    opacity:0.7;

    margin:0 0 12px 10px;
}

.menu a{
    display:flex;

    align-items:center;

    gap:13px;

    text-decoration:none;

    color:white;

    padding:13px 15px;

    margin:6px 0;

    border-radius:9px;

    font-size:14px;

    transition:0.3s;
}

.menu a:hover{
    background:rgba(255,255,255,0.18);

    transform:translateX(4px);
}

.menu a.active{
    background:white;

    color:#0d6efd;

    font-weight:bold;
}

.menu-icon{
    width:24px;

    text-align:center;

    font-size:18px;
}


/* Logout */

.logout{
    margin-top:25px !important;

    background:#dc3545 !important;
}

.logout:hover{
    background:#bb2d3b !important;

    transform:none !important;
}


/* =====================================================
   MAIN CONTENT
===================================================== */

.main{
    margin-left:250px;

    min-height:100vh;
}


/* =====================================================
   TOP BAR
===================================================== */

.topbar{
    height:75px;

    background:white;

    border-bottom:1px solid #e5e7eb;

    display:flex;

    align-items:center;

    justify-content:space-between;

    padding:0 35px;
}

.topbar-left h1{
    font-size:22px;

    color:#111827;
}

.topbar-left p{
    color:#6b7280;

    font-size:13px;

    margin-top:4px;
}


/* Employee mini profile */

.employee-mini{
    display:flex;

    align-items:center;

    gap:12px;
}

.employee-avatar{
    width:45px;
    height:45px;

    border-radius:50%;

    background:#0d6efd;

    color:white;

    display:flex;

    align-items:center;

    justify-content:center;

    font-weight:bold;

    font-size:18px;
}

.employee-mini-info strong{
    display:block;

    font-size:14px;
}

.employee-mini-info span{
    color:#6b7280;

    font-size:12px;
}


/* =====================================================
   CONTENT
===================================================== */

.content{
    padding:35px;
}


/* =====================================================
   WELCOME BANNER
===================================================== */

.welcome{
    background:linear-gradient(135deg,#0d6efd,#084298);

    border-radius:16px;

    padding:32px;

    color:white;

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-bottom:28px;

    box-shadow:0 8px 25px rgba(13,110,253,0.18);
}

.welcome h2{
    font-size:28px;

    margin-bottom:8px;
}

.welcome p{
    font-size:14px;

    opacity:0.9;
}

.welcome-badge{
    background:rgba(255,255,255,0.15);

    padding:18px 28px;

    border-radius:12px;

    text-align:center;
}

.welcome-badge span{
    display:block;

    font-size:12px;

    opacity:0.8;
}

.welcome-badge strong{
    display:block;

    margin-top:5px;

    font-size:17px;
}


/* =====================================================
   STAT CARDS
===================================================== */

.stats{
    display:grid;

    grid-template-columns:repeat(3,1fr);

    gap:20px;

    margin-bottom:28px;
}

.stat-card{
    background:white;

    border-radius:14px;

    padding:22px;

    display:flex;

    align-items:center;

    gap:18px;

    box-shadow:0 3px 15px rgba(0,0,0,0.06);

    border:1px solid #eef0f4;
}

.stat-icon{
    width:58px;
    height:58px;

    border-radius:12px;

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:26px;

    background:#e8f1ff;
}

.stat-card h4{
    color:#6b7280;

    font-size:12px;

    text-transform:uppercase;

    margin-bottom:6px;
}

.stat-card h3{
    font-size:20px;

    color:#111827;
}


/* =====================================================
   DASHBOARD GRID
===================================================== */

.dashboard-grid{

    display:grid;

    grid-template-columns:1.7fr 1fr;

    gap:25px;

    align-items:start;
}


/* =====================================================
   CARD
===================================================== */

.card{

    background:white;

    border-radius:15px;

    padding:30px;

    border:1px solid #eef0f4;

    box-shadow:0 3px 15px rgba(0,0,0,0.05);
}


/* =====================================================
   CARD HEADER
===================================================== */

.card-header{

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-bottom:25px;

    padding-bottom:18px;

    border-bottom:1px solid #edf0f5;
}

.card-header h3{

    font-size:20px;

    color:#111827;
}

.card-header span{

    font-size:13px;

    color:#0d6efd;

    font-weight:bold;
}


/* =====================================================
   EMPLOYEE PROFILE
===================================================== */

.profile{

    display:grid;

    grid-template-columns:1fr 1fr;

    gap:20px;
}


/* Employee Information Box */

.profile-item{

    background:#f8fafc;

    padding:20px;

    min-height:90px;

    border-radius:12px;

    border:1px solid #edf0f5;

    transition:0.3s;
}

.profile-item:hover{

    border-color:#0d6efd;

    box-shadow:0 5px 15px rgba(13,110,253,0.08);

    transform:translateY(-2px);
}


/* Label */

.profile-item label{

    display:block;

    color:#6b7280;

    font-size:12px;

    text-transform:uppercase;

    margin-bottom:9px;

    font-weight:bold;

    letter-spacing:0.5px;
}


/* Value */

.profile-item p{

    font-size:16px;

    font-weight:600;

    color:#111827;

    word-break:break-word;
}


/* =====================================================
   QUICK ACTIONS
===================================================== */

.actions{

    display:grid;

    grid-template-columns:1fr;

    gap:13px;
}

.action{

    display:flex;

    align-items:center;

    gap:15px;

    text-decoration:none;

    color:#111827;

    background:#f8fafc;

    padding:16px;

    border-radius:10px;

    border:1px solid #edf0f5;

    transition:0.3s;
}

.action:hover{

    border-color:#0d6efd;

    background:#f0f6ff;

    transform:translateY(-2px);
}

.action-icon{

    width:45px;

    height:45px;

    border-radius:10px;

    background:#e8f1ff;

    color:#0d6efd;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:21px;
}

.action-text strong{

    display:block;

    font-size:14px;
}

.action-text span{

    display:block;

    color:#6b7280;

    font-size:11px;

    margin-top:3px;
}


/* =====================================================
   FOOTER
===================================================== */

.footer{

    text-align:center;

    padding:25px;

    color:#9ca3af;

    font-size:12px;

    margin-top:30px;
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media(max-width:1100px){

    .dashboard-grid{

        grid-template-columns:1fr;
    }

}


@media(max-width:850px){

    .sidebar{

        width:210px;
    }

    .main{

        margin-left:210px;
    }

    .stats{

        grid-template-columns:1fr;
    }

}


@media(max-width:650px){

    .sidebar{

        position:relative;

        width:100%;

        height:auto;
    }

    .main{

        margin-left:0;
    }

    .topbar{

        padding:15px 20px;

        height:auto;

        gap:15px;
    }

    .content{

        padding:20px;
    }

    .welcome{

        flex-direction:column;

        align-items:flex-start;

        gap:20px;
    }

    .profile{

        grid-template-columns:1fr;
    }

}


/* =====================================================
   SMALL MOBILE
===================================================== */

@media(max-width:450px){

    .topbar-left h1{

        font-size:18px;
    }

    .employee-mini-info{

        display:none;
    }

    .welcome h2{

        font-size:23px;
    }

    .card{

        padding:20px;
    }

}

</style>

</head>


<body>


<!-- =====================================================
     SIDEBAR
===================================================== -->

<div class="sidebar">

    <div class="logo">

        <div class="icon">
            👤
        </div>

        <h2>Employee Portal</h2>

        <p>Leave Management System</p>

    </div>


    <div class="menu">

        <div class="menu-title">
            Main Menu
        </div>


        <a href="EmployeeHome.jsp" class="active">

            <span class="menu-icon">🏠</span>

            Dashboard

        </a>


        <a href="UpdateProfile.jsp">

            <span class="menu-icon">👤</span>

            Update Profile

        </a>


        <a href="ApplyLeave.jsp">

            <span class="menu-icon">📝</span>

            Apply Leave

        </a>


        <a href="ViewLeaveStatus">

            <span class="menu-icon">📊</span>

            Leave Status

        </a>


        <a href="LeaveHistory">

            <span class="menu-icon">📋</span>

            Leave History

        </a>


        <a href="ChangePassword.jsp">

            <span class="menu-icon">🔐</span>

            Change Password

        </a>


        <a href="Logout.jsp" class="logout">

            <span class="menu-icon">🚪</span>

            Logout

        </a>

    </div>

</div>



<!-- =====================================================
     MAIN
===================================================== -->

<div class="main">


    <!-- TOP BAR -->

    <div class="topbar">

        <div class="topbar-left">

            <h1>Employee Dashboard</h1>

            <p>Manage your leave and employee profile</p>

        </div>


        <div class="employee-mini">

            <div class="employee-avatar">

                <%=eb.getaNAME().substring(0,1).toUpperCase()%>

            </div>


            <div class="employee-mini-info">

                <strong>
                    <%=eb.getaNAME()%>
                </strong>

                <span>
                    <%=eb.getaDESIGNATION()%>
                </span>

            </div>

        </div>

    </div>



    <!-- CONTENT -->

    <div class="content">


        <!-- WELCOME -->

        <div class="welcome">

            <div>

                <h2>
                    Welcome, <%=eb.getaNAME()%> 👋
                </h2>

                <p>
                    Welcome to your Employee Leave Management Dashboard.
                </p>

            </div>


            <div class="welcome-badge">

                <span>
                    Employee ID
                </span>

                <strong>
                    <%=eb.getaEMP_ID()%>
                </strong>

            </div>

        </div>



        <!-- STAT CARDS -->

        <div class="stats">


            <div class="stat-card">

                <div class="stat-icon">
                    📝
                </div>

                <div>

                    <h4>
                        Leave
                    </h4>

                    <h3>
                        Apply
                    </h3>

                </div>

            </div>


            <div class="stat-card">

                <div class="stat-icon">
                    📊
                </div>

                <div>

                    <h4>
                        Leave
                    </h4>

                    <h3>
                        Status
                    </h3>

                </div>

            </div>


            <div class="stat-card">

                <div class="stat-icon">
                    📋
                </div>

                <div>

                    <h4>
                        Leave
                    </h4>

                    <h3>
                        History
                    </h3>

                </div>

            </div>


        </div>



        <!-- DASHBOARD GRID -->

        <div class="dashboard-grid">


            <!-- =================================================
                 EMPLOYEE INFORMATION
            ================================================= -->

            <div class="card">


                <div class="card-header">

                    <h3>
                        👤 Employee Information
                    </h3>

                    <span>
                        PROFILE
                    </span>

                </div>


                <div class="profile">


                    <!-- Employee ID -->

                    <div class="profile-item">

                        <label>
                            Employee ID
                        </label>

                        <p>
                            <%=eb.getaEMP_ID()%>
                        </p>

                    </div>


                    <!-- Name -->

                    <div class="profile-item">

                        <label>
                            Full Name
                        </label>

                        <p>
                            <%=eb.getaNAME()%>
                        </p>

                    </div>


                    <!-- Email -->

                    <div class="profile-item">

                        <label>
                            Email Address
                        </label>

                        <p>
                            <%=eb.getaEMAIL()%>
                        </p>

                    </div>


                    <!-- Mobile -->

                    <div class="profile-item">

                        <label>
                            Mobile Number
                        </label>

                        <p>
                            <%=eb.getaMOBILE()%>
                        </p>

                    </div>


                    <!-- Department -->

                    <div class="profile-item">

                        <label>
                            Department
                        </label>

                        <p>
                            <%=eb.getaDEPARTMENT()%>
                        </p>

                    </div>


                    <!-- Designation -->

                    <div class="profile-item">

                        <label>
                            Designation
                        </label>

                        <p>
                            <%=eb.getaDESIGNATION()%>
                        </p>

                    </div>


                </div>

            </div>



            <!-- =================================================
                 QUICK ACTIONS
            ================================================= -->

            <div class="card">


                <div class="card-header">

                    <h3>
                        ⚡ Quick Actions
                    </h3>

                    <span>
                        ACTIONS
                    </span>

                </div>


                <div class="actions">


                    <!-- Apply Leave -->

                    <a href="ApplyLeave.jsp" class="action">

                        <div class="action-icon">
                            📝
                        </div>

                        <div class="action-text">

                            <strong>
                                Apply Leave
                            </strong>

                            <span>
                                Submit a new leave request
                            </span>

                        </div>

                    </a>


                    <!-- Leave Status -->

                    <a href="ViewLeaveStatus" class="action">

                        <div class="action-icon">
                            📊
                        </div>

                        <div class="action-text">

                            <strong>
                                Leave Status
                            </strong>

                            <span>
                                Check current leave status
                            </span>

                        </div>

                    </a>


                    <!-- Leave History -->

                    <a href="LeaveHistory" class="action">

                        <div class="action-icon">
                            📋
                        </div>

                        <div class="action-text">

                            <strong>
                                Leave History
                            </strong>

                            <span>
                                View previous leave records
                            </span>

                        </div>

                    </a>


                    <!-- Update Profile -->

                    <a href="UpdateProfile.jsp" class="action">

                        <div class="action-icon">
                            👤
                        </div>

                        <div class="action-text">

                            <strong>
                                Update Profile
                            </strong>

                            <span>
                                Edit your employee details
                            </span>

                        </div>

                    </a>


                    <!-- Change Password -->

                    <a href="ChangePassword.jsp" class="action">

                        <div class="action-icon">
                            🔐
                        </div>

                        <div class="action-text">

                            <strong>
                                Change Password
                            </strong>

                            <span>
                                Update your account password
                            </span>

                        </div>

                    </a>


                </div>

            </div>


        </div>


        <!-- FOOTER -->

        <div class="footer">

            Employee Leave Management System

            <br>

            © 2026 All Rights Reserved

        </div>


    </div>

</div>


</body>
</html>