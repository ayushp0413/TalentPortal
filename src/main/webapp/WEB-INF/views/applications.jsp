<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Received-applications</title>
<link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon">
<script src="https://kit.fontawesome.com/afcf20c6bc.js" crossorigin="anonymous"></script>
</head>
<body>

<h1 style="text-align:center; padding:18px; background-color:#013a63">Application Received &nbsp; <i class="fa-solid fa-paper-plane" style="font-size:24px;"></i></h1>
<hr style="border: 2px solid #fff;">
<br><br>

<div class="button-container">
    <a href="/TalentPortal/acceptedApplications/${company.email}">
        <button class="btn accepted" style="color:#fff;">
            Accepted Applications &nbsp;<i class="fa-solid fa-clipboard-check"></i>
        </button>
    </a>
    <a href="/TalentPortal/rejectedApplications/${company.email}">
        <button class="btn rejected" style="color:#fff;">
            Rejected Applications &nbsp; <i class="fa-regular fa-circle-xmark"></i>
        </button>
    </a>
</div>

 <c:if test="${not empty errMsg}">
             <span class="alert alert-warning" role="alert" style="margin-left:2rem; text-align:center; font-size:1rem; color:red; background-color:white; padding:10px; border-radius:5px;">
                 <i class="fa-solid fa-circle-xmark"></i> ${errMsg}
             </span>
            </c:if>

<h2 class="title">Jobs Applications &nbsp; <i class="fa-solid fa-user-check" style="font-size:18px;"></i></h2>
<c:if test="${not empty jobMsg}">
    <span class="alert alert-warning" role="alert" style="margin-left:2rem; text-align:center; font-size:1rem; color:red; background-color:white; padding:10px; border-radius:5px;">
        <i class="fa-solid fa-circle-xmark"></i> ${jobMsg}
        </span>
</c:if>
<table>
    <thead>
        <tr>
            <th scope="col">Applicant name</th>
            <th scope="col">Email</th>
            <th scope="col">Job Profile</th>
            <th scope="col">Resume</th>
            <th scope="col">Company Name</th>
            <th scope="col">Company Email</th>
            <th scope="col">Update Status &nbsp;<i class="fa-solid fa-list-check"></i></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${appliedJobs}" var="e">
            <tr>
                <td data-label="Farmer Name">${e.freelancerName}</td>
                <td data-label="Product">${e.freelancerEmail}</td>
                <td data-label="Type">${e.position}</td>
                <td data-label="Resume">
                    <!--
                    <embed class="pdf" src="${pageContext.request.contextPath}/files/serverImgs/${e.freelancerResume}" width="170" height="200">
                    <br>
                    -->
                    <a href="${pageContext.request.contextPath}/files/serverImgs/${e.freelancerResume}" class="download-button" download="Talent Portal Resume.PDF" style="background-color:#457b9d;padding:5px; color:#fff;">
                        Download Resume <i class="fa-solid fa-file-arrow-down"></i>
                    </a>
                </td>
                <td data-label="Date">${e.companyName}</td>
                <td data-label="Date">${e.companyEmail}</td>
                <td>
                    <form action="/TalentPortal/updateJobStatus" method="post">
                        <input type="hidden" value="${e.id}" name="id">
                        <select id="status" name="status" required>
                            <option value="${e.status}" style="color:blue;">Current:${e.status}</option>
                            <option value="Accepted" style="color:green;">Accepted</option>
                            <option value="Rejected" style="color:red;">Rejected</option>
                        </select>
                        <br><br>
                        <button type="submit">Update Status</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<br><br>

<h2 class="title">Projects Application &nbsp;<i class="fa-solid fa-briefcase"></i></h2>
   <c:if test="${not empty projectMsg}">
             <span class="alert alert-warning" role="alert" style="margin-left:2rem; text-align:center; font-size:1rem; color:red; background-color:white; padding:10px; border-radius:5px;">
                 <i class="fa-solid fa-circle-xmark"></i> ${projectMsg}
             </span>
            </c:if>

<table>
    <thead>
        <tr>
            <th scope="col">Applicant name</th>
            <th scope="col">Email</th>
            <th scope="col" class="header-spacing">Project name</th>
            <th scope="col">Resume</th>
            <th scope="col">Company Name</th>
            <th scope="col">Update Status &nbsp;<i class="fa-solid fa-list-check"></i></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${appliedProjects}" var="ef">
            <tr>
                <td data-label="Farmer Name">${ef.freelancerName}</td>
                <td data-label="Product">${ef.freelancerEmail}</td>
                <td data-label="Product">${ef.projectName}</td>
                <td data-label="Resume">
                    <!--
                    <embed class="pdf" src="${pageContext.request.contextPath}/files/serverImgs/${ef.freelancerResume}" width="250" height="250">
                    <br>
                    -->
                    <a href="${pageContext.request.contextPath}/files/serverImgs/${ef.freelancerResume}" class="download-button" download="ProjectPlus Resume.PDF" style="background-color:#457b9d;padding:5px; color:#fff;">
                        Download Resume <i class="fa-solid fa-file-arrow-down"></i>
                    </a>
                </td>
                <td data-label="Type">${ef.companyName}</td>
                <td>
                    <form action="/TalentPortal/updateProjectStatus" method="post">
                        <input type="hidden" value="${ef.id}" name="id">
                        <select id="status" name="status" required>
                            <option value="${ef.status}" style="color:blue;">Current:${ef.status}</option>
                            <option value="Accepted" style="color:green;">Accepted</option>
                            <option value="Rejected" style="color:red;">Rejected</option>
                        </select>
                        <br><br>
                        <button type="submit">Update Status</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>




<style>
/* GENERAL RESET */
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    margin: 0;
    background: linear-gradient(90deg, #1a2e35 50%, #1a2e35 50%);
    min-height: 100vh;
}

h1, h2 {
    color: #fff;
    font-size: 2em;
}

.title {
            width: 95%;
            max-width: 95%;
            margin-left:1.8rem;
            font-size: 1.25rem;
            padding: 1rem;
            border-left: 4px solid #48cae4;
            background: rgba(72, 202, 228, 0.07);
            border-radius: 6px;
    }

.button-container {
    text-align: center;
    margin-bottom: 30px;
}
.btn {
    font-size: 16px;
    padding: 13px 28px;
    margin: 0 8px 10px 8px;
    border: none;
    border-radius: 22px;
    cursor: pointer;
    box-shadow: 0 2px 6px rgba(1,58,99,0.08);
    transition: background 0.2s, transform 0.22s, box-shadow 0.22s;
    letter-spacing: 0.5px;
}
.accepted {
    background: linear-gradient(90deg, #4CAF50 60%, #51a365 100%);
}
.accepted:hover {
    background: #47cf73;
    transform: translateY(-2px) scale(1.04);
    box-shadow: 0 4px 13px rgba(44,234,86,0.14);
}
.rejected {
    background: linear-gradient(90deg, #f44336 60%, #b0261a 100%);
}
.rejected:hover {
    background: #e35438;
    transform: translateY(-2px) scale(1.04);
    box-shadow: 0 4px 13px rgba(244,67,54,0.16);
}

/* ------- TABLE STYLES ------- */
table {
    width: 95%;
    max-width: 95%;
    margin: 45px auto 30px auto;
    margin-left:2rem;
    margin-right:2rem;

    border-collapse: separate;
    border-spacing: 0;
    background: rgba(255,255,255,0.92);
    border-radius: 18px;
    overflow: hidden;
    box-shadow: 0 6px 36px 0 rgba(1, 58, 99, 0.13);
    font-size: 1em;
}

thead tr {
    background: linear-gradient(90deg, #1a2e35 65%, #013a63 100%);
    color: #fff;
    letter-spacing: 0.04em;
}
th, td {
    padding: 18px 14px;
    text-align: center;
    border: none;
}
tbody tr {
    transition: background 0.18s, box-shadow 0.20s;
}
tbody tr:hover {
    background: #ecf4fa;
    box-shadow: 0 2px 18px 0 rgba(1, 58, 99, 0.10);
}
td {
    color: #243047;
    font-size: 1em;
    vertical-align: middle;
}

@media (max-width: 800px) {
    table, thead, tbody, th, td, tr { display: block; }
    table {
        width: 99%;
        margin: 25px 0;
        box-shadow: none;
    }
    thead tr { display: none; }
    tr { margin-bottom: 14px; border-bottom: 1px solid #b0b0bf;}
    td {
        padding: 10px;
        text-align: right;
        position: relative;
    }
    td[data-label]:before {
        content: attr(data-label) ': ';
        float: left;
        color: #2c3e50;
        font-weight: bold;
        font-size: 0.99em;
    }
}

/* PDF Embed styling */
embed.pdf {
    border-radius: 9px;
    box-shadow: 0 2px 8px rgba(1,58,99,0.10);
    border: 1px solid #d3e0ea;
}

/* Resume Download Button */
a.download-button {
    display: inline-block;
    margin-top: 8px;
    margin-bottom: 3px;
    border-radius: 6px;
    background: #0984e3;
    color: #fff !important;
    font-size: 0.97em;
    padding: 5px 13px;
    text-decoration: none;
    box-shadow: 0 2px 8px rgba(9,132,227,0.08);
    transition: background 0.18s;
}
a.download-button:hover {
    background: #0b5fa5;
}

/* ---- STATUS UPDATE FORM / BUTTON ---- */
form[action^="updateStatus"] {
    margin: 0;
}
select[name="status"] {
    border: 1px solid #abe1fa;
    border-radius: 7px;
    padding: 7px 12px;
    min-width: 120px;
    background: #f5fafd;
    font-size: 1em;
    color: #1c3551;
    box-shadow: 0 1px 4px rgba(66,170,255,0.07);
    outline: none;
    margin-bottom: 12px;
    transition: border 0.2s, box-shadow 0.22s;
}
select[name="status"]:focus {
    border: 1.4px solid #0077b6;
    box-shadow: 0 1px 10px rgba(1, 58, 99, 0.13);
}
select[name="status"] option[value="Accepted"] { color: #287d39; }
select[name="status"] option[value="Rejected"] { color: #b3331b; }
select[name="status"] option { color: #304052; }
button[type="submit"] {
    background: linear-gradient(90deg, #208df0, #0cb1f1 86%);
    color: #fff;
    padding: 9px 21px;
    border-radius: 7px;
    border: none;
    font-weight: 600;
    font-size: 1em;
    letter-spacing: 1.3px;
    box-shadow: 0 2px 8px rgba(32,141,240,0.11);
    cursor: pointer;
    transition: background 0.18s, box-shadow 0.18s, transform 0.14s;
}
button[type="submit"]:hover {
    background: linear-gradient(95deg, #0cb1f1 48%, #208df0 100%);
    transform: scale(1.05);
    box-shadow: 0 4px 17px 0 rgba(32,141,240,.19);
}

/* General improvement for buttons, focus/hover */
select:focus, button:focus {
  outline: 2px solid #085894;
  outline-offset: 2px;
}

/* subtle row separation */
tbody tr:not(:last-child) {
    border-bottom: 1px solid #e4edf7;
}
</style>
</body>
</html>