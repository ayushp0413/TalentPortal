<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored = "false" %>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
 

  <title>Message-page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon">
  <link rel="stylesheet" type="text/css" href="./files/css/bootstrap.css" />

  <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="./files/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="./files/css/responsive.css" rel="stylesheet" />
  
   <script src="https://kit.fontawesome.com/afcf20c6bc.js" crossorigin="anonymous"></script>

 
</head>

<body>
     <%@ include file="headerfile.jsp" %>
    <!-- slider section -->
    <section class="slider_section ">
      <div class="carousel_btn-container">
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="sr-only">Next</span>
        </a>
      </div>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active">01</li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1">02</li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2">03</li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-5 offset-md-1">
                  <div class="detail-box">
                    <h2 style="color:yellow;">${succMsg}</h2>
                    <h2 style="color:red;">${errMsg}</h2>

                      <div class="d-flex justify-content-center gap-3 my-4 flex-wrap">
                          <a href="homeCompany"
                             class="btn btn-lg btn-primary d-flex align-items-center px-4 py-2 rounded-pill shadow-sm fw-semibold"
                             style="background: linear-gradient(90deg,#27b5d7 60%,#3ace84 100%); border: none;">
                              Home&nbsp;<i class="fa-solid fa-house ms-1"></i>
                          </a>
                          <a href="/TalentPortal/applications/${company.email}"
                             class="btn btn-lg btn-info d-flex align-items-center px-4 py-2 rounded-pill shadow-sm fw-semibold"
                             style="background: linear-gradient(90deg, #1865ab 66%, #035169 98%); color:#fff; border:none;">
                              <i class="fa-solid fa-paper-plane me-2"></i> Candidates Applications
                          </a>
                      </div>


                  </div>
                </div>
                
                <div class="offset-md-1 col-md-4 img-container">
                  <div class="img-box">
                    <img src="./files/images/message.png" alt="">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </section>
    <!-- end slider section -->
  </div>



</body>
</html>

  