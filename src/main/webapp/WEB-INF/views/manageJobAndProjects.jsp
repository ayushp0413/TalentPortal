<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Manage-jobs&project</title>
      <link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      <script src="https://kit.fontawesome.com/afcf20c6bc.js" crossorigin="anonymous"></script>

   </head>
   <body>
      <h1 class="heading" style="text-align:center; padding:20px;">History and Activities &nbsp;<i class="fa-solid fa-circle-check" style="font-size:20px;"></i></h1>
      <hr style="border: 5px solid #fff;">
      <br>
      <br>
      <br>
      <c:if test="${not empty errMsg}">
         <span class="alert alert-warning" role="alert" style="margin-left:2rem; text-align:center; font-size:1rem; color:red; background-color:white; padding:10px; border-radius:5px;">
         <i class="fa-solid fa-circle-xmark"></i> ${errMsg}
         </span>
      </c:if>
       <c:if test="${not empty succMsg}">
               <span class="alert alert-warning" role="alert" style="margin-left:2rem; text-align:center; font-size:1rem; color:red; background-color:white; padding:10px; border-radius:5px;">
               <i class="fa-solid fa-circle-xmark"></i> ${succMsg}
               </span>
            </c:if>
      <h2 class="title">Manage Jobs on Projectplus &nbsp; <i class="fa-solid fa-user-check"></i></h2>
      <c:if test="${not empty jobMsg}">
         <span class="alert alert-warning" role="alert" style="margin-left:2rem; text-align:center; font-size:1rem; color:red; background-color:white; padding:10px; border-radius:5px;">
         <i class="fa-solid fa-circle-xmark"></i> ${jobMsg}
         </span>
      </c:if>
      <table>
         <thead>
            <tr>
               <th scope="col">Job Tittle</th>
               <th scope="col">Reqired Skills</th>
               <th scope="col">Type</th>
               <th scope="col">Salary</th>
               <th scope="col">Company Name</th>
               <th scope="col">Company Email</th>
               <th scope="col">Actions &nbsp;<i class="fa-solid fa-list-check"></i></th>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${jobPosts}" var="e">
               <tr>
                  <td data-label="Farmer Name">${e.title}</td>
                  <td data-label="Product">${e.skills}</td>
                  <td data-label="Type">${e.role}</td>
                  <td data-label="Price">${e.salary}</td>
                  <td data-label="Date">${e.name}</td>
                  <td data-label="Date">${e.email}</td>
                  <td class="actions-cell" data-label="Date">
                     <a href="/TalentPortal/editJobPost/${e.id}" class="action-link edit-link">
                     Edit &nbsp;<i class="fa-regular fa-pen-to-square"></i>
                     </a>
                     <a href="#"
                        class="action-link remove-link"
                        data-bs-toggle="modal"
                        data-bs-target="#confirmModal"
                        data-type="job"
                        data-id="${e.id}">
                        Remove &nbsp;<i class="fa-solid fa-user-xmark"></i>
                     </a>

                  </td>
               </tr>
            </c:forEach>
         </tbody>
      </table>

      <!-- Model for confirmation -->
      <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="confirmModalLabel">Confirm Removal</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="confirmModalBody">
              Are you sure you want to remove this item?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
              <a href="#" id="confirmDeleteBtn" class="btn btn-danger">Yes, Remove</a>
            </div>
          </div>
        </div>
      </div>



      <br>
      <br>
      <h2 class="title">Manage Project on Projectplus &nbsp;<i class="fa-solid fa-briefcase"></i></h2>
      <c:if test="${not empty projectMsg}">
         <span class="alert alert-warning" role="alert" style="margin-left:2rem; text-align:center; font-size:1rem; color:red; background-color:white; padding:10px; border-radius:5px;">
         <i class="fa-solid fa-circle-xmark"></i> ${projectMsg}
         </span>
      </c:if>
      <table>
         <thead>
            <tr>
               <th scope="col">Project Tittle</th>
               <th scope="col">Project Budget</th>
               <th scope="col" class="header-spacing">Reqired Skills</th>
               <th scope="col">Company Name</th>
               <th scope="col">Company Email</th>
               <th scope="col">Documentation</th>
               <th scope="col">Manage &nbsp;<i class="fa-solid fa-list-check"></i></th>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${projectPosts}" var="ef">
               <tr>
                  <td data-label="Farmer Name">${ef.projectTitle}</td>
                  <td data-label="Product">${ef.projectBudget}</td>
                  <td data-label="Type">${ef.projectSkills}</td>
                  <td data-label="Date">${ef.companyName}</td>
                  <td data-label="Date">${ef.companyEmail}</td>
                  <td data-label="Resume">
                     <a href="${pageContext.request.contextPath}/files/serverImgs/${ef.projectPdf}" class="download-button" download="Talent Portal Resume.PDF" style="background-color:#457b9d;padding:5px; color:#fff;">
                     Download Resume <i class="fa-solid fa-file-arrow-down"></i>
                     </a>
                  </td>
                  <td class="actions-cell" data-label="Date">
                     <!--
                        <a href="editProject/${ef.id}" class="action-link edit-link">
                          Edit &nbsp;<i class="fa-regular fa-pen-to-square"></i>
                        </a>
                        -->
                     <a href="#"
                        class="action-link remove-link"
                        data-bs-toggle="modal"
                        data-bs-target="#confirmModal"
                        data-type="project"
                        data-id="${ef.id}">
                        Remove &nbsp;<i class="fa-solid fa-user-xmark"></i>
                     </a>
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
         .heading{
         margin-top:1rem;
         text-align: center;
         background: linear-gradient(90deg, #6A1FC5 60%, #6A1FC5 100%);
         width:100vw;
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
         .actions-cell {
         display: flex;
         gap: 12px;
         align-items: center;
         }
         .action-link {
         display: inline-flex;
         align-items: center;
         padding: 6px 14px;
         border-radius: 4px;
         text-decoration: none;
         font-weight: 500;
         transition: background 0.2s, color 0.2s;
         }
         .edit-link {
         background: #e0f7fa;
         color: #00796b;
         border: 1px solid #4dd0e1;
         }
         .edit-link:hover {
         background: #b2ebf2;
         color: #004d40;
         }
         .remove-link {
         background: #ffebee;
         color: #c62828;
         border: 1px solid #ef9a9a;
         }
         .remove-link:hover {
         background: #ffcdd2;
         color: #b71c1c;
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
         /* Resume Download Button */
         a.download-button {
         display: inline-block;
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
     <script>
       document.getElementById('confirmModal').addEventListener('show.bs.modal', function (event) {
         var triggerLink = event.relatedTarget; // Link that triggered the modal
         var type = triggerLink.getAttribute('data-type'); // "job" or "project"
         var id = triggerLink.getAttribute('data-id');
         var confirmBtn = document.getElementById('confirmDeleteBtn');
         var modalBody = document.getElementById('confirmModalBody');

         if(type === 'job') {
           modalBody.textContent = "Are you sure you want to remove this job?";
           confirmBtn.setAttribute('href', '/TalentPortal/deleteJobPost/' + id);
         } else if(type === 'project') {
           modalBody.textContent = "Are you sure you want to remove this project?";
           confirmBtn.setAttribute('href', '/TalentPortal/deleteProjectPost/' + id);
         } else {
           // fallback text and link
           modalBody.textContent = "Are you sure you want to remove this item?";
           confirmBtn.setAttribute('href', '#');
         }
       });
     </script>


   </body>
</html>