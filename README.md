# Employee Leave Management System

A professional **Java-based web application** designed to automate and simplify the employee leave management process. The system provides separate modules for **Admin and Employees**, enabling efficient management of employee information, leave applications, approvals, and leave history.

## 📌 Project Overview

The **Employee Leave Management System** helps organizations manage employee leave requests through a centralized web-based platform.

Employees can apply for leave, monitor their leave status, and manage their profiles, while administrators can manage employee records and review, approve, or reject leave requests.

The application is developed using **Java, JSP, Servlets, JDBC, and Oracle Database** and deployed on **Apache Tomcat 9**.

## 🎯 Objectives

* Automate the employee leave management process
* Reduce manual paperwork and administrative effort
* Provide a centralized system for managing leave requests
* Allow employees to track their leave status
* Enable administrators to efficiently manage employees and leave requests
* Maintain organized leave history and employee records

## 👥 User Modules

### 👨‍💼 Admin Module

* Admin Login
* Admin Dashboard
* Add Employee
* View Employee Details
* Update Employee Information
* Delete Employee
* View Leave Requests
* Approve Leave Requests
* Reject Leave Requests
* View Leave History

### 👨‍💻 Employee Module

* Employee Registration
* Employee Login
* Employee Dashboard
* View Profile
* Update Profile
* Apply for Leave
* View Leave Status
* View Leave History
* Change Password

## 🛠️ Technologies Used

| Technology          | Purpose                           |
| ------------------- | --------------------------------- |
| **Java**            | Backend Programming               |
| **JSP**             | Dynamic Web Pages                 |
| **Servlets**        | Request & Business Logic Handling |
| **JDBC**            | Database Connectivity             |
| **Oracle Database** | Data Storage                      |
| **HTML5**           | Page Structure                    |
| **CSS3**            | Styling                           |
| **Bootstrap**       | Responsive UI                     |
| **Apache Tomcat 9** | Web Server                        |
| **Eclipse IDE**     | Development Environment           |

## 🏗️ Project Architecture

The application follows a structured layered architecture:

```text
User
  ↓
JSP / HTML
  ↓
Servlet
  ↓
DAO Layer
  ↓
JDBC
  ↓
Oracle Database
```

### Architecture Components

**JSP / HTML**
Provides the user interface and collects user input.

**Servlets**
Handle HTTP requests, validation, session management, and application flow.

**DAO (Data Access Object)**
Handles database operations such as INSERT, UPDATE, DELETE, and SELECT.

**JDBC**
Provides connectivity between the Java application and Oracle Database.

**Oracle Database**
Stores employee, admin, and leave-related information.

## 🗄️ Database

The application uses **Oracle Database** for persistent data storage.

Main database tables include:

* `ADMIN`
* `EMPLOYEE`
* `LEAVE_REQUEST`

The system uses **PreparedStatement** for database operations to provide structured and safer SQL execution.

## 🔐 Security & Session Management

* Separate Admin and Employee authentication
* Session-based login management
* Unauthorized users are redirected to the appropriate login page
* Role-based access to application features
* Password-based authentication

## ✨ Key Features

* Clean and user-friendly interface
* Admin and Employee role separation
* Complete employee CRUD operations
* Leave application and approval workflow
* Leave status tracking
* Leave history management
* Oracle database integration
* Session management
* Responsive web interface

## 📸 Project Screenshots

Screenshots of the application's major modules and user interfaces are available in the repository.

## 🚀 Future Enhancements

The project can be further enhanced with:

* Email notifications for leave approval/rejection
* Attendance management
* Advanced reporting and analytics
* Role-based access control
* REST API integration
* Password encryption
* Cloud deployment
* Mobile-friendly application

## 📂 Project Repository

🔗 **GitHub:**
https://github.com/Karan-Bhokre/Employee-Management-System

## 👨‍💻 Developer

**Karan Bhokare**

MCA Student | Java Developer | Web Development Enthusiast

---

⭐ If you find this project useful, consider giving the repository a **Star**.

**Built with Java, JSP, Servlets, JDBC & Oracle Database.**
