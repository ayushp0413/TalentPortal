<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->

  <title>Home</title>
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
                      YOU CAN<br>
                        EARN MONEY FROM FREELANCING<br>
                    ONLINE
                    </h1>

                    <p style="font:italic;">Welcome ${freelancer.name}</p>
                   
                    <div class="btn-box">
                      <a href="Explorejobs" class="btn-1">
                    Explore Jobs<i class="fa-solid fa-angles-right"></i>
                      </a>
                       <a href="Exploreproject" class="btn-2">
                       Explore Freelancing Project <i class="fa-solid fa-briefcase"></i>
                       </a>
                      
                     
                    </div>
                  </div>
                </div>
                <div class="offset-md-1 col-md-4 img-container">
                  <div class="img-box">
                    <img src="./files/images/slider-img.png" alt="">
                  </div>
                   
                        
                <div class="col-md-5 offset-md-1">
                  <div class="detail-box">
                   
                   
                    <div class="btn-box">
                      <a href="viewAllCompanies" class="btn-1">
                        Listed Companies with Talent Portal &nbsp;<i class="fa-regular fa-building"></i>
                      </a>
                      
                      
                     
                    </div>
                  </div>
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
                      YOU CAN<br>
                EARN MONEY FROM FREELANCING<br>
                    ONLINE
                    </h1>
                    <p style="font:italic;">Welcome ${freelancer.name}</p>
                   
                    <div class="btn-box">
                     <a href="Explorejobs" class="btn-1">
                    Explore Jobs<i class="fa-solid fa-angles-right"></i>
                      </a>
                       <a href="Exploreproject" class="btn-2">
                       Explore Freelancing Project <i class="fa-solid fa-briefcase"></i>
                       </a>
                     
                    </div>
                  </div>
                </div>
                <div class="offset-md-1 col-md-4 img-container">
                  <div class="img-box">
                    <img src="./files/images/slider-img.png" alt="">
                  </div>
                  
                   <div class="col-md-5 offset-md-1">
                  <div class="detail-box">
                   
                   
                    <div class="btn-box">
                      <a href="companies-view" class="btn-1">
                    Listed Companies with Talent Portal &nbsp;<i class="fa-regular fa-building"></i>
                      </a>
                      
                      
                     
                    </div>
                  </div>
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
                      YOU CAN<br>
                EARN MONEY FROM FREELANCING<br>
                    ONLINE
                    </h1>
                   <p style="font:italic;">Welcome ${freelancer.name}</p>
                   
                    <div class="btn-box">
                     <a href="Explorejobs" class="btn-1">
                    Explore Jobs<i class="fa-solid fa-angles-right"></i>
                      </a>
                       <a href="Exploreproject" class="btn-2">
                       Explore Freelancing Project <i class="fa-solid fa-briefcase"></i>
                       </a>
                     
                    </div>
                  </div>
                </div>
                <div class="offset-md-1 col-md-4 img-container">
                  <div class="img-box">
                    <img src="./files/images/slider-img.png" alt="">
                  </div>
                  
                   <div class="col-md-5 offset-md-1">
                  <div class="detail-box">
                   
                   
                    <div class="btn-box">
                      <a href="companies-view" class="btn-1">
                    Listed Companies with Talent Portal &nbsp;<i class="fa-regular fa-building"></i>
                      </a>
                      
                      
                     
                    </div>
                  </div>
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

  <style>

  .slider_section {
    position:relative;
    background: linear-gradient(90deg, rgba(0,191,165,0.8) 0%, rgba(0,165,188,0.8) 100%), url('./files/images/slider-bg.jpg') center center / cover no-repeat;
    color: white;
  }

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

   text-align:center;
  border-top: 5px solid;
  border-image:   linear-gradient(to right, grey 25%, yellow 25%, yellow 50%,red 50%, red 75%, teal 75%) 5;
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

  .slider_section {
    position:relative;
    background: linear-gradient(90deg, rgba(0,191,165,0.8) 0%, rgba(0,165,188,0.8) 100%), url('./files/images/slider-bg.jpg') center center / cover no-repeat;
    color: white;
  }



  
  </style>

  <!-- end client section -->

  <!-- end client section -->



  <!-- Footer section Start -->
  
   <%@ include file="footerfile.jsp" %>

  <!-- Footer Section end -->

</body>


</html>