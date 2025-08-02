<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="ISO-8859-1">
   <title>view-apply project</title>
   <link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon">
   <script src="https://kit.fontawesome.com/afcf20c6bc.js" crossorigin="anonymous"></script>

   <style>
            .pdf {
            width: 100%;
            aspect-ratio: 4 / 3;
            }
            .pdf,
            html,
            body {
            height: 100%;
            margin: 0;
            padding: 0;
            }
            body {
                background: #f4f2f8;
                font-family: 'Inter', 'Segoe UI', Arial, sans-serif;
                margin: 0;
                min-height: 100vh;
            }
            .container {
                max-width: 1080px;
                margin: 44px auto;
                background: #fff;
                border-radius: 16px;
                box-shadow: 0 4px 30px rgba(72, 50, 94, 0.11);
                display: flex;
                gap: 32px;
                padding: 35px 30px;
                align-items: flex-start;
                flex-wrap: wrap;
            }
            .job-details {
                flex: 1 1 56%;
                min-width: 350px;
                background: none;
                box-shadow: none;
                padding: 0;
            }
            .job-details h1 {
                font-size: 2.1rem;
                color: #692A84;
                font-weight: 700;
                letter-spacing: 1.5px;
                margin: 0 0 10px 0;
            }
            .job-details h3 {
                font-size: 1rem;
                color: #807096;
                margin: 0 0 24px 0;
                font-weight: 400;
            }
            .job-details p {
                font-size: 1.02rem;
                color: #3f2b47;
                background: #f6f3f9;
                border-radius: 10px;
                padding: 18px 18px 18px 20px;
                margin-bottom: 0;
            }
            .info-boxes {
                flex: 1 1 260px;
                min-width: 250px;
                display: flex;
                flex-direction: column;
                align-items: stretch;
                gap: 18px;
            }
            .info-box {
                background: #F7F2FF;
                border-left: 6px solid #6f46ab;
                padding: 18px 18px 12px 16px;
                border-radius: 12px;
                box-shadow: 0 3px 13px rgba(130,97,200,0.07);
                margin-bottom: 0;
                text-align: left;
                position: relative;
            }
            .info-box h3 {
                font-size: 1.02rem;
                color: #6f46ab;
                margin: 0 0 4px 0;
                display: flex;
                align-items: center;
                gap: 9px;
                font-weight: 600;
            }
            .info-box p {
                font-size: 1.1rem;
                color: #26212d;
                margin: 0;
                letter-spacing: 0.7px;
            }
            .pdf {
                width: 100%;
                aspect-ratio: 4 / 3;
                border: 1.5px solid #eee;
                border-radius: 10px;
                box-shadow: 0 3px 15px rgba(72, 50, 94, 0.08);
            }
            .apply-button {
                background: linear-gradient(90deg, #16a085, #16a085 90%);
                color: #fff;
                border: none;
                padding: 13px 0;
                font-size: 1.1em;
                border-radius: 10px;
                font-weight: 600;
                margin-top: 16px;
                cursor: pointer;
                letter-spacing: 1px;
                transition: background .2s, transform .09s;
                box-shadow: 0 4px 8px rgba(54, 30, 106, 0.06);
                width: 100%;
            }
            .apply-button:hover {
                background: linear-gradient(90deg, #8431c9, #16a085 90%);
                transform: scale(1.03);
            }
            .form-popup {
                display: none;
                position: fixed;
                top: 0; left: 0; width: 100vw; height: 100vh;
                background: rgba(76, 52, 97, 0.13);
                z-index: 100;
                align-items: center;
                justify-content: center;
            }
            .form-container {
                width: 100%;
                max-width: 430px;
                background: #fff;
                padding: 30px 42px 18px 28px;
                border-radius: 15px;
                box-shadow: 0 8px 40px rgba(72, 50, 94, 0.13);
                position: relative;
            }
            .form-container h2 {
                color: #692A84;
                margin-bottom: 22px;
                text-align: center;
            }
            .form-container label {
                font-size: 1em;
                color: #41185e;
                margin-bottom: 3px;
                display: block;
                font-weight: 600;
            }
            .form-container input[type="text"],
            .form-container input[type="email"],
            .form-container input[type="file"] {
                width: 100%;
                padding: 10px 13px;
                margin: 7px 0 12px 0;
                background: #faf8fd;
                border: 1px solid #dad2e6;
                border-radius: 5px;
                font-size: 1.08em;
            }
            .form-container input[readonly] {
                background: #f3edfa;
                color: #8c73a7;
                font-weight: 500;
            }
            .form-container .btn {
                width: 46%;
                padding: 11px 0;
                background: linear-gradient(90deg,#8431c9,#8431c9 90%);
                color: #fff;
                border: none;
                border-radius: 8px;
                font-size: 1.1em;
                font-weight: 600;
                cursor: pointer;
                margin-right: 1%;
                margin-top: 8px;
                transition: background 0.2s, opacity 0.09s;
            }
            .form-container .btn.cancel {
                background: #d6414d;
            }
            .form-container .btn:hover {
                opacity: 0.97;
            }
            .be-comment-block {
                max-width: 1080px;
                margin: 40px auto 0 auto;
                background: #ffffff;
                border-radius: 16px;
                padding: 26px 32px 20px 32px;
                box-shadow: 0 2px 20px rgba(101, 65, 132, 0.09);
            }
            .form-group .form-input, .form-group input.form-input {
                font-size: 1.07em;
                font-weight: 400;
                color: #492f67;
                width: 100%;
                height: 46px;
                padding-left: 12px;
                border: 1px solid #e4d7fa;
                border-radius: 5px;
                background: #faf8fd;
                margin-bottom: 8px;
            }
            .form-group .form-input[readonly] {
                color: #766e8b;
                background: #eee6fc;
            }
            @media (max-width: 900px) {
                .container {
                    flex-direction: column;
                    padding: 8vw 5vw;
                    gap: 24px;
                }
                .be-comment-block {
                    padding: 18px 6vw 20px 6vw;
                }
            }
            @media (max-width: 600px) {
                .container {
                    padding: 3vw 2vw;
                }
                .be-comment-block {
                    padding: 11px 4vw 16px 4vw;
                }
                .job-details h1 { font-size: 1.25rem; }
            }
         </style>

</head>
<body>
   <div class="container">
      <div class="job-details">
         <h1>${projectData.projectTitle}</h1>
         <h3>Email: ${projectData.companyEmail}</h3>
         <p style="font-size:18px;">${projectData.projectDescription}</p>

         <!-- New: Add a section to highlight skills required -->
         <section style="margin-top: 24px; background: #f4f0fb; padding: 15px 18px; border-radius: 10px;">
            <h3 style="color:#6f46ab; margin-bottom:10px;"><i class="fa-solid fa-list-check"></i> Required Skills</h3>
            <p style="font-size: 1rem; color: #3f2b47; margin:0;">${projectData.projectSkills}</p>
         </section>
      </div>

      <div class="info-boxes">
         <div class="info-box" id="salary-box">
            <h3>Development Costs</h3>
            <p><span class="fw-bold">$</span> ${projectData.projectBudget}</p>
         </div>

        <object data="./files/serverImgs/${projectData.projectPdf}" type="application/pdf" width="100%" height="600" class="pdf">
          <p style="padding:10px">
            Your browser does not support embedded PDFs.<br>
            <a href="../files/serverImgs/${projectData.projectPdf}" download>Download the PDF</a> instead.
          </p>
        </object>


         <button class="apply-button" onclick="openForm()">Apply Now</button>
      </div>
   </div>

   <div class="be-comment-block" style="max-width: 1080px; margin: 40px auto; background: #f7f3fc; border-radius: 16px; padding: 26px 32px;">
      <h2 style="color:#692A84; margin-bottom: 20px; text-align: center;">About ${projectData.companyName}</h2>
      <p style="font-size: 1.1rem; color: #3f2b47; line-height: 1.6;">
         ${projectData.companyName} is a renowned organization committed to innovation and excellence. For inquiries, reach us at <a href="mailto:${projectData.companyEmail}" style="color:#8431c9;">${projectData.companyEmail}</a>.
      </p>
   </div>

   <!-- Apply Form (unchanged except minor alignment) -->
   <div class="form-popup" id="applyForm">
      <form id="projectApplicationForm" action="${pageContext.request.contextPath}/applyProject" method="post" enctype="multipart/form-data" class="form-container">
         <h2>Job Application</h2>

         <label for="projectName"><b>Project Name</b></label>
         <input type="text" id="projectName" placeholder="Enter Project Name" name="projectName" value="${projectData.projectTitle}" required readonly>

         <label for="companyName"><b>Project Organization</b></label>
         <input type="text" id="companyName" placeholder="Enter Project Organization" name="companyName" value="${projectData.companyName}" required readonly>

         <label for="companyEmail"><b>Project Organization Email</b></label>
         <input type="email" id="companyEmail" placeholder="Enter Project Organization Email" name="companyEmail" value="${projectData.companyEmail}" required readonly>

            <input type="hidden" id="freelancerName" placeholder="Enter Candidate Name" name="freelancerName" value="${sessionScope.loggedInFreelancer.name}" required>
            <input type="hidden" id="freelancerEmail" placeholder="Enter Candidate Email" name="freelancerEmail" value="${sessionScope.loggedInFreelancer.email}" required>
            <input type="hidden" name="freelancerId" value="${sessionScope.loggedInFreelancer.id}">

         <label for="resume"><b>Resume</b></label>
         <input type="file" id="resume" name="resume" accept=".pdf" required>

         <input type="hidden" name="status" value="sent">

         <button type="submit" class="btn">Submit</button>
         <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
      </form>
   </div>

   <!-- Existing scripts unchanged -->
   <script>
      document.getElementById('projectApplicationForm').addEventListener('submit', function(event) {
          var form = event.target;
          var candidateName = form.elements['freelancerName'].value.trim();
          var candidateEmail = form.elements['freelancerEmail'].value.trim();
          var resume = form.elements['resume'].value.trim();

          if (candidateName === "") {
              alert('Candidate name cannot be empty.');
              event.preventDefault();
              return;
          }

          if (candidateEmail === "" || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(candidateEmail)) {
              alert('Please enter a valid email address.');
              event.preventDefault();
              return;
          }

          if (resume === "") {
              alert('Please upload your resume in PDF format.');
              event.preventDefault();
              return;
          }
      });

      function openForm() {
          document.getElementById("applyForm").style.display = "flex";
      }

      function closeForm() {
          document.getElementById("applyForm").style.display = "none";
      }
   </script>

   <!-- Other unchanged page content and styles -->

</body>
</html>