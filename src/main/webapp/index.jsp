<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <!-- Basic -->
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <!-- Mobile Metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <!-- Site Metas -->
      <meta name="keywords" content="hire, hiring, jobs, job portal, talent portal" />
      <meta name="description" content="" />
      <meta name="author" content="" />
      <title>Welcome Talent Portal</title>
      <!-- bootstrap core css -->
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

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

      <div class="hero_area">
         <!-- header section starts -->
         <header class="header_section">
            <div class="container-fluid">
               <nav class="navbar navbar-expand-lg custom_nav-container">
                  <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                  <img src="./files/images/logo.png" alt="" />
                  <span class="logo-text">
                  Talent Portal
                  </span>
                  </a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                     <ul class="navbar-nav  ">
                        <li class="nav-item active">
                           <a class="nav-link" href="${pageContext.request.contextPath}/">Home &nbsp; <i class="fa-solid fa-house"></i> <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" href="#about"> About &nbsp; <i class="fa-solid fa-industry"></i></a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" href="registerFreelancer">Login As Freelancer &nbsp; <i class="fa-solid fa-users"></i></a>
                        </li>
                     </ul>
                     <div class="user_option">
                        <a href="registerCompany">
                        <span>
                        Login As Company &nbsp; <i class="fa-solid fa-building"></i>
                        </span>
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
                                    Hire the best <br>
                                    freelancers for any job, <br>
                                    online.
                                 </h1>
                                 <p class="subtitle">
                                    World's largest freelance marketplace
                                 </p>
                                 <div class="btn-box">
                                    <a href="loginCompany" class="btn-1">
                                    Hire a Freelancer &nbsp;<i class="fa-brands fa-hive"></i>
                                    </a>
                                    <a href="loginFreelancer" class="btn-2">
                                    Earn Money Freelancing &nbsp; <i class="fa-solid fa-dollar-sign"></i>
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
                                 <p class="subtitle">
                                    Save up to 90% & get quotes for free
                                 </p>
                                 <div class="btn-box">
                                    <a href="loginCompany" class="btn-1">
                                    Hire a Freelancer &nbsp;<i class="fa-brands fa-hive"></i>
                                    </a>
                                    <a href="loginFreelancer" class="btn-2">
                                    Earn Money Freelancing &nbsp; <i class="fa-solid fa-dollar-sign"></i>
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
                                    Earn Money from Freelancing <br>
                                    Online
                                 </h1>
                                 <p class="subtitle">
                                    Any job you can possibly think of
                                 </p>
                                 <div class="btn-box">
                                    <a href="loginCompany" class="btn-1">
                                    Hire a Freelancer &nbsp;<i class="fa-brands fa-hive"></i>
                                    </a>
                                    <a href="loginFreelancer" class="btn-2">
                                    Earn Money Freelancing &nbsp; <i class="fa-solid fa-dollar-sign"></i>
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
      </div>


<!-- Experience section -->
<section class="experience_section layout_padding">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-5">
        <div class="img-box">
          <img src="./files/images/experience-img.jpg" alt="Experienced Freelancer">
        </div>
      </div>
      <div class="col-md-7">
        <div class="detail-box">
          <div class="heading_container">
            <h2 class="experience_title">
              Best Experienced Freelancer Here
            </h2>
          </div>
          <p class="experience_subtitle">
            Let's collaborate to transform your vision into reality. Partner with a seasoned freelancer who prioritizes professionalism, reliability, and outstanding outcomes. Your project deserves nothing less than the best, and I'm here to deliver precisely that.
          </p>
          <div class="btn-box">
            <a href="loginCompany" class="btn-2">
              Hire
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


        <!-- Slider Section velocity scroll -->
      <div class="slider-container">
         <div class="slider">
            <span>Explore Project</span>
            <span>Jobs</span>
            <span>Freelancing</span>
            <span>Hire Freelancer</span>
            <span>Explore Project</span>
         </div>
      </div>

<!-- About Section -->
      <section class="about_section layout_padding" id="about">
        <div class="container">
          <!-- Centered heading -->
          <h2 class="about_main_heading">About <span style="border-bottom:1.5px solid #060270; !important">TalentPortal</span> Company</h2>

          <!-- Two equal columns -->
          <div class="about_content">
            <div class="about_image">
              <img src="./files/images/about-img.jpg" alt="About TalentPortal Company" />
            </div>
            <div class="about_text">
              <div class="mission">
                <h3 style="color:#065084;">Mission</h3>
                <p>
                  To connect businesses with the best freelance talent available worldwide, delivering excellence, reliability, and successful project outcomes.
                </p>
              </div>
              <div class="vision">
                <h3 style="color:#065084;">Vision</h3>
                <p>
                  To be the leading platform where creative professionals and companies collaborate seamlessly to innovate and grow.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>




      <!-- freelance section -->
      <section class="freelance_section ">
         <div id="accordion">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-5 offset-md-1">
                     <div class="detail-box">
                        <div class="heading_container">
                           <h2>
                              Work Freelaner Has Done
                           </h2>
                        </div>
                        <div class="tab_container">
                           <div class="t-link-box" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              <div class="img-box">
                                 <img src="./files/images/pngegg (1).png" alt="">
                              </div>
                              <div class="detail-box">
                                 <h5>
                                    250+
                                 </h5>
                                 <h3>
                                    Worldwide Freelancer
                                 </h3>
                              </div>
                           </div>
                           <div class="t-link-box collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                              <div class="img-box">
                                 <img src="./files/images/f2.png" alt="">
                              </div>
                              <div class="detail-box">
                                 <h5>
                                    500+
                                 </h5>
                                 <h3>
                                    Total Jobs Listings
                                 </h3>
                              </div>
                           </div>
                           <div class="t-link-box collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              <div class="img-box">
                                 <img src="./files/images/f3.png" alt="">
                              </div>
                              <div class="detail-box">
                                 <h5>
                                    250+
                                 </h5>
                                 <h3>
                                    Total Freelancing Projects
                                 </h3>
                              </div>
                           </div>
                           <div class="t-link-box collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                              <div class="img-box">
                                 <img src="./files/images/f4.png" alt="">
                              </div>
                              <div class="detail-box">
                                 <h5>
                                    989+
                                 </h5>
                                 <h3>
                                    Total Partners  <br>
                                    Companies
                                 </h3>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="collapse show" id="collapseOne" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="img-box">
                           <img src="./files/images/freelance-img.jpg" alt="">
                        </div>
                     </div>
                     <div class="collapse" id="collapseTwo" aria-labelledby="headingTwo" data-parent="#accordion">
                        <div class="img-box">
                           <img src="./files/images/freelance-img.jpg" alt="">
                        </div>
                     </div>
                     <div class="collapse" id="collapseThree" aria-labelledby="headingThree" data-parent="#accordion">
                        <div class="img-box">
                           <img src="./files/images/freelance-img.jpg" alt="">
                        </div>
                     </div>
                     <div class="collapse" id="collapseFour" aria-labelledby="headingfour" data-parent="#accordion">
                        <div class="img-box">
                           <img src="./files/images/freelance-img.jpg" alt="">
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end freelance section -->


      <!-- testimonal section -->
      <section class="client_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-9 col-md-10 mx-auto">
                  <div class="heading_container">
                     <h2 style="color: #00bfa5;">
                        Testimonial
                     </h2>
                  </div>
                  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <div class="detail-box">
                              <h4>
                                 Ayush Patidar
                              </h4>
                              <p>
                                 This is Best Platform for Freelancer Where they can earn money through freelancing and get unlimited opprtunity to work on Sereval Project
                              </p>
                              <img src="./files/images/quote.png" alt="">
                           </div>
                        </div>
                        <div class="carousel-item">
                           <div class="detail-box">
                              <h4>
                                 Hritik Patidar
                              </h4>
                              <p>
                                 Their platform is user-friendly, their team is responsive and professional, and their commitment to quality is unmatched. Thanks to ProjectPulse, we were able to find the perfect freelancer for our project, and the results exceeded our expectations.
                              </p>
                              <img src="./files/images/quote.png" alt="">
                           </div>
                        </div>
                        <div class="carousel-item">
                           <div class="detail-box">
                              <h4>
                                 Naman Tyagi
                              </h4>
                              <p>
                                 The platform is intuitive, making it simple to browse profiles, communicate with freelancers, and manage projects. We've been consistently impressed with the quality of talent available on ProjectPulse, and the level of professionalism exhibited by both the freelancers and the ProjectPulse team.
                              </p>
                              <img src="./files/images/quote.png" alt="">
                           </div>
                        </div>
                     </div>
                     <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                     <span class="sr-only">Previous</span>
                     </a>
                     <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                     <span class="sr-only">Next</span>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end client section -->



      <!-- footer section -->
      <section class="footer-section">
        <div class="footer-container">
          <div class="footer-top">
            <div class="footer-logo-social">
              <div class="footer-logo">
               <img src="./files/images/logo.png" alt="TalentPortalLogo" />
                <span>TalentPortal</span>

              </div>
              <div class="footer-social">
                <a href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" aria-label="Facebook">
                  <img src="./files/images/fb.png" alt="Facebook" />
                </a>
                <a href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" aria-label="Twitter">
                  <img src="./files/images/twitter.png" alt="Twitter" />
                </a>
                <a href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" aria-label="LinkedIn">
                  <img src="./files/images/linkedin.png" alt="LinkedIn" />
                </a>
                <a href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" aria-label="Instagram">
                  <img src="./files/images/instagram.png" alt="Instagram" />
                </a>
                <a href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" aria-label="YouTube">
                  <img src="./files/images/youtube.png" alt="YouTube" />
                </a>
              </div>
            </div>

            <div class="footer-links">
              <div>
                <h5>Useful Links</h5>
                <ul>
                  <li><a href="/TalentPortal">Home</a></li>
                  <li><a href="/TalentPortal">About</a></li>
                  <li><a href="/TalentPortal">Work</a></li>
                  <li><a href="/TalentPortal">Category</a></li>
                </ul>
              </div>
              <div>
                <h5>Our Office</h5>
                <p>Indore, Madhya Pradesh</p>
              </div>
              <div>
                <h5>Founder</h5>
                <p><a class="name-link" href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" target="_blank" rel="noopener noreferrer">Ayush Patidar</a></p>
              </div>
              <div>
                <h5>Subscribe to Newsletter</h5>
                <form class="newsletter-form" action="">
                  <input type="email" placeholder="Enter your email" required />
                  <button type="submit">Subscribe</button>
                </form>
              </div>
            </div>
          </div>

          <div class="footer-contact">
            <a href="#" class="contact-box" aria-label="Location">
              <img src="./files/images/location.png" alt="Location Icon" />
              <span>Ujjain, Madhya Pradesh</span>
            </a>
            <a href="mailto:ayushpatidar13@gmail.com" class="contact-box" aria-label="Email">
              <img src="./files/images/mail.png" alt="Mail Icon" />
              <span>ayushpatidar13@gmail.com</span>
            </a>
            <a href="tel:+78060XXXXX" class="contact-box" aria-label="Phone">
              <img src="./files/images/call.png" alt="Phone Icon" />
              <span>+91 78060 XXXXX</span>
            </a>
          </div>

          <div class="footer-bottom">
            <p>
              &copy; <span id="year"></span> All Rights Reserved By
              <a href="https://html.design/" target="_blank" rel="noopener noreferrer">Ayush Patidar</a>
            </p>
          </div>
        </div>
      </section>

      <script src="./files/js/jquery-3.4.1.min.js"></script>
      <script src="./files/js/bootstrap.js"></script>
      <script src="./files/js/custom.js"></script>
<script>
  document.getElementById("year").textContent = new Date().getFullYear();
</script>
<style>

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

/* Experience Section */
.experience_section {
  padding: 6rem 0;
  background-color: #f9fafb;
  color: #333;
  font-family: 'Poppins', sans-serif;
}

.experience_section .img-box:hover img {
  transform: scale(1.05);
}

.experience_section .experience_title {
  font-size: 2.5rem;
  font-weight: 700;
  color: #00bfa5; /* accent color */
  margin-bottom: 1.5rem;
}

.experience_section .experience_subtitle {
  font-size: 1.15rem;
  color: #555;
  line-height: 1.6;
  margin-bottom: 2rem;
}

.experience_section .btn-box {
  display: flex;
  gap: 1rem;
}

.experience_section a.btn-2 {
  background: transparent;
  color: #00bfa5;
  border: 2px solid #00bfa5;
  border-radius: 50px;
  padding: 12px 30px;
  font-weight: 600;
  transition: all 0.3s ease;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  white-space: nowrap;
}

.experience_section a.btn-2:hover {
  background-color: #00bfa5;
  color: white;
  text-decoration: none;
}

/* Responsive */
@media (max-width: 768px) {
  .experience_section {
    padding: 3rem 1rem;
  }
  .experience_section .experience_title {
    font-size: 2rem;
  }
  .experience_section .experience_subtitle {
    font-size: 1rem;
  }
  .experience_section .row {
    flex-direction: column;
  }
  .experience_section .img-box {
    margin-bottom: 2rem;
  }
}

.slider-container {
  overflow: hidden;
  white-space: nowrap;
  width: 100%;
  background: #03221E;
  padding: 2.4rem;
  box-sizing: border-box;
}

.slider {
  display: inline-block;
  animation: scroll-right-to-left 10s linear infinite;
  white-space: nowrap;
  font-size: 1.5rem;
  color: #00bfa5;
  font-weight: 600;
  font-family: 'Poppins', sans-serif;
}

.slider span {
  margin: 0 2rem; /* spacing between items */
  display: inline-block;
}

/* Keyframes for left-to-right scrolling */
@keyframes scroll-right-to-left {
  0% {
    transform: translateX(50%);
  }
  100% {
    transform: translateX(-10%);
  }
}


/* About Section */
/* Main centered heading */
.about_main_heading {
  text-align: center;
  color: #00bfa5; /* green accent color */
  font-family: 'Poppins', sans-serif;
  font-weight: 700;
  font-size: 2.8rem;
  margin-bottom: 3rem;
}

/* Container for image and text side by side */
.about_content {
  display: flex;
  gap: 3rem;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap; /* for responsiveness */
}

/* Left side: image */
.about_image, .about_text {
  flex: 1 1 45%; /* Grow and shrink equally, base width about 45% to leave gap */
  max-width: 45%;
  box-sizing: border-box;
}

/* Image styling */
.about_image img {
  width: 100%;
  height: auto;
  border-radius: 20px;
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
  transition: transform 0.4s ease;
}

.about_image img:hover {
  transform: scale(1.05);
}

/* Text container */
.about_text {
  font-family: 'Poppins', sans-serif;
  color: #333333;
}

/* Mission and Vision blocks */
.about_text > div {
  margin-bottom: 2.5rem;
}

/* Small headings for Mission and Vision */
.about_text h3 {
  font-size: 1.8rem;
  color: #00bfa5;
  font-weight: 700;
  margin-bottom: 0.8rem;
}

/* Paragraph text */
.about_text p {
  font-size: 1.15rem;
  line-height: 1.6;
  color: #555555;
}

/* Responsive: Stack columns on small screens */
@media (max-width: 768px) {
  .about_content {
    flex-direction: column;
  }
  .about_image, .about_text {
    max-width: 100%;
    flex: 1 1 100%;
  }
  .about_main_heading {
    font-size: 2.2rem;
    margin-bottom: 2rem;
  }
  .about_text h3 {
    font-size: 1.5rem;
  }
  .about_text p {
    font-size: 1rem;
  }
}

.footer-section {
  background-color: #04373D;
  color:#00bfa5;
  padding: 40px 20px 20px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.footer-container {
  max-width: 1200px;
  margin: auto;
}

.footer-top {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  gap: 40px;
  border-bottom: 1px solid #444;
  padding-bottom: 30px;
  margin-bottom: 20px;
}

.footer-logo-social {
  flex: 1 1 250px;
}

.footer-logo {
  display: flex;
  align-items: center;
  gap: 15px;
  margin-bottom: 15px;
  font-weight: 700;
  font-size: 24px;
  color: #00bfa5;
}

.footer-logo img {
  height: 40px;
  width: auto;
}

.footer-social a {
  display: inline-block;
  margin-right: 12px;
  transition: transform 0.3s ease;
}

.footer-social a img {
  width: 26px;
  height: 26px;
  filter: brightness(0) invert(1);
  transition: filter 0.3s ease;
}

.footer-social a:hover img {
  filter: brightness(1) invert(0);
  transform: scale(1.1);
}

.footer-links {
  display: flex;
  flex: 2 1 600px;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 20px;
}

.footer-links > div {
  flex: 1 1 200px;
}

.footer-links h5 {
  font-size: 18px;
  margin-bottom: 12px;
  color: #00bfa5;
}

.footer-links ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.footer-links ul li {
  margin-bottom: 10px;
}

.footer-links ul li a {
  color: #ccc;
  text-decoration: none;
  transition: color 0.3s ease;
}

.footer-links ul li a:hover {
  color: #00bfa5;
}

.footer-links p {
  color: #ccc;
  font-size: 15px;
  line-height: 1.4;
}

.footer-links p:hover {
  color: #00bfa5;
  cursor: pointer;
}


.newsletter-form {
  display: flex;
  gap: 10px;
  margin-top: 8px;
}

.newsletter-form input[type="email"] {
  flex: 1;
  padding: 10px 12px;
  border-radius: 4px;
  border: none;
  font-size: 14px;
  outline: none;
}

.newsletter-form button {
  background-color: #00bfa5;
  border: none;
  padding: 10px 18px;
  color: #fff;
  font-weight: 600;
  cursor: pointer;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.newsletter-form button:hover {
  background-color: #2E766F;
}

.footer-contact {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 40px;
  margin-bottom: 20px;
}

.contact-box {
  display: flex;
  align-items: center;
  gap: 12px;
  color: #ccc;
  text-decoration: none;
  font-size: 16px;
  transition: color 0.3s ease;
}

.contact-box img {
  width: 26px;
  height: 26px;
  filter: brightness(0) invert(1);
  transition: filter 0.3s ease;
}

.contact-box:hover {
  color: #f39c12;
}

.contact-box:hover img {
  filter: brightness(1) invert(0);
}

.footer-bottom {
  text-align: center;
  font-size: 14px;
  color: #777;
  border-top: 1px solid #444;
  padding-top: 15px;
}

.name-link {
    color: #d87e0e;
    text-decoration: none;
    font-weight: 600;
}


.name-link:hover {
    color: #00bfa5;
}



.footer-bottom a {
  color: #00bfa5;
  text-decoration: none;
  font-weight: 600;
  transition: color 0.3s ease;
}

.footer-bottom a:hover {
  color: #d87e0e;
}

/* Responsive */

@media (max-width: 768px) {
  .footer-top {
    flex-direction: column;
  }
  .footer-links {
    flex-direction: column;
  }
  .footer-contact {
    flex-direction: column;
  }
}
</style>
   </body>
   </body>
</html>