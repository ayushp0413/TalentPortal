<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View & Apply Job</title>
    <link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon">
    <!-- Add Google Font (optional) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet">
    <style>
        body {
            background: #f4f2f8;
            font-family: 'Inter', 'Segoe UI', Arial, sans-serif;
            margin: 0;
            min-height: 100vh;
        }
        .main-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 30px;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 30px rgba(72, 50, 94, 0.11);
        }
        .job-details-header {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: start;
            margin-bottom: 32px;
        }
        .job-title-group {
            flex: 1 1 350px;
        }
        .job-title-group h1 {
            font-size: 2.5rem;
            color: #692A84;
            margin: 0 0 10px 0;
            font-weight: 700;
            letter-spacing: 2px;
        }
        .job-title-group h3 {
            font-size: 1.15rem;
            margin: 0;
            color: #807096;
            font-weight: 400;
        }
        .info-summary {
            display: flex;
            gap: 18px;
            align-items: start;
            margin-top: 10px;
        }
        .info-box {
            background: #F7F2FF;
            border-left: 6px solid #6f46ab;
            padding: 14px 22px 14px 18px;
            min-width: 120px;
            border-radius: 8px;
            margin-bottom: 8px;
        }
        .info-box h4 {
            margin: 0 0 2px 0;
            color: #6f46ab;
            font-size: 1.04em;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        .info-box p {
            font-size: 1.03em;
            margin: 0;
            color: #3f2b47;
        }

        .apply-btn {
            background: linear-gradient(90deg, #16a085, #16a085 90%);
            color: white;
            font-size: 1.1em;
            font-weight: 600;
            border: none;
            padding: 13px 40px;
            border-radius: 12px;
            box-shadow: 0 0px 10px 0 rgba(130,97,200,0.06);
            cursor: pointer;
            transition: background 0.2s, transform 0.1s;
            margin-left: 28px;
            margin-top: 5px;
        }
        .apply-btn:hover {
            background: linear-gradient(90deg, #8431c9, #16a085 90%);
            transform: scale(1.03);
        }
        skills-badges {
          display: flex;
          flex-wrap: wrap;
          gap: 8px;
          margin-top: 6px;
        }

        .skills-badges .badge {
          background-color: #692A84;
          color: white;
          padding: 5px 12px;
          border-radius: 15px;
          font-size: 0.9rem;
          font-weight: 600;
          display: inline-block;
          white-space: nowrap;
          user-select: none;
        }

        /* Popup "Apply for Job" form */
        .form-popup {
            display: none;
            position: fixed;
            top: 0; left: 0; width: 100vw; height: 100vh;
            background: rgba(76, 52, 97, 0.12);
            z-index: 100;
            align-items: center;
            justify-content: center;
        }
        .form-container {
            width: 100%;
            max-width: 430px;
            background: #fff;
            padding: 30px 42px 20px 28px;
            border-radius: 15px;
            box-shadow: 0 8px 40px rgba(72, 50, 94, 0.15);
            position: relative;
        }
        .form-container h2 {
            color: #692A84;
            margin-bottom: 22px;
            text-align: center;
        }
        .form-container label {
            font-size: 1.05em;
            color: #41185e;
            margin-bottom: 5px;
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
        .form-container .btn {
            width: 49%;
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
            opacity: 0.95;
        }
        .close-icon {
            position: absolute;
            top: 13px; right: 16px;
            font-size: 1.5em;
            color: #b195cf;
            background: none;
            border: none;
            cursor: pointer;
        }

        /* Job Description Section */
        .job-details-body {
            padding: 24px 0 0 0;
            border-top: 1px solid #efe9f7;
            margin-top: 25px;
        }
        .desc-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px 48px;
        }
        .desc-block {
            flex: 1 1 340px;
            margin-bottom: 24px;
        }
        .desc-block h2 {
            font-size: 1.08em;
            color: #692A84;
            margin-bottom: 7px;
            font-weight: 600;
        }
        .desc-block p, .desc-block input {
            font-size: 1.02em;
            color: #3f2b47;
            margin: 0;
            background: none !important;
            border: none !important;
            padding-left: 0 !important;
        }
        .desc-block input[readonly] { color: #3f2b47; }
        /* Responsive */
        @media (max-width: 900px) {
            .main-container { padding: 10vw 1vw; }
        }
        @media (max-width: 700px) {
            .main-container { padding: 5vw 2vw; }
            .job-details-header {
                flex-direction: column;
                gap: 18px;
                align-items: flex-start;
            }
            .apply-btn { margin-left: 0; }
            .info-summary { margin-top: 0; }
            .desc-row { flex-direction: column; gap: 0;}
        }
    </style>
</head>
<body>
    <div class="main-container">

        <!-- Header Section -->
        <div class="job-details-header">
            <div class="job-title-group">
                <h1>${jobData.name}</h1>
                <h3><span style="font-weight: 500;">${jobData.email}</span></h3>
                <div class="info-summary">
                    <div class="info-box">
                        <h4>Salary</h4>
                        <p>$${jobData.salary}</p>
                    </div>
                    <div class="info-box">
                        <h4>Type</h4>
                        <p>${jobData.role}</p>
                    </div>
                </div>
            </div>
            <div>
                <button class="apply-btn" onclick="openForm()">Apply Now</button>
            </div>
        </div>

        <!-- Description & Skills Section -->
        <div class="job-details-body">
            <div class="desc-row">
                <div class="desc-block">
                    <h2>Position</h2>
                    <input type="text" value="${jobData.title}" readonly/>
                </div>
                <div class="desc-block">
                    <h2>Required Skills</h2>
                    <c:if test="${not empty jobData.skills}">
                      <div class="skills-badges">
                        <c:forEach var="skill" items="${fn:split(jobData.skills, ',')}">
                          <span class="badge">${fn:trim(skill)}</span>
                        </c:forEach>
                      </div>
                    </c:if>

                </div>
            </div>
            <div class="desc-block">
                <h2>Job Description</h2>
                <p>${jobData.description}</p>
            </div>
        </div>
    </div>


    <!-- Apply Form Popup -->
    <div class="form-popup" id="applyForm">
        <form id="jobApplicationForm" action="${pageContext.request.contextPath}/applyJob" method="post" enctype="multipart/form-data" class="form-container">
            <button type="button" class="close-icon" onclick="closeForm()">&times;</button>
            <h2>Apply for this Job</h2>

            <label for="companyName">Company Name</label>
            <input type="text" id="companyName" name="companyName" value="${jobData.name}" readonly>
            <label for="companyEmail">Company Email</label>
            <input type="text" name="companyEmail" value="${jobData.email}" readonly>
            <label for="position">Position</label>
            <input type="text" id="position" value="${jobData.title}" name="position" readonly>

                <input type="hidden" id="freelancerName" value="${sessionScope.loggedInFreelancer.name}" name="freelancerName" required>
                <input type="hidden" id="freelancerEmail" value="${sessionScope.loggedInFreelancer.email}" name="freelancerEmail" required>
                <input type="hidden" value="${sessionScope.loggedInFreelancer.id}" name="freelancerId">

            <label for="resume">Resume (PDF)</label>
            <input type="file" id="resume" name="resume" accept=".pdf" required>

            <input type="hidden" name="status" value="sent" readonly>

            <div style="display:flex;justify-content:space-between;">
                <button type="submit" class="btn">Submit</button>
                <button type="button" class="btn cancel" onclick="closeForm()">Cancel</button>
            </div>
        </form>
    </div>

    <script>
        function openForm() {
            document.getElementById("applyForm").style.display = "flex";
        }
        function closeForm() {
            document.getElementById("applyForm").style.display = "none";
        }
        document.getElementById('jobApplicationForm').addEventListener('submit', function(event) {
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
    </script>
</body>
</html>
