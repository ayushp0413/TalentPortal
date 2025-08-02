<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.yash.talent.portal.model.Company" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Welcome</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="./files/css/bootstrap.css" />

  <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="./files/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="./files/css/responsive.css" rel="stylesheet" />
  
    <link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon">
  
   <script src="https://kit.fontawesome.com/afcf20c6bc.js" crossorigin="anonymous"></script>
</head>
<body>

   <%
      Company company = (Company) session.getAttribute("loggedInCompany");
      String companyName = (String) company.getName();
   %>


   <div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container mt-1">

          <!-- Profile Section -->
          <a class="navbar-brand" href="profileCompany" style="color:#fff;">
            <div class="d-flex align-items-center">
                <div style="width: 60px; height: 60px; border-radius: 50%; border: 2px solid white; overflow: hidden; margin-right: 10px;">
                  <img class="profilecimage"
                       alt="profile"
                       src="${pageContext.request.contextPath}/files/serverImgs/${sessionScope.loggedInCompany.profile}"
                       style="width: 100%; height: 100%; object-fit: cover; object-position: center; display: block;">
                </div>
            <span style="margin-left: 10px; font-weight: bold;"> <%= company.getName() %></span>
            </div>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  ">
              <li class="nav-item active">
                <a class="nav-link" href="homeCompany"><i class="fa-solid fa-house"></i> &nbsp;Home</a>
              </li>
              
              <li class="nav-item active">
                <a class="nav-link" href="viewAllFreelancers"><i class="fa-solid fa-users"></i>&nbsp;Hire</a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="applications/${company.getEmail()}"><i class="fa-solid fa-paper-plane"></i>&nbsp;Candidates Applications</a>
              </li>

               <li class="nav-item">
                  <a class="nav-link" href="/TalentPortal/manageJobAndProjects/${company.getEmail()}"><i class="fa-solid fa-users"></i>&nbsp;Manage Job & Projects</a>
               </li>

            </ul>

            <div class="user_option">
              <a href="logoutCompany">
                <i class="fa-solid fa-power-off"></i> &nbsp;Logout
              </a>
            </div>

          </div>
          
          <div>
            <div class="custom_menu-btn ">
              <button>
                <span class=" s-1">

                </span>
                <span class="s-2">

                </span>
                <span class="s-3">

                </span>
              </button>
            </div>
          </div>

        </nav>
      </div>
      </header>
   
    <!-- end header section -->

</body>
</html>