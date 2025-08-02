<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored = "false" %>
<html>
   <head>
      <!-- Basic -->
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <!-- Mobile Metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <!-- Site Metas -->
      <title>explore-jobs</title>
      <link rel="shortcut icon" href="./files/images/favicon-32x32.png" type="image/x-icon">
   </head>
   <body>
      <%@ include file="headerfilefreelancer.jsp" %>
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
                              <h1>
                                 Explore Your <br>
                                 Suitable Job<br>
                                 Options
                              </h1>
                              <c:if test="${not empty succMsg}" >
                                  <h2 style="color:yellow;">${succMsg}</h2>
                              </c:if>
                              <c:if test="${not empty errMsg}" >
                                <h2 style="color:red;">${errMsg}</h2>
                              </c:if>
                              <div class="btn-box">
                                 <a href="homeFreelancer" class="btn-1">
                                 Home &nbsp; <i class="fa-solid fa-house"></i>
                                 </a>
                              </div>
                           </div>
                        </div>
                        <div class="offset-md-1 col-md-4 img-container">
                           <div class="img-box">
                              <img src="./files/images/pngegg.png" alt="">
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

      <div class="mt-4 mb-4"></div>


      <!-- Company Info section -->
      <div class="container">
      <h1 class"text-center mt-3"> Explore Featured Jobs </h1>
         <div class="row boxed-portfolio">

<!-- Project Cards -->
<c:forEach items="${jobdata}" var="jd">
    <div class="col-12 col-sm-6 col-md-4    mt-4  mb-5">
        <div class="custom-job-card h-100 p-4">

            <div class="job-header d-flex align-items-center gap-3 mb-3">
                <div class="company-logo-circle">
                    <c:choose>
                        <c:when test="${not empty jd.companyProfile}">
                            <img src="./files/serverImgs/${jd.companyProfile}" alt="${jd.companyName}" />
                        </c:when>
                        <c:otherwise>
                            <span style="font-size: 2rem; color:#16a085;"><i class="bi bi-building"></i></span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div>
                    <span class="company-name d-block">${jd.companyName}</span>
                    <a href="${jd.companyWebsite}" target="_blank" class="company-website">${jd.companyWebsite}</a>
                </div>
            </div>

            <div class="card-body px-0">
                <h5 class="job-title">${jd.jobTitle}</h5>
                <span class="job-role badge text-dark mb-3">${jd.jobRole}</span>
                <p class="job-description mt-3" id="job-desc-${jd.id}">${jd.jobDescription}</p>

                <div class="job-skills my-3">
                    <strong style="color: #692A84">Required Skills:</strong>
                    <c:if test="${not empty jd.jobSkills}">
                        <c:forEach var="skill" items="${fn:split(jd.jobSkills, ',')}">
                            <span class="badge skill-badge">${fn:trim(skill)}</span>
                        </c:forEach>
                    </c:if>
                </div>

                <a href="viewAndApply/${jd.id}" class="btn btn-outline-success w-100 mt-3">View & Apply</a>
            </div>

        </div>
    </div>
</c:forEach>

         </div>
         <!-- / row -->
      </div>
      <!-- / container -->
      <%@ include file="footerfile.jsp" %>

      <style>
         .boxed-portfolio .row {
         flex-wrap: nowrap; /* Prevent items from wrapping to the next line */
         overflow-x: auto; /* Allow horizontal scrolling if needed */
         }
         .boxed-portfolio .col-md-6 {
         flex: 0 0 auto; /* Don't allow items to grow or shrink */
         margin-right: 15px; /* Adjust margin between items */
         }
         .project {
         margin: 15px 0;
         }
         .no-gutter .project {
         margin: 0 !important;
         padding: 0 !important;
         }
         .has-spacer {
         margin-left: 30px;
         margin-right: 30px;
         margin-bottom: 30px;
         }
         .has-spacer-extra-space {
         margin-left: 30px;
         margin-right: 30px;
         margin-bottom: 30px;
         }
         .has-side-spacer {
         margin-left: 30px;
         margin-right: 30px;
         }
         .project-title {
         font-size: 1.25rem;
         }
         .project-skill {
         font-size: 0.9rem;
         font-weight: 400;
         letter-spacing: 0.06rem;
         }
         .project-info-box {
         margin: 15px 0;
         background-color: #fff;
         padding: 30px 40px;
         border-radius: 5px;
         }
         .project-info-box p {
         margin-bottom: 15px;
         padding-bottom: 15px;
         border-bottom: 1px solid #d5dadb;
         }
         .project-info-box p:last-child {
         margin-bottom: 0;
         padding-bottom: 0;
         border-bottom: none;
         }
         /*--- default effect ---*/
         .hovereffect {
         width: 100%;
         height: 100%;
         float: left;
         overflow: hidden;
         position: relative;
         text-align: center;
         z-index: 2;
         }
         .hovereffect .overlay {
         width: 100%;
         height: 100%;
         position: absolute;
         overflow: hidden;
         top: 0;
         left: 0;
         opacity: 0;
         background-color: rgba(0, 0, 0, 0.25);
         -webkit-transition: all .3s ease-in-out;
         transition: all .3s ease-in-out;
         border-radius: 5px;
         }
         .primary-dark .hovereffect .overlay {
         background-color: rgba(215, 48, 39, 0.95);
         }
         .white .hovereffect .overlay {
         background-color: rgba(255, 255, 255, 0.75);
         }
         .dark-overlay .hovereffect .overlay {
         background-color: rgba(0, 0, 0, 0.5);
         }
         .hovereffect img {
         display: block;
         position: relative;
         -webkit-transition: all .3s linear;
         transition: all .3s linear;
         border: 10px solid #fff;
         border-radius: 5px;
         }
         .no-image-border .hovereffect img {
         border: none;
         border-radius: 5px;
         }
         .no-image-border.no-gutter .hovereffect img, .no-image-border.no-gutter .hovereffect .overlay {
         border: none;
         border-radius: 0;
         }
         .hovereffect:hover img {
         -webkit-transform: rotate(-7deg) scale(1.33);
         -ms-transform: rotate(-7deg) scale(1.33);
         transform: rotate(-7deg) scale(1.33);
         }
         .hovereffect-title .project-title-wrapper {
         position: absolute;
         top: 45%;
         left: 0;
         margin-top: -32px;
         width: 100%;
         padding: 10px;
         -webkit-transition: all .5s ease-in-out;
         transition: all .5s ease-in-out;
         }
         .project:hover .hovereffect-title .project-title-wrapper {
         top: 50%;
         }
         .hovereffect-title .project-title {
         color: #fff;
         background: transparent;
         margin-bottom: 5px;
         }
         .white .hovereffect-title .project-title {
         color: #171819;
         }
         .hovereffect-title p {
         color: #fff;
         background: transparent;
         font-size: 12px;
         margin: 0;
         }
         .white .hovereffect-title p {
         color: #686c6d;
         }
         .hovereffect-title .hover-icons {
         font-size: 16px;
         background: transparent;
         position: absolute;
         bottom: 10%;
         left: 0;
         right: 0;
         -webkit-transition: all .3s ease-in-out;
         transition: all .3s ease-in-out;
         }
         .project:hover .hovereffect-title .hover-icons {
         bottom: 15%;
         }
         .hovereffect-title .hover-icons a {
         color: #fff;
         }
         .white .hovereffect-title .hover-icons a {
         color: #171819;
         }
         .hovereffect-title.project-icons {
         position: absolute;
         right: 0;
         bottom: -10px;
         -webkit-transition: all .5s ease-in-out;
         transition: all .5s ease-in-out;
         }
         .project:hover .hovereffect-title.project-icons {
         bottom: 0;
         }
         .hovereffect-title.project-icons a {
         display: inline-block;
         position: relative;
         color: #fff;
         font-size: 11px;
         line-height: 40px;
         width: 45px;
         height: 38px;
         background: #8e9294;
         opacity: 0.75;
         }
         .hovereffect-title.project-icons a i {
         margin-right: -2px;
         }
         .hovereffect-title.project-icons a:first-child {
         background-color: #7c8284;
         margin-right: -4px;
         }
         .project-icons a:hover, .project-icons a:first-child:hover {
         background-color: #505254 !important;
         opacity: 1;
         }
         .hovereffect-title.project-icons .hover-icons {
         color: #fff;
         position: relative;
         top: 0;
         left: 0;
         right: 0;
         margin-top: 0;
         opacity: 1;
         }
         .hovereffect-title.project-icons a:hover {
         background: #931c19;
         }
         .primary-dark .project-icons a {
         color: #d73027;
         background-color: #fff;
         }
         .primary-dark .project-icons a:hover {
         background-color: #efefef;
         }
         .primary-dark .project-icons a:hover {
         color: #fff;
         }
         .primary-dark .hovereffect-title.project-icons .hover-icons {
         color: #d73027;
         }
         .white .hovereffect-title .hover-icons {
         color: #171819;
         }
         .white .hovereffect-title.project-icons .hover-icons {
         color: #171819;
         }
         .hovereffect-title .hover-icons a {
         opacity: 0.7;
         margin: 0 4px;
         }
         .hovereffect-title .hover-icons a {
         opacity: 0.7;
         }
         .hovereffect-title .hover-icons a:hover {
         opacity: 1;
         }
         .hovereffect:hover .overlay {
         opacity: 1;
         filter: alpha(opacity=100);
         }
         .boxed-portfolio .card {
         background-color: #fff;
         -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.025), 0 1px 4px rgba(0, 0, 0, 0.05) !important;
         box-shadow: 0 1px 4px rgba(0, 0, 0, 0.025), 0 1px 4px rgba(0, 0, 0, 0.05) !important;
         }
         .boxed-portfolio .hovereffect img, .boxed-portfolio .hovereffect .overlay {
         border: none;
         border-bottom-left-radius: 0;
         border-bottom-right-radius: 0;
         }
         .boxed-portfolio .card {
         background-color: #fff;
         -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.025), 0 1px 4px rgba(0, 0, 0, 0.05) !important;
         box-shadow: 0 1px 4px rgba(0, 0, 0, 0.025), 0 1px 4px rgba(0, 0, 0, 0.05) !important;
         }
         .mb-0 {
         margin-bottom: 0 !important;
         }
         .card {
         background-color: transparent;
         border: none;
         border-radius: 5px;
         margin-bottom: 30px;
         }
         .mt-5 {
         margin-top: 5px !important;
         }
         .mb-0 {
         margin-bottom: 0 !important;
         }
         p {
         font-family: "Barlow", sans-serif !important;
         font-weight: 300;
         font-size: 1rem;
         color: #686c6d;
         letter-spacing: 0.03rem;
         margin-bottom: 10px;
         }


.container h1 {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Clean modern font */
    font-weight: 700;
    font-size: 2.5rem;
    color: #4a148c;
    text-transform: uppercase;
    letter-spacing: 4px;
    margin-bottom: 2rem;
    border-bottom: 3px solid #692A84;
    padding-bottom: 0.5rem;
    text-align:center;
}


.custom-job-card {
  border: 2px solid #e0e4ea;
  border-radius: 12px;
  box-shadow: 0 6px 18px rgba(22, 160, 133, 0.13), 0 1.5px 3px rgba(0,0,0,0.07);
}



         .job-header {
            gap:1.3rem;
         }

.company-logo-circle {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #f8f9fa;
  border: 2px solid #16a085;
}

.company-logo-circle img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
  display: block;
}



         .company-name {
             font-weight: 700;
             font-size: 1.2rem;
             color: #2c3e50;
         }
         .company-website {
             font-size: 0.9rem;
             color: #16a085;
             text-decoration: none;
         }
         .job-title {
             color: #34495e;
             font-weight: 600;
         }
         .job-role {
             font-size: 0.85rem;
             text-transform: uppercase;
             background-color: #44BBBD;
         }
         .job-description {
             color: #7f8c8d;
             font-size: 0.95rem;
             min-height: 80px;
             overflow: hidden;
             text-overflow: ellipsis;
         }
         .skill-badge {
             background-color: #d1f2eb;
             color: #16a085;
             margin-right: 4px;
             font-size: 0.8rem;
             padding: 5px 8px;
             border-radius: 12px;
         }
         .btn-success {
             background-color: #16a085;
             border: none;
             font-weight: 600;
         }
         .btn-success:hover {
             background-color: #13876b;
         }
      </style>
   </body>
   </body>
</html>
<script>
  (function() {
    const el = document.getElementById('job-desc-${jd.id}');
    if (el) {
      let words = el.textContent.split(/\s+/);
      if (words.length > 100) {
        el.textContent = words.slice(0,100).join(' ') + '...';
      }
    }
  })();
</script>