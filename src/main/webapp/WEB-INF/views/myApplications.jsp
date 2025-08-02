<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>my-applications</title>
<link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon">
<script src="https://kit.fontawesome.com/afcf20c6bc.js" crossorigin="anonymous"></script>
<!-- Modern Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<style>
    body {
        margin: 0;
        background: linear-gradient(135deg, #e0f7fa 0%, #fce4ec 100%);
        font-family: 'Inter', Verdana, Arial, sans-serif;
        color: #323232;
        min-height: 100vh;
    }

    h1, h2 {
        color: #313a46;
        font-weight: 700;
        letter-spacing: 1px;
        text-shadow: 0 2px 12px rgba(72, 202, 228, 0.06);
    }

    h1 {
        background: rgba(72, 202, 228, 0.10);
        border-radius: 12px;
        padding: 20px 0;
        margin-bottom: 0;
        margin-top: 32px;
        font-size: 2.2rem;
    }

    h2 {
        margin: 32px 0 16px;
        font-size: 1.25rem;
        padding-left: 8px;
        border-left: 4px solid #48cae4;
        background: rgba(72, 202, 228, 0.07);
        border-radius: 6px;
    }

    hr {
        border: none;
        border-top: 3px solid #48cae4;
        width: 100vw;
        max-width: 1200px;
    }

    .title {
            margin-left:1.8rem;
            font-size: 1.25rem;
            padding: 1rem;
            border-left: 4px solid #48cae4;
            background: rgba(72, 202, 228, 0.07);
            border-radius: 6px;
    }

    table {
        width: 96%;
        max-width: 1150px;
        margin: 0 auto 32px auto;
        border-collapse: separate;
        border-spacing: 0;
        background: #fff;
        border-radius: 14px;
        box-shadow: 0 8px 28px 0 rgba(50,50,93,0.08), 0 1.5px 4px 0 rgba(72,202,228,0.12);
        overflow-x: auto;
        font-size: 1.04rem;
    }

    thead tr {
        background: linear-gradient(90deg, #f8fafc 70%, #fce4ec 100%);
    }

    th, td {
        padding: 1rem 0.85rem;
        text-align: left;
        border-bottom: 1px solid #f2f2f2;
    }

    th {
        font-weight: 700;
        font-size: 1.03em;
        color: #145da0;
        text-transform: uppercase;
        letter-spacing: .03em;
    }

    tr:last-child td {
        border-bottom: none;
    }

    tbody tr {
        transition: background 0.18s;
    }

    tbody tr:hover {
        background: #e7fdfc;
    }

    .status {
        font-weight: 600;
        letter-spacing: 0.04em;
        border-radius: 24px;
        min-width: 92px;
        font-size: 1em;
        text-transform: capitalize;
        text-align:center;
    }

    .status[data-status="Accepted"] {color: #2ecc6c; background: #e8fff4;}
    .status[data-status="Rejected"] {color: #e74c3c; background: #fff0ee;}
    .status[data-status="sent"]     {color: #3498db; background: #f0f8ff;}

    /* Message styling */
    p {
        margin-left: 4vw;
        margin-bottom: 0.5rem;
        font-size: 1.08rem;
        padding: 0.65rem 1.3rem;
        background: rgba(72, 202, 228, 0.11);
        color: #377dbd;
        border-radius: 8px;
        display: inline-block;
    }

    /* Responsive Design */
    @media (max-width: 900px) {
        table, thead, tbody, th, td, tr {
            font-size: 0.97rem;
        }
        h1 {font-size: 1.3rem;}
        h2 {font-size: 1.08rem;}
    }

    @media (max-width: 600px) {
        table, thead, tbody, th, td, tr { font-size: 0.88rem; }
        th, td { padding: 0.55rem 0.4rem; }
        h1 {padding: 12px 0; font-size: 1.03rem;}
        h2 {font-size: 0.97rem; padding-left: 4px;}
    }
</style>
</head>
<body>

<h1 style="text-align:center;">My Applications &nbsp;<i class="fa-solid fa-paper-plane" style="font-size:24px;"></i></h1>
<hr>
<br>

<h2 class="title">Job Applications &nbsp;<i class="fa-solid fa-list"></i></h2>

<c:if test="${not empty jobMsg}">
    <p style="background:rgba(72,202,228,0.07);color:#145da0;">${jobMsg}</p>
</c:if>
<c:if test="${not empty appliedJobs}">
<table>
    <thead>
        <tr>
            <th scope="col">Company</th>
            <th scope="col">Position</th>
            <th scope="col">Candidate Name</th>
            <th scope="col">Candidate Email</th>
            <th scope="col">Resume</th>
            <th scope="col">Application Status</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${appliedJobs}" var="e">
            <tr>
                <td>${e.companyName}</td>
                <td>${e.position}</td>
                <td>${e.freelancerName}</td>
                <td>${e.freelancerEmail}</td>
               <td data-label="Resume">
                   <a href="${e.freelancerResume}" download
                      style="color:#146eb4; text-decoration: underline;">
                      Download Resume
                   </a>
               </td>
                <td class="status" data-status="${e.status}">${e.status}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</c:if>

<br><br>
<h2 class="title">Project Applications &nbsp;<i class="fa-solid fa-list"></i></h2>
<c:if test="${not empty projectMsg}">
    <p style="background:rgba(255,77,109,0.06);color:#ff4d6d;">${projectMsg}</p>
</c:if>
<c:if test="${not empty appliedProjects}">
<table>
    <thead>
        <tr>
            <th scope="col">Project</th>
            <th scope="col">Company</th>
            <th scope="col">Candidate Name</th>
            <th scope="col">Candidate Email</th>
            <th scope="col">Resume</th>
            <th scope="col">Application Status</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${appliedProjects}" var="ef">
            <tr>
                <td>${ef.projectName}</td>
                <td>${ef.companyName}</td>
                <td>${ef.freelancerName}</td>
                <td>${ef.freelancerEmail}</td>
                <td data-label="Resume">
                    <a href="${e.freelancerResume}" download
                       style="color:#146eb4; text-decoration: underline;">
                       Download Resume
                    </a>
                </td>
                <td class="status" data-status="${ef.status}">${ef.status}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</c:if>

<script>
document.addEventListener("DOMContentLoaded", function() {
    let statuses = document.querySelectorAll(".status");
    statuses.forEach(function(status) {
        let text = status.textContent;
        if (text === "Accepted") status.style.color = "#2ecc6c";
        else if (text === "Rejected") status.style.color = "#e74c3c";
        else if (text === "sent") status.style.color = "#3498db";
    });
});
</script>
</body>
</html>
