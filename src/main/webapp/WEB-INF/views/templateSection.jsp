
<!-- Experience section -->
<section class="experience_section layout_padding">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-5 experience_content">
        <div class="img-box experience_content">
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

<style>


/* Experience Section */
.experience_section {
  padding: 6rem 0;
  background-color: #f9fafb;
  color: #333;
  font-family: 'Poppins', sans-serif;
  transition: all 0.3s ease;
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


</style>