<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>View Freelancers</title>

  <link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon" />
  <script src="https://kit.fontawesome.com/afcf20c6bc.js" crossorigin="anonymous"></script>

  <!-- Bootstrap 5 CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

  <!-- Google Fonts: Poppins -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

  <style>
    body {
      background: linear-gradient(90deg, #834bff 50%, #834bff 50%);
      font-family: 'Poppins', sans-serif;
      min-height: 100vh;
      margin: 0;
      color: #222;
    }

    .page-title {
      color: #fff;
      font-weight: 600;
      margin-bottom: 40px;
      padding:0.656rem;
      text-align: center;
      margin-top:3rem;
      background: linear-gradient(90deg, #17c3b2 50%, #834bff 100%);
      text-shadow: 0 1px 3px rgba(0,0,0,.3);
    }

    .container
    {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        margin-bottom:3rem;
    }

    .card {
      border-radius: 20px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
      background-color: #f0faff;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      overflow: hidden;
      border: none;
      margin-top:-20px;
      padding:10px 7px !important;
    }

    .card:hover {
      transform: translateY(-8px);
      box-shadow: 0 16px 30px rgba(0, 0, 0, 0.3);
    }

    .profile-picture {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      border: 4px solid #3a86ff;
      object-fit: cover;
      object-position: center;
      margin: 0 auto 15px auto;
      display: block;
      background-color: white;
      box-shadow: 0 3px 8px rgba(58, 134, 255, 0.4);
    }

    .card-body {
      padding: 1.5rem 1.75rem 2rem;
      text-align: center;
    }

    .card-title {
      font-size: 1.25rem;
      font-weight: 600;
      margin-bottom: 6px;
      color: #1a1a1a;
    }

    .card-subtitle {
      color: #6c757d;
      font-size: 0.9rem;
      margin-bottom: 15px;
      word-break: break-word;
    }

    .skills {
        margin-top: 15px;
      margin-bottom: 15px;
      font-size: 0.9rem;
      color: #3a86ff;
      font-weight: 600;
    }

    .skills i {
      color: #ff679b;
      margin-left: 8px;
    }

    .btn-linkedin {
      display: inline-block;
      background-color: #3a86ff;
      color: white;
      padding: 10px 20px;
      border-radius: 30px;
      font-weight: 600;
      font-size: 0.9rem;
      text-decoration: none;
      transition: background 0.3s ease;
      box-shadow: 0 3px 8px rgba(58, 134, 255, 0.4);
      margin-bottom: 20px;
    }

    .btn-linkedin:hover,
    .btn-linkedin:focus {
      background-color: #2653b3;
      box-shadow: 0 4px 14px rgba(38, 83, 179, 0.7);
      color: white;
      outline: none;
      text-decoration: none;
    }

    .info-grid {
      display: flex;
      flex-direction: row;
      justify-content: space-around;
      gap: 15px;
      font-size: 0.9rem;
      color: #6c757d;
    }

    .info-item {
      flex: 1;
      background: white;
      border-radius: 15px;
      padding: 12px 10px;
      box-shadow: 0 3px 8px rgba(0, 0, 0, 0.05);
      color: #333;
      transition: background 0.3s ease;
    }

    .info-item:hover {
      background: #e8f0fe;
      color: #3a86ff;
    }

    .info-item h5 {
      font-weight: 700;
      margin-bottom: 4px;
      color: #3a86ff;
    }

    /* Responsive */
    @media (max-width: 1024px) {
      .card {
        margin-bottom: 25px;
      }
    }

    @media (max-width: 768px) {
      .content .row > div {
        flex: 0 0 48% !important;
        max-width: 48% !important;
        margin-bottom: 25px;
      }
    }

    @media (max-width: 480px) {
      .content .row > div {
        flex: 0 0 100% !important;
        max-width: 100% !important;
      }
    }
  </style>
</head>
<body>

  <h3 class="page-title">
    Contact <i class="fa fa-arrow-down" aria-hidden="true"></i> Any Freelancer According to Your Requirement
  </h3>

  <div class="container content">
    <div class="row justify-content-center">
      <c:forEach items="${freelancers}"  var="e">
        <div class="card-container col-lg-4 col-md-6 col-sm-12 d-flex">
          <div class="card w-100">
            <img
              alt="Profile Picture of ${e.name}"
              src="./files/serverImgs/${e.profile}"
              class="profile-picture"
              loading="lazy" />

            <div class="card-body">
              <h4 class="card-title">${e.name}</h4>
              <h6 class="card-subtitle">${e.email}</h6>
              <p class="skills">Skills <i class="fa-brands fa-nutritionix"></i>: ${e.skills}</p>

              <a href="${e.linkedin}" target="_blank" rel="noopener noreferrer"
                 class="btn-linkedin" aria-label="LinkedIn Profile of ${e.name}">
                <i class="fa fa-linkedin fa-fw"></i> LinkedIn
              </a>

              <div class="info-grid" aria-label="Details about ${e.name}">
                <div class="info-item" title="Monthly Charge">
                  <h5>${e.charge} <i class="fa-solid fa-coins"></i></h5>
                  Per Month Charge
                </div>
                <div class="info-item" title="Education">
                  <h5>${e.education} <i class="fa-brands fa-google-scholar"></i></h5>
                  Education
                </div>
                <div class="info-item" title="Date of Birth">
                  <h5>${e.dob}</h5>
                  Date of Birth
                </div>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>

  <!-- Footer section Start -->
  <%@ include file="footerfile.jsp" %>
  <!-- Footer Section end -->

  <!-- Bootstrap 5 JS Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
