<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ page isELIgnored = "false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <!-- Basic -->
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <!-- Mobile Metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <!-- Site Metas -->
      <link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon">
      <title>Home</title>
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
                              <h1>You Can <br> Hire Freelancer <br> Here</h1>
                              <p class="fst-italic">Welcome <%= company.getName() %></p>

                                <c:if test="${not empty succMsg}">
                                    <p class="text-success">${succMsg}</p>
                                </c:if>
                                 <c:if test="${not empty errMsg}">
                                    <p class="text-success">${errMsg}</p>
                                </c:if>

                              <div class="btn-box">
                                 <a href="showpostjob" class="btn-1">
                                    Post Job <i class="fa-solid fa-angles-right"></i>
                                 </a>
                                 <a href="showpostproject" class="btn-2">
                                    Post Project  <i class="fa-solid fa-briefcase"></i>
                                 </a>
                              </div>
                           </div>
                        </div>
                        <div class="offset-md-1 col-md-4 img-container">
                           <div class="img-box">
                              <img src="./files/images/slider-img.png" alt="">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item ">
                  <div class="container-fluid">
                     <div class="row">
                        <div class="col-md-5 offset-md-1">
                           <div class="detail-box">
                              <h1>You Can <br> Hire Freelancer <br> Here</h1>
                              <p class="text-italic">Welcome <%= company.getName() %></p>

                                <c:if test="${not empty succMsg}">
                                    <p class="text-success">${succMsg}</p>
                                </c:if>
                                 <c:if test="${not empty errMsg}">
                                    <p class="text-success">${errMsg}</p>
                                </c:if>


                              <div class="btn-box">
                                 <a href="showpostjob" class="btn-1">
                                 Post Job <i class="fa-solid fa-angles-right"></i>
                                 </a>
                                 <a href="showpostproject" class="btn-2">
                                 Post Project  <i class="fa-solid fa-briefcase"></i>
                                 </a>
                              </div>
                           </div>
                        </div>
                        <div class="offset-md-1 col-md-4 img-container">
                           <div class="img-box">
                              <img src="./files/images/slider-img.png" alt="">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item ">
                  <div class="container-fluid">
                     <div class="row">
                        <div class="col-md-5 offset-md-1">
                           <div class="detail-box">
                              <h1>
                                 You Can <br>
                                 Hire Freelancer <br>
                                 Here
                              </h1>
                              <p class="text-italic">Welcome <%= company.getName() %></p>

                                <c:if test="${not empty succMsg}">
                                    <p class="text-success">${succMsg}</p>
                                </c:if>
                                 <c:if test="${not empty errMsg}">
                                    <p class="text-success">${errMsg}</p>
                                </c:if>

                              <div class="btn-box">
                                 <a href="showpostjob" class="btn-1">
                                 Post Job  <i class="fa-solid fa-angles-right"></i>
                                 </a>
                                 <a href="showpostproject" class="btn-2">
                                 Post Project <i class="fa-solid fa-briefcase"></i>
                                 </a>
                              </div>
                           </div>
                        </div>
                        <div class="offset-md-1 col-md-4 img-container">
                           <div class="img-box">
                              <img src="./files/images/slider-img.png" alt="">
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

       <%@ include file="templateSection.jsp" %>




      <!-- category section -->

      <div class="content">
         <c:forEach items="${freelancerdta}"  var="e">
            <div class="card-box">
               <div class="text-center">
                  <div class="thumb-lg member-thumb mx-auto">
                     <img src="./files/webimages/${e.fpfile}" class="rounded-circle img-thumbnail" alt="profile-image">
                  </div>
                  <input type="hidden" value="${e.id}">
                  <div>
                     <h4>${e.fname}</h4>
                     <h6>${e.femail}</h6>
                     <p class="text-muted">Skills<span><i class="fa-brands fa-nutritionix"></i><br> </span><span><a href="#" class="text-pink">${e.skills}</a></span></p>
                  </div>
                  <a href="${e.flinkedin}" title="LinkedIn" class="btn btn-linkedin btn-lg" style="background-color:#3a86ff;""><i class="fa fa-linkedin fa-fw"></i> LinkedIn</a>
                  <br>
                  <div class="mt-4">
                     <div class="row">
                        <div class="col-4">
                           <div class="mt-3">
                              <h5>${e.fcharge} <i class="fa-solid fa-coins"></i></h5>
                              <p class="mb-0 text-muted">Per Month Charge</p>
                           </div>
                        </div>
                        <div class="col-4">
                           <div class="mt-3">
                              <h5>${e.feducation}<i class="fa-brands fa-google-scholar"></i></h5>
                              <p class="mb-0 text-muted">Education</p>
                           </div>
                        </div>
                        <div class="col-4">
                           <div class="mt-3">
                              <h5>${e.fdate}</h5>
                              <p class="mb-0 text-muted">Date of Birth</p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>

      <style>
         body {
         background: white;
         }
         .content {
         display: flex;
         flex-wrap: wrap;
         justify-content: space-around;
         }
         .card-box {
         flex: 0 0 30%; /* Adjust the width as needed */
         margin: 10px;
         padding: 20px;
         border-radius: 3px;
         background-color: #97dffc;
         border-radius:30px;
         }
         .social-links li a {
         border-radius: 50%;
         color: rgba(121, 121, 121, .8);
         display: inline-block;
         height: 30px;
         line-height: 27px;
         border: 2px solid rgba(121, 121, 121, .5);
         text-align: center;
         width: 30px
         }
         .social-links li a:hover {
         color: #797979;
         border: 2px solid #797979
         }
         .thumb-lg {
         height: 88px;
         width: 88px;
         }
         .img-thumbnail {
         padding: .25rem;
         background-color: #fff;
         border: 1px solid #dee2e6;
         border-radius: .25rem;
         max-width: 100%;
         height: auto;
         }
         .text-pink {
         color: #ff679b!important;
         }
         .btn-rounded {
         border-radius: 2em;
         }
         .text-muted {
         color: #98a6ad!important;
         }
         h4 {
         line-height: 22px;
         font-size: 18px;
         }
         body {
         background: lighten(#0E76A8,45%);
         }
         .btn-linkedin {
         background: #0E76A8;
         border-radius: 0;
         color: #fff;
         border-width: 1px;
         border-style: solid;
         border-color: #084461;
         }
         .btn-linkedin:link, .btn-linkedin:visited {
         color: #fff;
         }
         .btn-linkedin:active, .btn-linkedin:hover {
         background: #084461;
         color: #fff;
         }


body, h1, p, a {
  font-family: 'Poppins', sans-serif;
  margin: 0;
  padding: 0;
}

.header_section {
  background: transparent;
  padding: 1rem 2rem;
  position: absolute;
  width: 100%;
  z-index: 1000;
}

.logo-text {
  color: #060270 !important; /* if used */
}

.navbar-nav .nav-link {
  color: white;
  font-weight: 600;
  margin: 0 15px;
  transition: color 0.3s ease;
}

.navbar-nav .nav-link:hover {
  color: #00bfa5;
  border-bottom: 2px solid #9A3AB7;
  transition: all 0.5s ease;
}

.custom_nav-container .navbar-toggler {
  border: none;
  outline: none;
  color: white;
}

.user_option a span {
  color: white;
  font-weight: 600;
  border: 2px solid white;
  padding: 8px 15px;
  border-radius: 30px;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.user_option a span:hover {
  background-color: #00bfa5;
  color: white;
  border-color: #00bfa5;
}

.slider_section {
  position: relative;
  background: linear-gradient(90deg, rgba(0,191,165,0.8) 0%, rgba(0,165,188,0.8) 100%), url('./files/images/slider-bg.jpg') center center / cover no-repeat;
  padding: 6rem 0;
  color: white;
}

.carousel-indicators li {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: transparent;
  border: 2px solid white;
  color: white;
  font-weight: 700;
  opacity: 1;
  transition: background-color 0.3s ease;
  text-align: center;
  line-height: 36px;
}

.carousel-indicators .active {
  background-color: #00bfa5;
  border-color: #00bfa5;
  color: white;
}


/* Hero Text */
.detail-box h1 {
  font-size: 2.5rem;
  line-height: 1.2;
  font-weight: 700;
  margin-bottom: 1rem;
}

.detail-box p,
.subtitle {
  font-size: 1.2rem;
  margin-bottom: 2rem;
  color: #04023D !important; /* Muted light gray subtitle */
  opacity: 0.9;
}

/* Buttons */
.btn-box {
  display: flex;
  gap: 1rem;
}

.btn-box a.btn-1 {
  background-color: #00bfa5;
  color: white;
  border-radius: 50px;
  padding: 12px 25px;
  font-weight: 600;
  margin-right: 1rem;
  transition: background-color 0.3s ease;
  display: inline-flex;
  align-items: center;
}

.btn-box a.btn-1:hover {
  background-color: #008e75;
  color: #EF4747;
  text-decoration: none;
}

.btn-box a.btn-2 {
  background: transparent;
  color: white;
  border: 2px solid white;
  border-radius: 50px;
  padding: 12px 25px;
  font-weight: 600;
  display: inline-flex;
  align-items: center;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.btn-box a.btn-2:hover {
  background-color: white;
      color: #00bfa5;
  text-decoration: none;
}

/* Image styles */
.img-box img {
  max-width: 100%;
  transition: transform 0.6s ease;
  border-radius: 5px;
}

.img-box img:hover {
  transform: scale(1.05);
}

/* Responsive */
@media (max-width: 768px) {
  .detail-box h1 {
    font-size: 1.8rem;
  }
  .btn-box {
    flex-direction: column;
    gap: 0.8rem;
  }
  .btn-box a {
    width: 100%;
    text-align: center;
  }
  .img-container {
    margin-top: 2rem;
  }
}

      </style>

      <%@ include file="footerfile.jsp" %>
      <!-- Footer Section end -->
   </body>
   </body>
</html>